vim.opt.expandtab = true  -- Espaces par défaut partout
vim.opt.tabstop = 4       -- 1 tab = 4 espaces
vim.opt.shiftwidth = 4

local uv = vim.uv or vim.loop
local os_info = uv.os_uname()
local sysname = string.lower(os_info.sysname)
if sysname == "windows_nt" then sysname = "windows" end

local machine = string.lower(os_info.machine)
local arch = machine
if arch == "x86_64" or arch == "amd64" then
    arch = "x64"
elseif arch == "aarch64" then
    arch = "arm64"
end

local target_bin_path = vim.fn.stdpath("config") .. "/bin/" .. sysname .. "-" .. arch
print(target_bin_path)

if vim.fn.isdirectory(target_bin_path) == 1 then
    vim.env.PATH = target_bin_path .. ":" .. vim.env.PATH
end

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
vim.opt.relativenumber = true  -- Affiche les distances relatives pour les autres lignes
vim.opt.guicursor = ""
-- config special for c/c++ and make
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "c","make" },
	callback = function()
		vim.opt_local.expandtab = false -- Désactive la conversion en espaces
		vim.opt_local.tabstop = 4 -- Souvent 8 en C, mais tu peux mettre 4
		vim.opt_local.shiftwidth = 4
	end,
})
-- Pour que les variables et paramètres soient de la même couleur
vim.api.nvim_set_hl(0, "@variable", { link = "@parameter" })
-- Optionnel : si tu veux aussi que les variables membres (self.xxx) soient colorées
vim.api.nvim_set_hl(0, "@variable.member", { link = "@parameter" })
-- 2. Initialisation de Lazy en lui disant de charger le dossier "lua/plugins"
require("lazy").setup("plugins")
