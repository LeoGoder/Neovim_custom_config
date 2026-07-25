return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  ---@module "ibl"
  ---@type ibl.config
  opts = {
    indent = {
      char = "│", -- Le caractère utilisé pour dessiner la ligne
      tab_char = "│",
    },
    scope = {
      enabled = true, -- Active la ligne qui met en surbrillance le bloc actuel
      show_start = false,
      show_end = false,
    },
  },
}
