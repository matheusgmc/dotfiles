return {
  "nvim-tree/nvim-tree.lua",
   version = "*",
   lazy = false,
   dependencies = { "nvim-tree/nvim-web-devicons" },
   config = function () 
      local function on_attach(bufnr)
      	local api = require("nvim-tree.api")
      
      	local function opts(desc)
      		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      	end
      
      	api.config.mappings.default_on_attach(bufnr)
      
      	vim.keymap.set("n", "i", api.node.open.horizontal, opts("Open: Horizontal split"))
      	vim.keymap.set("n", "v", api.node.open.vertical, opts("Open: Vertical split"))
      end
      
      require("nvim-tree").setup({
      	on_attach = on_attach,
      	git = {
      		ignore = false,
      	},
      	disable_netrw = true,
      	hijack_netrw = true,
      	hijack_unnamed_buffer_when_opening = true,
      })
  end
}
