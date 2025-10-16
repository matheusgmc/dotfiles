return {
	"akinsho/bufferline.nvim",
	after = "catppuccin",
	version = "*",
	event = "VeryLazy",
	enabled = false,
	keys = {
		{
			"<A-c>",
			function()
				local buffer_id = vim.fn.bufnr()
				vim.cmd("BufferLineCycleNext")
				vim.cmd("bdelete " .. buffer_id)
			end,
			desc = "Toggle Pin",
		},
		{ "<A-,>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
		{ "<A-.>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
		{ "<A-<>", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
		{ "<A->>", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
	},
	opts = function()
		local hl = require("catppuccin.groups.integrations.bufferline").get()
		return {
			options = {
				mode = "buffers",
				always_show_bufferline = false,
				separator_style = "slope",
				highlights = hl,
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						text_align = "left",
						separator = true,
					},
				},
				hover = { enabled = true, delay = 200, reveal = { "close" } },
			},
		}
	end,
}
