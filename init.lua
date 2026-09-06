vim.opt.expandtab = true
vim.opt.tabstop = 4
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
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.relativenumber = true
vim.opt.number = true
-- vim.opt.guicursor = ""
-- config special for c/c++ and make
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "c","make" },
	callback = function()
		vim.opt_local.expandtab = false -- Désactive la conversion en espaces
		vim.opt_local.tabstop = 4 -- Souvent 8 en C, mais tu peux mettre 4
		vim.opt_local.shiftwidth = 4
	end,
})

-- 2. Initialisation de Lazy en lui disant de charger le dossier "lua/plugins"
require("lazy").setup("plugins")
