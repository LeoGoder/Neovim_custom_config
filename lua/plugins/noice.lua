return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    cmdline = {
      view = "cmdline_popup",
    },
    lsp = {
      -- Active l'affichage de la documentation et de la signature via Noice
      hover = { enabled = true },
      signature = { enabled = true },
      -- Indispensable pour que Noice remplace l'affichage natif de Neovim
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    presets = {
      bottom_search = true, -- Garde la recherche (/) en bas pour ne pas masquer le code
      command_palette = true, -- Positionne la barre de commande (:) au centre
      long_message_to_split = true, -- Envoie les longs messages dans un split séparé
      inc_rename = false, -- À passer sur true si vous utilisez inc-rename.nvim
      lsp_doc_border = true, -- Ajoute une bordure aux popups d'information au survol
    },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    {
    "rcarriga/nvim-notify",
    opts = {
        background_colour = "#000000",
      },
    },
  }
}
