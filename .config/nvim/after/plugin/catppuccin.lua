local status, cat = pcall(require, "catppuccin")

if not status then
	return
end

local mocha = require("catppuccin.palettes").get_palette("mocha")

cat.setup({
	flavour = "mocha",
	background = {
		dark = "mocha",
	},
	integration = {
		nvimtree = {
			enabled = true,
			transparent_panel = true,
		},
		mason = false,
		barbar = true,
	},
	transparent_background = true,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "mason",
	callback = function()
		vim.api.nvim_set_hl(0, "MasonNormal", { bg = mocha.base })
	end,
})

vim.cmd.colorscheme("catppuccin")
