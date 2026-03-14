return {
  "neovim/nvim-lspconfig", -- Le plugin principal pour configurer le LSP
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

    -- 4. Quelques raccourcis clavier très utiles pour le LSP
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Aller à la définition" })
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "Afficher la documentation" })
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "Actions de code" })
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = "Renommer" })
  end,
}
