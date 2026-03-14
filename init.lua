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

-- config special for c/c++ and make
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "c", "cpp", "make" },
	callback = function()
		vim.opt_local.expandtab = false -- Désactive la conversion en espaces
		vim.opt_local.tabstop = 8 -- Souvent 8 en C, mais tu peux mettre 4
		vim.opt_local.shiftwidth = 8
	end,
})
-- 2. Initialisation de Lazy en lui disant de charger le dossier "lua/plugins"
require("lazy").setup("plugins")
