return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = { "windwp/nvim-ts-autotag" },
  config = function()
    require("nvim-treesitter.configs").setup({
    	highlight = {
    		enable = true,
    		disable = { "css" },
    	},
    	indent = {
    		enable = true,
    	},
    	ensure_installed = {
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
        "elixir"
    	},
    	autotag = {
    		enable = true,
    	},
    })
  end
}
