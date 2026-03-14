return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- Pour avoir de jolies icônes de fichiers (nécessite une police Nerd Font)
    "MunifTanjim/nui.nvim",
  },
  -- 'keys' permet à lazy.nvim de charger le plugin uniquement quand tu utilises ce raccourci
  keys = {
    { 
      "<leader>e", 
      "<cmd>Neotree toggle<CR>", 
      mode = "n", -- Uniquement en mode Normal
      desc = "Ouvrir/Fermer l'explorateur de fichiers" 
    },
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true, -- Ferme Neovim si neo-tree est la toute dernière fenêtre ouverte
      window = {
        position = "float", -- "left", "right", ou "float"
        width = 30,
      },
      filesystem = {
        filtered_items = {
          visible = false,
          hide_dotfiles = false, -- Change sur true si tu veux cacher les fichiers cachés (comme .git)
          hide_gitignored = false,
        },
      },
    })
  end,
}
