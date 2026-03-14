return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function()
      -- 1. On définit une palette de couleurs
      local colors = {
        bg       = "#16161e", -- Couleur de fond sombre pour le milieu
        fg       = "#c0caf5",
        yellow   = "#e0af68",
        cyan     = "#7dcfff",
        green    = "#9ece6a",
        orange   = "#ff9e64",
        magenta  = "#bb9af7",
        blue     = "#7aa2f7",
        red      = "#f7768e",
        grey     = "#808080",
        white     = "#ffffff",
        slate_grey = "#2c323c",
        deep_plum = "#2d2a2e",
        mid_blue = "#1e1e2e",
      }

      local icons = {
        nvim = " ",
        nvim_style2 = " ",
        vim = " ",
        vim_style2 = " ",
        chevron = " ",
        terminal_cursor = "󰅩 ",
        rocket = "󱓞 ",
        gros_crane = "󰚌 ",
        fire = " ",
        apple = " ",
        linux = " ",
        windows = " ",
        space_invader = "󰯉 ",
        playstation = "󰐔 "
      }

      -- 2. On crée le thème personnalisé
      local my_custom_theme = {
        normal = {
          a = { fg = colors.bg, bg = colors.orange, gui = "NONE" }, -- Mode Normal
          b = { fg = colors.bg, bg = colors.white },
          c = { fg = colors.orange, bg = colors.bg },               -- LE MILIEU (Normal)
        },
        insert = {
          a = { fg = colors.bg, bg = colors.red, gui = "NONE" }, -- Mode Insertion
          c = { fg = colors.red, bg = colors.bg },
        },
        visual = {
          a = { fg = colors.bg, bg = colors.magenta, gui = "NONE" }, -- Mode Visuel
          c = { fg = colors.magenta, bg = colors.bg },
        },
        replace = {
          a = { fg = colors.bg, bg = colors.yellow, gui = "NONE" },    -- Mode Remplacement
          c = { fg = colors.yellow, bg = colors.bg },
        },
        command = {
          a = { fg = colors.bg, bg = colors.red, gui = "NONE" }, -- Mode Commande
          c = { fg = colors.red, bg = colors.bg },
        },
      }

      -- 3. On retourne la configuration complète
      return {
        options = {
          theme = my_custom_theme, -- On applique notre thème
          section_separators = { left = "", right = "" },
          component_separators = { left = "|", right = "|" },
          globalstatus = true,
        },
        sections = {
          lualine_a = { { "mode", fmt = function(str) return icons.space_invader .. (str:sub(1, 1) == "V" and "VISUAL" or str) end } },
          lualine_b = { "branch" },
          lualine_c = { "filetype", "filename" }, -- C'est ici le milieu
          lualine_x = { "encoding", "fileformat" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      }
    end,
  },
}
