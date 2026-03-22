return {
  "HiPhish/rainbow-delimiters.nvim",
  dependencies = "nvim-treesitter/nvim-treesitter",
  config = function()
    local rainbow_delimiters = require 'rainbow-delimiters'

    -- On définit des couleurs vives manuellement pour être sûr du rendu
    -- Tu peux changer les codes HEX (#...) par ceux exacts de ton thème
    local colors = {
      white  = "#FFFFFF",
      pink   = "#FF79C6",
      cyan   = "#8BE9FD",
      green  = "#50FA7B",
      violet = "#BD93F9",
      orange = "#FFB86C",
    }

    -- Application des couleurs aux groupes de highlight
    vim.api.nvim_set_hl(0, 'RainbowDelimiterWhite',  { fg = colors.white })
    vim.api.nvim_set_hl(0, 'RainbowDelimiterPink',   { fg = colors.pink })
    vim.api.nvim_set_hl(0, 'RainbowDelimiterCyan',   { fg = colors.cyan })
    vim.api.nvim_set_hl(0, 'RainbowDelimiterGreen',  { fg = colors.green })
    vim.api.nvim_set_hl(0, 'RainbowDelimiterViolet', { fg = colors.violet })
    vim.api.nvim_set_hl(0, 'RainbowDelimiterOrange', { fg = colors.orange })

    vim.g.rainbow_delimiters = {
      strategy = {
        [''] = rainbow_delimiters.strategy['global'],
        vim = rainbow_delimiters.strategy['local'],
      },
      query = {
        [''] = 'rainbow-delimiters',
        lua = 'rainbow-blocks',
      },
      highlight = {
        'RainbowDelimiterWhite',
        'RainbowDelimiterPink',
        'RainbowDelimiterCyan',
        'RainbowDelimiterGreen',
        'RainbowDelimiterViolet',
        'RainbowDelimiterOrange',
      },
    }
  end
}
