return {
  "saghen/blink.cmp",
  -- Utilisez une version spécifique pour la stabilité
  version = "v0.*",
  
  dependencies = {
    -- Remplace LuaSnip : Blink lit nativement cette bibliothèque de snippets
    "rafamadriz/friendly-snippets",
  },

  opts = {
    -- Vos raccourcis clavier habituels
    keymap = {
      preset = 'none', -- Désactive les touches par défaut pour utiliser les vôtres
      ['<C-k>'] = { 'select_prev', 'fallback' },
      ['<C-j>'] = { 'select_next', 'fallback' },
      ['<C-Space>'] = { 'show', 'show_documentation', 'hide_documentation' },
      ['<C-e>'] = { 'hide', 'fallback' },
      ['<CR>'] = { 'accept', 'fallback' },
    },

    -- Configuration de l'apparence des fenêtres (Bordures arrondies)
    completion = {
      menu = { 
        border = 'rounded',
      },
      documentation = { 
        auto_show = true,
        window = { border = 'rounded' } 
      },
    },

    appearance = {
      -- Permet de définir si vous utilisez une police Nerd Font (recommandé)
      use_nvim_cmp_as_default = false,
      nerd_font_variant = 'mono',
    },

    -- L'ordre d'importance de vos sources de complétion (intégré directement dans Blink)
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
  },
}
