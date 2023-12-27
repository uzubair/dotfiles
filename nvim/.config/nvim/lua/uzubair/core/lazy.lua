local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local installed, lazy = pcall(require, "lazy")
if not installed then
	return
end

lazy.setup({
	-- colorscheme settings
	-- colorscheme = function()
	-- 	require("gruvbox-community/gruvbox").load()
	-- end,
	-- load the default settings
	defaults = {
		keymaps = false,
	},
	news = {
		lazyvim = true,
		neovim = false,
	},
	-- importing directories
	spec = {
		{ import = "uzubair.plugins" },
		{ import = "uzubair.plugins.lsp" },
	},

	-- ui config
	ui = {
		border = "double",
		size = {
			width = 0.8,
			height = 0.8,
		},
	},

	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
})
