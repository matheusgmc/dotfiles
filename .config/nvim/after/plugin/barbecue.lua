local status, barbecue = pcall(require, "barbecue")

if not status then
	return
end

barbecue.setup({
	create_autocmd = false,
})

vim.api.nvim_create_autocmd({
	-- "WinScrolled", -- or WinResized on NVIM-v0.9 and higher
	"CursorHold",
	-- "BufWinEnter", -- Open every new buffer
	"InsertLeave",

	-- include this if you have set `show_modified` to `true`
	-- "BufModifiedSet",
}, {
	group = vim.api.nvim_create_augroup("barbecue.updater", {}),
	callback = function()
		require("barbecue.ui").update()
	end,
})
