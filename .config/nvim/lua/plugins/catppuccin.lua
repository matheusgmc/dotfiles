return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {
		flavor = "mocha",
		transparent_background = true,
		integrations = {
			treesitter = true,
			nvimtree = true,
			blink_cmp = true,
			navic = {
				enabled = true,
				custom_bg = "NONE",
			},
		},
		custom_highlights = function(colors)
			return {
				BufferLineSeparator = { bg = colors.base, fg = colors.crust },
				BufferLineSeparatorVisible = { fg = colors.crust },
				BufferLineSeparatorSelected = { fg = colors.crust },
				BufferLineBufferSelected = { fg = colors.text },
				BufferLineBufferVisible = { fg = colors.overlay1 },

				BufferLineBackground = { bg = colors.base, fg = colors.overlay1 },
				BufferLineCloseButton = { bg = colors.base },

				BufferLineMiniIconsAzure = { bg = colors.base },
				BufferLineMiniIconsYellow = { bg = colors.base },
				BufferLineMiniIconsBlue = { bg = colors.base },
				BufferLineMiniIconsCyan = { bg = colors.base },
				BufferLineMiniIconsGreen = { bg = colors.base },
				BufferLineMiniIconsGrey = { bg = colors.base },
				BufferLineMiniIconsOrange = { bg = colors.base },
				BufferLineMiniIconsPurple = { bg = colors.base },
				BufferLineMiniIconsRed = { bg = colors.base },

				NavicText = { fg = colors.subtext0 },
			}
		end,
	},
	config = function(_, opts)
		require("catppuccin").setup(opts)
		vim.cmd.colorscheme("catppuccin")
	end,
}
