return {
  "folke/tokyonight.nvim",
  name = "tokyonight",
  lazy = false,    -- On le charge au démarrage
  priority = 1000, -- Avant les autres plugins
  config = function()
    require("tokyonight").setup({
      -- L'équivalent de "mocha" (sombre) chez Tokyonight est "night" ou "storm"
      style = "night", 
      
      transparent = false,     -- Équivalent de transparent_background = false
      terminal_colors = true,  -- Équivalent de term_colors = true
      dim_inactive = false,    -- Équivalent de dim_inactive = { enabled = false }

      styles = {
        -- Configuration des styles de syntaxe
        comments = { italic = true }, -- Équivalent de comments = { "italic" }
        keywords = { italic = true }, -- Équivalent de keywords = { "italic" }
        functions = {},
        variables = {},
        
        -- Note : Tokyonight n'a pas de clé native "statements" dans ce bloc, 
        -- les "statements" héritent généralement des "keywords".
      },
    })

    -- Active le thème
    vim.cmd.colorscheme("tokyonight")
  end,
}
