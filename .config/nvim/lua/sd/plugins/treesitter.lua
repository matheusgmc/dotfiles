return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = { "windwp/nvim-ts-autotag" },
	opts = {
		highlight = {
			enable = true,
			disable = { "css" },
		},
		indent = {
			enable = true,
		},
		sync_install = true,
		ensure_installed = {
			"ruby",
			"tsx",
			"toml",
			"json",
			"yaml",
			"css",
			"html",
			"javascript",
			"typescript",
			"prisma",
			"rust",
			"c_sharp",
			"lua",
			"elixir",
			"java",
			"markdown",
			"markdown_inline",
			"go",
			"http",
		},
		autotag = {
			enable = true,
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
