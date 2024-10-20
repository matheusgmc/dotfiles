local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local keymap = vim.keymap.set

autocmd({
	-- "WinScrolled", -- or WinResized on NVIM-v0.9 and higher
	"CursorHold",
	-- "BufWinEnter", -- Open every new buffer
	"InsertLeave",

	-- include this if you have set `show_modified` to `true`
	-- "BufModifiedSet",
}, {
	group = augroup("barbecue.updater", {}),
	callback = function()
		local status, barbecue = pcall(require, "barbecue.ui")
		if not status then
			return
		end
		barbecue.update()
	end,
})

autocmd("LspAttach", {
	desc = "LSP",
	group = augroup("lsp", { clear = false }),
	callback = function(ev)
		local lsp = vim.lsp
		-- Mappings
		local opts = {
			buffer = ev.buf,
			noremap = true,
			silent = true,
			desc = "Toggle Hints",
		}

		-- keymap("n", "<A-h>", function()
		-- 	lsp.inlay_hint(ev.buf, nil)
		-- end, opts)

		opts.desc = ""
		keymap("n", "<c-k>", lsp.buf.signature_help, opts)

		opts.desc = "[L]SP [A]ctions"
		keymap("n", "<leader>la", lsp.buf.code_action, opts)

		opts.desc = "[L]SP [R]ename"
		keymap("n", "<leader>lr", lsp.buf.rename, opts)
		opts.desc = "[L]SP [L]ens"
		keymap("n", "<leader>ll", lsp.codelens.run, opts)

		opts.desc = "Hover"
		keymap("n", "K", lsp.buf.hover, opts)

		opts.desc = "[G]o to [D]efinition"
		keymap("n", "gd", lsp.buf.definition, opts)
	end,
})

autocmd("VimLeave", {
	group = augroup("neovim_kill_process", {}),
	callback = function()
		vim.fn.jobstart(vim.fn.expand("$HOME") .. "/.local/bin/neovim_kill_process.sh", { detach = true })
	end,
})
