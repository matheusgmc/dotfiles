local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require("telescope.builtin")

telescope.setup {
  defaults = {
    vimgrep_arguments = vimgrep_arguments,
    mappings = {
      n = {
        ["q"] = actions.close,
      },
    },
    file_ignore_patterns = { "dist","node_modules","target"}
  },
}

vim.api.nvim_set_keymap("n","<c-f>",":Telescope find_files<CR>", {})
