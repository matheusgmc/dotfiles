local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local keymap = vim.keymap.set

local function inlay_hints(buf, value)
	local ih = vim.lsp.buf.inlay_hint or vim.lsp.inlay_hint
	if type(ih) == "function" then
		ih(buf, value)
	elseif type(ih) == "table" and ih.enable then
		if value == nil then
			value = not ih.is_enabled(buf)
		end
		ih.enable(buf, value)
	end
end

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
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		-- Mappings
		local opts = {
			buffer = ev.buf,
			noremap = true,
			silent = true,
			desc = "Toggle Hints",
		}

		if client.supports_method("textDocument/inlayHint") then
			inlay_hints(ev.buf, true)
		end

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
