return {
  'goolord/alpha-nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' }, -- Pour avoir de jolies icônes
  config = function ()
    local alpha = require('alpha')
    local dashboard = require('alpha.themes.dashboard')

    -- 1. Le Header (Ton ASCII Art)
    dashboard.section.header.val = {
        [[▒▒▒▒▒▒▒▒▄▄▄▄▄▄▄▄▒▒▒▒▒▒▒▒]],
	[[▒▒▒▒▒▄█▀▀░░░░░░▀▀█▄▒▒▒▒▒]],
	[[▒▒▒▄█▀▄██▄░░░░░░░░▀█▄▒▒▒]],
	[[▒▒█▀░▀░░▄▀░░░░▄▀▀▀▀░▀█▒▒]],
	[[▒█▀░░░░███░░░░▄█▄░░░░▀█▒]],
	[[▒█░░░░░░▀░░░░░▀█▀░░░░░█▒]],
	[[▒█░░░░░░░░░░░░░░░░░░░░█▒]],
	[[▒█░░██▄░░▀▀▀▀▄▄░░░░░░░█▒]],
	[[▒▀█░█░█░░░▄▄▄▄▄░░░░░░█▀▒]],
	[[▒▒▀█▀░▀▀▀▀░▄▄▄▀░░░░▄█▀▒▒]],
	[[▒▒▒█░░░░░░▀█░░░░░▄█▀▒▒▒▒]],
	[[▒▒▒█▄░░░░░▀█▄▄▄█▀▀▒▒▒▒▒▒]],
	[[▒▒▒▒▀▀▀▀▀▀▀▒▒▒▒▒▒▒▒▒▒▒▒▒]],
}


    -- 2. Les boutons (Raccourcis clavier)
    -- Le format est : { touche, icône + texte, commande }
    dashboard.section.buttons.val = {
      dashboard.button("f", "  Trouver un fichier", ":Telescope find_files <CR>"),
      dashboard.button("e", "  Nouveau fichier", ":ene <BAR> startinsert <CR>"),
      dashboard.button("r", "  Fichiers récents", ":Telescope oldfiles <CR>"),
      -- dashboard.button("s", "󰄉  Restaurer Session", ":resession load_last<CR>"), -- Si tu as un plugin de session
      dashboard.button("c", "  Configuration", ":e $MYVIMRC <CR>"),
      dashboard.button("q", "󰅚  Quitter", ":qa<CR>"),
    }

    -- 3. Le Footer (Petit message en bas)
    -- Ici, on affiche le nombre de plugins chargés par Lazy
    local stats = require("lazy").stats()
    local count = stats.count
    dashboard.section.footer.val = "󰚥 Neovim chargé avec " .. count .. " plugins"

    -- On applique la configuration
    alpha.setup(dashboard.opts)
  end
}

