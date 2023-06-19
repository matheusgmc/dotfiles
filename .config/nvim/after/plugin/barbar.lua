local status, barbar = pcall(require, "barbar")

if not status then
	return
end

barbar.setup({
	auto_hide = true,
	sidebar_filetypes = {
		-- Use the default values: {event = 'BufWinLeave', text = nil}
		NvimTree = true,
	},
})
