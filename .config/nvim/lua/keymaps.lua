local opts = {noremap = true, silent = true}

local keymap = vim.api.nvim_set_keymap


--- Normal
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

--- Visual
-- Move text up and down
keymap("v","<A-j>",":m '>+1<CR>gv=gv",opts)
keymap("v","<A-k>",":m '<-2<CR>gv=gv",opts)
keymap("v","p","_dP",opts)

