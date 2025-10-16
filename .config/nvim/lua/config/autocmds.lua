local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local keymap = vim.keymap.set

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
