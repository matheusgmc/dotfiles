return {
	"romgrk/barbar.nvim",
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	opts = {
		auto_hide = true,
		sidebar_filetypes = {
			NvimTree = true,
		},
	},
}
