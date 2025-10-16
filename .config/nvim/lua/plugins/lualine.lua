return {
	"nvim-lualine/lualine.nvim",
	opts = {
		options = {
			globalstatus = true,
			theme = "catppuccin",
			component_separators = "|",
			section_separators = { left = "", right = "" },
		},
		winbar = {
			lualine_c = {
				{
					"navic",
					color_correction = nil,
					navic_opts = { highlight = true },
				},
			},
		},
	},
}
