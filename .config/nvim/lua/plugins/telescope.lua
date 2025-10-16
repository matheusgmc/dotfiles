return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{
			"<c-f>",
			function()
				require("telescope.builtin").find_files()
			end,
			desc = "List files on your current working directory, respects .gitignore",
		},
		{
			"<c-g>",
			function()
				require("telescope.builtin").live_grep()
			end,
			desc = "Search for a string in your current working directory, respects .gitignore",
		},
	},
	opts = {
		defaults = {
			file_ignore_patterns = {
				"dist",
				"node_modules",
				"target",
				".git",
				"build/",
				"lib/",
				".next",
				"package%-lock.json",
				"pnpm%-lock.yaml",
				"ios",
				"android",
				".expo",
			},
			hidden = true,
			preview = false,
		},
		pickers = {
			find_files = {
				hidden = true,
				no_ignore = true,
			},
		},
	},
	config = function(_, opts)
		opts.defaults.mappings = {
			n = {
				["q"] = require("telescope.actions").close,
			},
		}
		require("telescope").setup(opts)
	end,
}
