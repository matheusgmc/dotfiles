local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require("telescope.builtin")
local config = require("telescope.config")

telescope.setup {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--trim" -- add this value
    },
    mappings = {
      n = {
        ["q"] = actions.close,
      },
    },
    file_ignore_patterns = { "dist","node_modules","target",".git",'build'},
    hidden = true
  },
  pickers ={
    find_files = {
      hidden = true,
      no_ignore = true
    }
  }
}

require("telescope").load_extension("flutter");

vim.api.nvim_set_keymap("n","<c-f>",":Telescope find_files hidden=true<CR>", {})
vim.api.nvim_set_keymap("n","<c-g>",":Telescope live_grep <CR>", {})
