local status, ts = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

ts.setup({
	highlight = {
		enable = true,
		disable = { "css" },
	},
	indent = {
		enable = true,
		disable = {},
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
	},
	autotag = {
		enable = true,
	},
})
