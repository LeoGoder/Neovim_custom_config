return {
  "akinsho/toggleterm.nvim",
  version = "*",
  -- On définit le raccourci ici pour contrôler exactement le mode
  keys = {
    {
      "<leader><leader>",
      "<cmd>ToggleTerm<CR>",
      mode = "n", -- Uniquement en mode Normal
      desc = "Ouvrir/Fermer le terminal (ToggleTerm)",
    },
  },
  config = function()
    require("toggleterm").setup({
      -- On a retiré open_mapping d'ici car il est géré par lazy.nvim plus haut
      -- float centre le terminal
      direction = "horizontal",
      float_opts = {
        border = "curved",
      },
      shade_terminals = true,
    })
	vim.keymap.set("n", "<leader><leader>", "<cmd>ToggleTerm<CR>", { noremap = true, silent = true, desc = "Toggle Terminal" })
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
