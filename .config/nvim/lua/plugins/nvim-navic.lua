return {
	"SmiteshP/nvim-navic",
	lazy = true,
	opts = {
		lsp = {
			auto_attach = true,
			preference = {
				"vue_ls",
			},
		},
		highlight = true,
	},
	config = function(_, opts)
		require("nvim-navic").setup(opts)
	end,
}
