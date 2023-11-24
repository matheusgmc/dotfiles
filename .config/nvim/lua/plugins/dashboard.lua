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
}
