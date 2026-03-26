-- 1. Téléchargement automatique de lazy.nvim s'il n'est pas installé
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- utilise la dernière version stable
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Définir la touche "leader" (Espace est très commun et recommandé)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.number = true          -- Affiche le numéro de la ligne actuelle
vim.opt.relativenumber = true  -- Affiche les distances relatives pour les autres lignes
-- combo pour sortir plus vite d'un mode 
vim.keymap.set('i', '<C-l>', '<Esc>', { noremap = true })
vim.keymap.set('v', '<C-l>', '<Esc>', { noremap = true })
vim.keymap.set('c', '<C-l>', '<Esc>', { noremap = true })
vim.keymap.set('t', '<C-l>', [[<C-\><C-n>]], { noremap = true })
-- config special for c/c++ and make
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "c", "cpp", "make" },
	callback = function()
		vim.opt_local.expandtab = false -- Désactive la conversion en espaces
		vim.opt_local.tabstop = 8 -- Souvent 8 en C, mais tu peux mettre 4
		vim.opt_local.shiftwidth = 8
	end,
})
-- vim.cmd("colorscheme dracula")
-- Pour que les variables et paramètres soient de la même couleur
vim.api.nvim_set_hl(0, "@variable", { link = "@parameter" })
-- Optionnel : si tu veux aussi que les variables membres (self.xxx) soient colorées
vim.api.nvim_set_hl(0, "@variable.member", { link = "@parameter" })
-- 2. Initialisation de Lazy en lui disant de charger le dossier "lua/plugins"
require("lazy").setup("plugins")
