-- stylua: ignore start
local logo = [[
  .--.--.       ,---,     
 /  /    '.   .'  .' `\   
|  :  /`. / ,---.'     \  
;  |  |--`  |   |  .`\  | 
|  :  ;_    :   : |  '  | 
 \  \    `. |   ' '  ;  : 
  `----.   \'   | ;  .  | 
  __ \  \  ||   | :  |  ' 
 /  /`--'  /'   : | /  ;  
'--'.     / |   | '` ,/   
  `--'---'  ;   :  .'     
            |   ,.'       
            '---'         
]]
-- stylua: ignore end

local action = function(path)
	vim.cmd("cd" .. path)
	vim.cmd("NvimTreeOpen")
	vim.cmd("1bd")
end

return {
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
			"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
		},
		init = function()
			vim.g.barbar_auto_setup = false
		end,
		opts = {
			auto_hide = true,
			sidebar_filetypes = {
				-- Use the default values: {event = 'BufWinLeave', text = nil}
				NvimTree = true,
			},
		},
	},
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		opts = {
			create_autocmd = false,
		},
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			-- "rcarriga/nvim-notify",
		},
		opts = {
			status = {
				lsp_progress = { event = "lsp", kind = "progress" },
			},
			cmdline = {
				view = "cmdline",
			},
			messages = {
				enabled = false,
			},
			lsp = {
				progress = {
					enabled = true,
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
					enabled = true,
					auto_open = {
						enabled = false,
						trigger = false,
					},
				},
				documentation = {
					view = "hover",
					opts = {
						border = "rounded",
					},
				},
			},
			presets = {
				lsp_doc_border = true,
			},
			views = {
				hover = {
					border = { style = "rounded" },
				},
				popupmenu = {
					border = { style = "rounded" },
				},
			},
			notify = {
				enabled = false,
			},
			routes = {},
		},
		config = function(_, opts)
			table.insert(opts.routes, {
				filter = {
					event = "lsp",
					kind = "progress",
				},
				opts = { skip = true },
			})
			require("noice").setup(opts)

			-- require("notify").setup({
			-- 	background_colour = "#000000",
			-- })
		end,
	},
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			theme = "hyper",
			config = {
				header = vim.split(logo, "\n"),
				packages = { enable = false },
				project = {
					enable = true,
					limit = 3,
					icon = " ",
					label = "Recent Projects",
					action = action,
				},
				mru = {
					limit = 3,
				},
				shortcut = {
					{
						desc = " My github",
						group = "Function",
						action = function()
							vim.fn.system("open https://github.com/matheusgmc")
						end,
						key = "g",
					},
					{
						desc = " Dotfiles",
						group = "Number",
						action = function()
							action("~/.config/nvim")
						end,
						key = "d",
					},
				},
			},
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
		config = function()
			require("lualine").setup({
				options = {
					theme = "catppuccin",
					component_separators = "|",
					section_separators = { left = "", right = "" },
				},
				sections = {
					lualine_a = {
						{ "mode", separator = { left = "" }, right_padding = 2 },
					},
					lualine_x = {
						{
							function()
								return require("noice").api.status.lsp_progress.get_hl()
							end,
							cond = function()
								return package.loaded["noice"] and require("noice").api.status.lsp_progress.has()
							end,
						},
						"encoding",
						"fileformat",
						"filetype",
					},
					lualine_z = {
						{ "location", separator = { right = "" }, left_padding = 2 },
					},
				},
			})
		end,
	},
}
