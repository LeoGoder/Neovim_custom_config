-- Icônes Nerd Font (rendues par JetBrainsMono Nerd Font)
local function nf(codepoint)
  return vim.fn.nr2char(codepoint)
end

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    dashboard = {
      enabled = true,
      preset = {
        -- En-tête ASCII généré avec la police ANSI Shadow (celle du header Neovim par défaut)
        header = [[
 █████╗ ███████╗ █████╗ ███████╗███████╗██╗     
██╔══██╗╚══███╔╝██╔══██╗╚══███╔╝██╔════╝██║     
███████║  ███╔╝ ███████║  ███╔╝ █████╗  ██║     
██╔══██║ ███╔╝  ██╔══██║ ███╔╝  ██╔══╝  ██║     
██║  ██║███████╗██║  ██║███████╗███████╗███████╗
╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝]],
        -- Raccourcis affichés sur l'écran d'accueil
        keys = {
          { icon = nf(0xf002) .. " ", key = "f", desc = "Trouver un fichier", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = nf(0xf15b) .. " ", key = "n", desc = "Nouveau fichier", action = ":ene | startinsert" },
          { icon = nf(0xf022) .. " ", key = "g", desc = "Rechercher du texte", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = nf(0xf0c5) .. " ", key = "r", desc = "Fichiers récents", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = nf(0xf013) .. " ", key = "c", desc = "Configuration", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = nf(0xf1da) .. " ", key = "s", desc = "Restaurer la session", section = "session" },
          { icon = nf(0xf04b2) .. " ", key = "l", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          { icon = nf(0xf011) .. " ", key = "q", desc = "Quitter", action = ":qa" },
        },
      },
      -- Organisation visuelle des blocs
      sections = {
        { section = "header" },
        { section = "keys", gap = 1, padding = 1 },
        { section = "recent_files", title = "Fichiers récents", indent = 2, padding = 1 },
        { section = "projects", title = "Projets", indent = 2, padding = 1 },
        { section = "startup" }, -- Affiche le temps de démarrage en ms
      },
    },
  },
}
