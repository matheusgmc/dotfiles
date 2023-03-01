local opts = {noremap = true, silent = true}

local keymap = vim.api.nvim_set_keymap


--- Normal -----------------------------------------
-- Move text up and down
keymap("n","<A-j>",":m .+1<CR>==",opts)
keymap("n","<A-k>",":m .-2<CR>==",opts)

keymap("n","<C-h>","b",opts)
keymap("n","<C-l>","e",opts)

-- Increment/decrement
keymap("n","+","<C-a>",opts)
keymap("n","-","<C-x>",opts)

-- Select all
keymap("n","<C-a>",'gg<S-v>G',opts)

----- Nvim-Tree -----
keymap("n","<c-b>",":NvimTreeToggle<CR>", {})

----- Barbar | Tab Navigation -----
-- Move to previous/next
keymap('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
keymap('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
keymap('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
keymap('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)

-- Goto buffer in position...
--keymap('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
--keymap('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
--keymap('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
--keymap('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
--keymap('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
--keymap('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
--keymap('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
--keymap('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
--keymap('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
--keymap('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
--keymap('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer

keymap('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)

----- GitSigns --------------------------------
keymap('n', '<leader>hp', '<Cmd>Gitsigns preview_hunk<CR>',opts)

--- Visual ------------------------------------------
-- Move text up and down
keymap("v","<A-j>",":m '>+1<CR>gv=gv",opts)
keymap("v","<A-k>",":m '<-2<CR>gv=gv",opts)
keymap("v","p","_dP",opts)

