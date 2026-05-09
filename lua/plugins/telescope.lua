return { -- <--- Ajoute le "return" ici
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    keys = {
        { '<leader>f', '<cmd>Telescope find_files<cr>', desc = 'Chercher des fichiers' },
        { '<leader>g', '<cmd>Telescope live_grep<cr>', desc = 'Chercher du texte (grep)' },
    },
}
