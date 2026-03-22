return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    {
      "<leader>e",
      "<cmd>Neotree toggle<CR>",
      mode = "n",
      desc = "Ouvrir/Fermer l'explorateur"
    },
  },
  config = function()
    -- Pour s'assurer que le fond de la fenêtre flottante de neo-tree 
    -- hérite bien du style de ton thème (et de sa transparence éventuelle)
    vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
    vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })

    require("neo-tree").setup({
      close_if_last_window = true,
      -- Configuration spécifique de la fenêtre
	window = {
        position = "float",
        popup = {
          border = "rounded",
          -- C'est cette ligne qui centre la fenêtre :
          position = "50%",
          -- Tu peux aussi ajuster la taille si tu la trouves trop petite/grande :
          size = { width = 80, height = "80%" },
        },
        mappings = {
          -- Tes raccourcis...
        }
      },
      filesystem = {
        filtered_items = {
          visible = false,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
    })
  end,
}
