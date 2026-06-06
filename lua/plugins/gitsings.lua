return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" }, -- Charge le plugin dès que tu ouvres un fichier
  config = function()
    require("gitsigns").setup({
      signs = {
        add          = { text = "┃" },
        change       = { text = "┃" },
        delete       = { text = "_" },
        topdelete    = { text = "‾" },
        changedelete = { text = "~" },
        untracked    = { text = "┆" },
      },
      -- Optionnel : ajoute des raccourcis clavier pratiques pour Git
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation entre les blocs de changements (hunks)
        map("n", "]c", function()
          if vim.wo.diff then return "]c" end
          vim.schedule(function() gs.next_hunk() end)
          return "<Ignore>"
        end, { expr = true, desc = "Hunk suivant" })

        map("n", "[c", function()
          if vim.wo.diff then return "[c" end
          vim.schedule(function() gs.prev_hunk() end)
          return "<Ignore>"
        end, { expr = true, desc = "Hunk précédent" })

        -- Actions de base (Visualiser le changement sous le curseur)
        map("n", "<leader>hp", gs.preview_hunk, { desc = "Prévisualiser le hunk" })
        map("n", "<leader>hb", function() gs.blame_line{ full = true } end, { desc = "Git Blame ligne" })
      end
    })
  end
}

