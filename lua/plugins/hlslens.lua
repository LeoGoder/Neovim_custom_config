return {
  "kevinhwang91/nvim-hlslens",
  keys = {
    -- Redéfinit 'n' (suivant) et 'N' (précédent) pour inclure hlslens
    { "n", [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]], mode = "n", silent = true },
    { "N", [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]], mode = "n", silent = true },

    -- Redéfinit '*' et '#' (recherche du mot sous le curseur)
    { "*", [[*<Cmd>lua require('hlslens').start()<CR>]], mode = "n", silent = true },
    { "#", [[#<Cmd>lua require('hlslens').start()<CR>]], mode = "n", silent = true },
    { "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], mode = "n", silent = true },
    { "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], mode = "n", silent = true },
  },
  opts = {} -- Charge la configuration par défaut automatiquement
}

