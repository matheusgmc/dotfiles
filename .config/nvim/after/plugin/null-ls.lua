local status, null_ls = pcall(require, "null-ls")

if not status then
	return
end

null_ls.setup({
	sources = {
		-- here you can add tools not supported by mason
	},
})

require("mason-null-ls").setup({
	ensure_installed = { "stylua", "prettierd" },
	automatic_installation = true, -- You can still set this to `true`
	handlers = {
		-- Here you can add functions to register sources.
		-- See https://github.com/jay-babu/mason-null-ls.nvim#handlers-usage
		--
		-- If left empty, mason-null-ls will  use a "default handler"
		-- to register all sources
	},
})
