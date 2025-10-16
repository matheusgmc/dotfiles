return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  opts = {
    update_focused_file = {
      enable = true
    },
    git = {
      ignore = false
    }
  },
  keys = {
    { "<C-b>", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree" },
  },
  config = function(_, opts)
    require("nvim-tree").setup(opts)
  end,
}
