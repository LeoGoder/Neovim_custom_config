return {
  "sphamba/smear-cursor.nvim",
  -- Le plugin ne sera chargé que si cette condition est vraie
  enabled = function()
    return vim.g.smear_cursor_enabled == false
  end,
  opts = {
    -- Tes options habituelles ici
  },
}
