return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- Active les couleurs 24-bit (obligatoire pour bufferline)
    vim.opt.termguicolors = true 

    require("bufferline").setup({
      options = {
        mode = "buffers", -- Affiche les buffers ouverts (comme VSCode)
        close_command = "Bdelete! %d",
        right_mouse_command = "Bdelete! %d",
        separator_style = "thin", -- Style visuel ("slant", "thick", "thin", etc.)
        always_show_bufferline = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        diagnostics = "nvim_lsp", -- Affiche les erreurs/warnings directement sur l'onglet
        offsets = {
          {
            filetype = "neo-tree", -- Si tu utilises NvimTree, ça aligne la barre
            text = "Explorateur de fichiers",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    })
  end,
}
