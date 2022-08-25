local status, tree = pcall(require,"nvim-tree") 

if(not status) then return end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

tree.setup {
  view = {
    mappings = {
      custom_only = false,
      list = {
        { key = "i", cb = tree_cb "split" },
        { key = "v", cb = tree_cb "vsplit" }
      },
    },   
  }
}

vim.api.nvim_set_keymap("n","<c-b>",":NvimTreeToggle<CR>", {})
