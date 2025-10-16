vim.g.mapleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true
vim.opt.encoding = "utf-8"
vim.opt.number = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.swapfile = false
vim.opt.autoindent = true
vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true
vim.opt.title = true
vim.opt.titlestring = "%<%F%= - nvim"
vim.opt.relativenumber = true
vim.opt.updatetime = 300
vim.opt.conceallevel = 1

vim.diagnostic.config({
	virtual_text = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = "󱢺 ",
			[vim.diagnostic.severity.HINT] = "󰩄 ",
			[vim.diagnostic.severity.INFO] = " ",
		},
	},
	float = {
		focusable = true,
		style = "minimal",
		border = "rounded",
	},
})
