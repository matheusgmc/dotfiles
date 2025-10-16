local set = vim.keymap.set

local opts = {
  noremap = true,
  silent = true,
}

--- NORMAL MODE ---
set("x", "p", [["_dP]])

set("n", "+", "<C-a>", opts)            -- Increment
set("n", "-", "<C-x>", opts)            -- Decrement

set("n", "<A-k>", ":m .-2<CR>==", opts) -- Move text up
set("n", "<A-j>", ":m .+1<CR>==", opts) -- Move text down

set('n', '<C-w>j', ':vertical resize -5<CR>')
set('n', '<C-w>k', ':vertical resize +5<CR>')

set("n", "<C-a>", "gg<S-v>G") -- Select all

set("n", "x", '"_x', opts)

set("n", "<leader>e", vim.diagnostic.open_float)
set("n", "K", function()
  vim.lsp.buf.hover({ border = "rounded" })
end)

--- BARBAR KEYMAPS
set("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)        -- Close current buffer
set("n", "<A-,>", "<Cmd>BufferPrevious<CR>", opts)     -- Move to previous buffer
set("n", "<A-.>", "<Cmd>BufferNext<CR>", opts)         -- Move to next buffer
set("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts) -- Re-order to previous buffer
set("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)     -- Re-order to next buffer

--- VISUAL MODE ---

set("v", "<A-j>", ":m '>+1<CR>gv=gv", opts) -- Move text up
set("v", "<A-k>", ":m '<-2<CR>gv=gv", opts) -- Move text down
