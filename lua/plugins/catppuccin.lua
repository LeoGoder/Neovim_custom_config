return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,    -- On le charge au démarrage
  priority = 1000, -- Avant les autres plugins
  config = function()
    require('catppuccin').setup({
      flavour = "mocha", -- "latte", "frappe", "macchiato", ou "mocha"

      transparent_background = true,
      term_colors = true,

      dim_inactive = {
        enabled = false,
      },

      styles = {
        comments = { "italic" },
        functions = {},
        keywords = { "italic" },
        statements = { "bold" },
        variables = {},
        types = {},
      },
    })

    -- Active le thème nativement pour ta config custom=
	-- vim.cmd.colorscheme("catppuccin-mocha")
  end,
}
