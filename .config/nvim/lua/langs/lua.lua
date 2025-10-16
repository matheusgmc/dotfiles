return {
	lsp_name = "lua_ls",
	ts_name = { "lua" },
	formatters = "stylua",
	lsp_config = {
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim", "require" },
				},
			},
		},
	},
}
