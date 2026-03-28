return {
  "neovim/nvim-lspconfig", -- Le plugin principal pour configurer le LSP
  enabled = false,
  dependencies = {
    "williamboman/mason.nvim",           -- Le gestionnaire/installateur de serveurs LSP
    "williamboman/mason-lspconfig.nvim", -- Fait le lien entre Mason et lspconfig
    "hrsh7th/cmp-nvim-lsp",              -- Permet à nvim-cmp de lire les suggestions du LSP
  },
  config = function()
    -- 1. Initialiser Mason (l'interface visuelle)
    require("mason").setup()

    -- 2. Configurer mason-lspconfig
    -- Dans les nouvelles versions, il se charge de démarrer les serveurs tout seul !
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls" },
    })

    -- 3. NOUVELLE MÉTHODE : On injecte les capacités d'autocomplétion 
    -- par défaut pour ABSOLUMENT TOUS les serveurs LSP (présents et futurs)
    local lspconfig_defaults = require("lspconfig").util.default_config
    lspconfig_defaults.capabilities = vim.tbl_deep_extend(
      "force",
      lspconfig_defaults.capabilities,
      require("cmp_nvim_lsp").default_capabilities()
    )
-- ==========================================================
    -- Configuration de l'affichage des erreurs et warnings
    -- ==========================================================
    vim.diagnostic.config({
      -- Affiche le texte d'erreur directement à la fin de la ligne (Virtual Text)
      virtual_text = {
        prefix = '●', -- Le petit symbole avant le texte (tu peux mettre '■' ou 'x' si tu préfères)
        source = "if_many", -- Affiche la source (ex: rust_analyzer) s'il y a plusieurs LSP
      },
      
      -- Affiche les icônes dans la marge tout à gauche
      signs = true,
      
      -- Souligne le bout de code qui pose problème
      underline = true,
      
      -- Ne met pas à jour les erreurs pendant que tu tapes (attends que tu sortes du mode insertion)
      -- C'est beaucoup plus agréable pour ne pas voir l'écran clignoter en rouge à chaque lettre !
      update_in_insert = false,
      -- Trie les problèmes pour toujours afficher les erreurs fatales en premier
      severity_sort = true,
    })

    -- Ajout des icônes classiques de LazyVim pour la marge de gauche
    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    -- 4. Quelques raccourcis clavier très utiles pour le LSP
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Aller à la définition" })
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "Afficher la documentation" })
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "Actions de code" })
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = "Renommer" })
  end,
}
