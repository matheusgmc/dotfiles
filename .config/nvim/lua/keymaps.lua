local opts = {noremap = true, silent = true}

local keymap = vim.api.nvim_set_keymap

--- Normal
-- Move text up and down
keymap("n","<A-j>",":m .+1<CR>==",opts)
keymap("n","<A-k>",":m .-2<CR>==",opts)

--- Visual
-- Move text up and down
keymap("v","<A-j>",":m '>+1<CR>gv=gv",opts)
keymap("v","<A-k>",":m '<-2<CR>gv=gv",opts)
keymap("v","p","_dP",opts)

