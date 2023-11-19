local set = vim.keymap.set

local opts = {
  noremap = true,
  silent = true,
}

--- NORMAL MODE ---
set("n", "<C-b>", ":NvimTreeToggle<CR>", opts)                 -- NvimTree toggle open or close the tree --
set("n", "+", "<C-a>", opts)                                   -- Increment
set("n", "-", "<C-x>", opts)                                   -- Decrement

set("n", "<A-k>", ":m .-2<CR>==", opts)                        -- Move text up
set("n", "<A-j>", ":m .+1<CR>==", opts)                        -- Move text down

set("n", "<C-a>", "gg<S-v>G")                                  -- Select all

set("n", "<A-,>", "<Cmd>BufferPrevious<CR>", opts)             -- Move to previous buffer
set("n", "<A-.>", "<Cmd>BufferNext<CR>", opts)                 -- Move to next buffer

set("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)         -- Re-order to previous buffer
set("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)             -- Re-order to next buffer

set("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)                -- Close current buffer

set("n", "<leader>hp", "<Cmd>Gitsigns preview_hunk<CR>", opts) -- Git preview hunk

set("n", "<leader>e", vim.diagnostic.open_float, vim.list_extend(opts, { desc = "Diagnostic Popup" }))

set("n", "x", '"_x', opts)

--- VISUAL MODE ---

set("v", "<A-j>", ":m '>+1<CR>gv=gv", opts) -- Move text up
set("v", "<A-k>", ":m '<-2<CR>gv=gv", opts) -- Move text down
