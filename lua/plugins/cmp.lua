return {
  "hrsh7th/nvim-cmp",
  enabled = true,
  -- Lazy permet de définir des dépendances : ces plugins seront installés en même temps
  dependencies = {
    "hrsh7th/cmp-buffer",       -- Suggère les mots déjà présents dans le fichier
    "hrsh7th/cmp-path",         -- Suggère les chemins de fichiers (pratique pour les imports)
    "L3MON4D3/LuaSnip",         -- Le moteur de snippets (obligatoire pour cmp)
    "saadparwaiz1/cmp_luasnip", -- Fait le lien entre LuaSnip et nvim-cmp
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    cmp.setup({
      -- ==========================================================
      -- Configuration de l'apparence des fenêtres (Bordures)
      -- ==========================================================
      window = {
        -- Bordures arrondies pour le menu principal de complétion
        completion = cmp.config.window.bordered({
          border = "rounded",
          winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
        }),
        -- Bordures arrondies pour la petite fenêtre de documentation à côté
        documentation = cmp.config.window.bordered({
          border = "rounded",
          winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
        }),
      },

      -- Obligatoire : dire à nvim-cmp quel moteur de snippets utiliser
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      -- Tes raccourcis clavier pour naviguer dans le menu
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- Ctrl+k pour monter
        ["<C-j>"] = cmp.mapping.select_next_item(), -- Ctrl+j pour descendre
        ["<C-Space>"] = cmp.mapping.complete(),     -- Ctrl+Espace pour forcer l'affichage du menu
        ["<C-e>"] = cmp.mapping.abort(),            -- Ctrl+e pour fermer le menu
        ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Entrée pour valider la suggestion
      }),

      -- L'ordre d'importance de tes sources de complétion
      sources = cmp.config.sources({
        { name = "nvim_lsp" }, -- En premier, les lsp
        { name = "luasnip" },  -- En deuxieme, les snippets
        { name = "buffer" },   -- Ensuite, le texte du fichier
        { name = "path" },     -- Et les chemins de fichiers
      }),
    })
  end,
}
