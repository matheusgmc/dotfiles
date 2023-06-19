local set = vim.keymap.set

local opts = {
	noremap = true,
	silent = true,
}

--- NORMAL MODE ---

-- NvimTree toggle open or close the tree --
set("n", "<C-b>", ":NvimTreeToggle<CR>", opts)

-- Move text up and down
set("n", "<A-j>", ":m .+1<CR>==", opts)
set("n", "<A-k>", ":m .-2<CR>==", opts)

----- Barbar | Tab Navigation -----
-- Move to previous/next
set("n", "<A-,>", "<Cmd>BufferPrevious<CR>", opts)
set("n", "<A-.>", "<Cmd>BufferNext<CR>", opts)
-- -- Re-order to previous/next
set("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
set("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)
set("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)

----- GitSigns --------------------------------
set("n", "<leader>hp", "<Cmd>Gitsigns preview_hunk<CR>", opts)

--- Visual ------------------------------------------
-- Move text up and down
set("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
set("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

set("v", "p", "_dP", opts)
