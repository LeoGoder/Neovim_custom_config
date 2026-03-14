return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    -- Installer les parsers automatiquement au démarrage
    require("nvim-treesitter").install({ "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "html", "css", "javascript", "typescript", "python", "cpp", "rust" })

    -- Activer le highlighting et l'indentation treesitter (intégrés dans Neovim 0.10+)
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })
  end,
}
