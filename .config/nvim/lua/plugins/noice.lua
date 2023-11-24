return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		-- "rcarriga/nvim-notify",
	},
	opts = {
		cmdline = {
			view = "cmdline",
		},
		messages = {
			enabled = false,
		},
		lsp = {
			progress = {
				enabled = false,
			},
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
			hover = {
				enabled = true,
				silent = true,
			},
			signature = {
				auto_open = {
					enabled = false,
					trigger = false,
				},
			},
			documentation = {
				opts = {
					border = "rounded",
				},
			},
		},
		presents = {
			lsp_doc_border = true,
		},
		views = {
			hover = {
				border = { style = "rounded" },
			},
		},
		notify = {
			enabled = false,
		},
	},
	config = function(_, opts)
		require("noice").setup(opts)

		-- require("notify").setup({
		-- 	background_colour = "#000000",
		-- })
	end,
}
