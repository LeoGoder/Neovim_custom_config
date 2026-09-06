local lualine_enabled = true

return {
  {
    "nvim-lualine/lualine.nvim",
    enabled = lualine_enabled,
    opts = function()
      -- 1. On définit une palette de couleurs
      local colors = {
        bg       = "#16161e", -- Couleur de fond sombre pour le milieu
        fg       = "#c0caf5",
        yellow   = "#e0af68",
	yellow_sky   = "#ebc98a",
        cyan     = "#7dcfff",
        green    = "#9ece6a",
        orange   = "#ff9e64",
	abricot   = "#ffba8c",
	red_pink      = "#f99bb0",
	green_sky    = "#b6d88c",
        magenta  = "#bb9af7",
        blue     = "#7aa2f7",
	teal     = "#8eddd0",
        red      = "#f7768e",
	purple       = "#BD93F9",
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
        playstation = "󰐔 ",
	git = "",
      }

      -- 2. On crée le thème personnalisé
      local my_custom_theme = {
        normal = {
          a = { fg = colors.bg, bg = colors.blue, gui = "NONE" }, -- Mode Normal
          b = { fg = colors.white, bg = "NONE" },
          c = { fg = colors.white, bg = "NONE" },               -- LE MILIEU (Normal)
        },
        insert = {
          a = { fg = colors.bg, bg = colors.red_pink, gui = "NONE" }, -- Mode Insertion
          b = { fg = colors.white, bg = "NONE" },
          c = { fg = colors.white, bg = "NONE" },
        },
        visual = {
          a = { fg = colors.bg, bg = colors.purple, gui = "NONE" }, -- Mode Visuel
          b = { fg = colors.white, bg = "NONE" },
          c = { fg = colors.white, bg = "NONE" },
        },
        replace = {
          a = { fg = colors.bg, bg = colors.yellow_sky, gui = "NONE" },    -- Mode Remplacement
          b = { fg = colors.white, bg = "NONE" },
          c = { fg = colors.white, bg = "NONE" },
        },
        command = {
          a = { fg = colors.bg, bg = colors.abricot, gui = "NONE" }, -- Mode Commande
          b = { fg = colors.white, bg = "NONE" },
          c = { fg = colors.white, bg = "NONE" },
        },
      }

	local function lsp_clients()
	  local clients = vim.lsp.get_clients({ bufnr = 0 })
	  if #clients == 0 then
	    return "Aucun LSP"
	  end
	  local client_names = {}
	  for _, client in ipairs(clients) do
	    table.insert(client_names, client.name)
	  end
	  return " " .. table.concat(client_names, ", ")
	end
      -- 3. On retourne la configuration complète
      return {
        options = {
          theme = my_custom_theme, -- On applique notre thème
	  -- section_separators = { left = "", right = "" },
          -- component_separators = { left = "", right = "" },
	  -- section_separators = { left = "", right = "" },
      -- component_separators = { left = "", right = "" },
	  section_separators = { left = "", right = "" },
	  component_separators = { left = "", right = "" },
      -- section_separators = { left = "", right = "" },
      -- component_separators = { left = "|", right = "|" },
          globalstatus = true,
        },
	sections = {
	  lualine_a = { { "mode", fmt = function(str) return (str:sub(1, 1) == "V" and "VISUAL" or str) end } },
	  lualine_b = {
        -- {
	    -- "filetype", 
        -- icon_only = false,
        -- separator = "",
        -- padding = { left = 1, right = 0},
        -- },
        {
	    "filename",
        padding = { left = 1, right = 1},
        },
    },
	  lualine_c = {
        {"branch", icon = icons.git},
	    {
	      "diagnostics",
	      sources = { "nvim_diagnostic" },
	      symbols = { error = " ", warn = " ", info = " ", hint = " " },
	    }
	  },
	  lualine_x = {
	    {
	      lsp_clients,
	    },
	    -- "encoding", 
	    "fileformat"
	  },
	  lualine_y = { "progress" },
	  lualine_z = { "location" },
	},
      }
    end,
  },
}
