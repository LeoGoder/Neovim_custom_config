local lualine_enabled = false

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

      local hot_colors = {
	sky_blue_light = "8ecae6",
	blue_green = "219ebc",
	deep_space_blue = "023047",
	amber_flame = "ffb703",
	tiger_orange = "fb8500",
      }

      local tropicals = {
	cerulean = "227c9d",
	ocean_mist = "17c3b2",
	apricot_cream = "ffcb77",
	floral_white = "fef9ef",
	grapefruit_pink = "fe6d73"
      }

	local dracula = {
	    background   = "#282A36",
	    current_line = "#44475A",
	    selection    = "#44475A",
	    foreground   = "#F8F8F2",
	    comment      = "#6272A4",
	    red          = "#FF5555",
	    orange       = "#FFB86C",
	    yellow       = "#F1FA8C",
	    green        = "#50FA7B",
	    cyan         = "#8BE9FD",
	    purple       = "#BD93F9",
	    pink         = "#FF79C6",
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

	local lualine_theme_sunset = {
	  normal = {
	    -- Mode Normal : Orange vif
	    a = { fg = hot_colors.deep_space_blue, bg = hot_colors.tiger_orange, gui = "bold" },
	    -- Section B (ex: Git branch) : Bleu moyen sur fond bleu très foncé
	    b = { fg = hot_colors.sky_blue_light, bg = hot_colors.deep_space_blue },
	    -- Le Milieu : Texte discret, fond transparent ou de ton terminal
	    c = { fg = hot_colors.blue_green, bg = "NONE" }, 
	  },
	  insert = {
	    -- Mode Insertion : Bleu clair lumineux
	    a = { fg = hot_colors.deep_space_blue, bg = hot_colors.sky_blue_light, gui = "bold" },
	  },
	  visual = {
	    -- Mode Visuel : Ambre/Jaune
	    a = { fg = hot_colors.deep_space_blue, bg = hot_colors.amber_flame, gui = "bold" },
	  },
	  replace = {
	    -- Mode Remplacement : Bleu/Vert (Teal)
	    a = { fg = hot_colors.deep_space_blue, bg = hot_colors.blue_green, gui = "bold" },
	  },
	  command = {
	    -- Mode Commande : Couleurs inversées (Fond foncé, texte orange)
	    a = { fg = hot_colors.tiger_orange, bg = hot_colors.deep_space_blue, gui = "bold" },
	  },
	  inactive = {
	    -- Quand la fenêtre perd le focus
	    a = { fg = hot_colors.blue_green, bg = hot_colors.deep_space_blue },
	    b = { fg = hot_colors.blue_green, bg = hot_colors.deep_space_blue },
	    c = { fg = hot_colors.blue_green, bg = "NONE" },
	  },
	}
	local lualine_theme_contrast = {
	  normal = {
	    a = { fg = hot_colors.deep_space_blue, bg = hot_colors.tiger_orange, gui = "bold" },
	    -- Section B avec un fond bleu clair pour lier la couleur chaude à la couleur froide
	    b = { fg = hot_colors.deep_space_blue, bg = hot_colors.blue_green },
	    c = { fg = hot_colors.sky_blue_light, bg = hot_colors.deep_space_blue }, 
	  },
	  insert = {
	    a = { fg = hot_colors.deep_space_blue, bg = hot_colors.sky_blue_light, gui = "bold" },
	    b = { fg = hot_colors.sky_blue_light, bg = hot_colors.blue_green },
	  },
	  visual = {
	    a = { fg = hot_colors.deep_space_blue, bg = hot_colors.amber_flame, gui = "bold" },
	  },
	  replace = {
	    a = { fg = hot_colors.deep_space_blue, bg = hot_colors.blue_green, gui = "bold" },
	  },
	  command = {
	    a = { fg = hot_colors.deep_space_blue, bg = hot_colors.sky_blue_light, gui = "bold" },
	  },
	}
	local lualine_theme_tropical = {
	  normal = {
	    -- Mode Normal : Bleu céruléen
	    a = { fg = tropicals.floral_white, bg = tropicals.cerulean, gui = "bold" },
	    -- Section B : Dégradé vers le vert d'eau
	    b = { fg = tropicals.floral_white, bg = tropicals.ocean_mist },
	    c = { fg = tropicals.cerulean, bg = "NONE" },
	  },
	  insert = {
	    -- Mode Insertion : Rose pamplemousse bien visible
	    a = { fg = tropicals.floral_white, bg = tropicals.grapefruit_pink, gui = "bold" },
	  },
	  visual = {
	    -- Mode Visuel : Crème d'abricot (texte sombre pour le contraste)
	    a = { fg = tropicals.cerulean, bg = tropicals.apricot_cream, gui = "bold" },
	  },
	  replace = {
	    -- Mode Remplacement : Vert d'eau
	    a = { fg = tropicals.floral_white, bg = tropicals.ocean_mist, gui = "bold" },
	  },
	  command = {
	    -- Mode Commande : Inversé avec un fond clair
	    a = { fg = tropicals.cerulean, bg = tropicals.floral_white, gui = "bold" },
	  },
	  inactive = {
	    -- Discret quand on perd le focus
	    a = { fg = tropicals.ocean_mist, bg = "NONE" },
	    b = { fg = tropicals.ocean_mist, bg = "NONE" },
	    c = { fg = tropicals.ocean_mist, bg = "NONE" },
	  },
	}

	local lualine_theme_dracula = {
	  normal = {
	    -- Mode Normal : Le violet classique de Dracula
	    a = { fg = dracula.background, bg = dracula.purple, gui = "bold" },
	    -- Section B : Gris clair pour faire la transition
	    b = { fg = dracula.foreground, bg = dracula.current_line },
	    -- Section C : Fond sombre naturel avec texte clair
	    c = { fg = dracula.foreground, bg = dracula.background },
	  },
	  insert = {
	    -- Mode Insertion : Vert néon
	    a = { fg = dracula.background, bg = dracula.green, gui = "bold" },
	  },
	  visual = {
	    -- Mode Visuel : Rose vif (très typique de Dracula)
	    a = { fg = dracula.background, bg = dracula.pink, gui = "bold" },
	  },
	  replace = {
	    -- Mode Remplacement : Rouge
	    a = { fg = dracula.background, bg = dracula.red, gui = "bold" },
	  },
	  command = {
	    -- Mode Commande : Cyan
	    a = { fg = dracula.background, bg = dracula.cyan, gui = "bold" },
	  },
	  inactive = {
	    -- Quand la fenêtre n'a pas le focus : on utilise la couleur 'comment' (gris/bleu discret)
	    a = { fg = dracula.comment, bg = dracula.background },
	    b = { fg = dracula.comment, bg = dracula.background },
	    c = { fg = dracula.comment, bg = dracula.background },
	  },
	}

      -- 3. On retourne la configuration complète
      return {
        options = {
          theme = lualine_theme_dracula, -- On applique notre thème
          section_separators = { left = "", right = "" },
          component_separators = { left = "", right = "" },
          globalstatus = true,
        },
        sections = {
          lualine_a = { { "mode", fmt = function(str) return icons.space_invader .. (str:sub(1, 1) == "V" and "VISUAL" or str) end } },
          lualine_b = { {"branch", icon = icons.git} },
          lualine_c = { "filetype", "filename" }, -- C'est ici le milieu
          lualine_x = { "encoding", "fileformat" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      }
    end,
  },
}
