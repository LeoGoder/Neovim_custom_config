return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      -- La touche pour ouvrir le terminal (leader + tab)
      open_mapping = [[<leader><leader>]],
      direction = "float",
      float_opts = {
        border = "curved",
      },
      shade_terminals = true,
    })

    -- Raccourcis pratiques pour naviguer dans le terminal
    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }
      vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
      vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
    end

    -- Appliquer les raccourcis seulement quand le terminal est ouvert
    vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
  end,
}
