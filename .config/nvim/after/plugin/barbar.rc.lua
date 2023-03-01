local status, bl = pcall(require,"bufferline")

if (not status) then return end

--local colors = require("dracula").colors()

bl.setup{
  auto_hide = true,
  maximum_padding = 1,
  icon_separator_active = '│',
  icon_separator_inactive = '│',
  icons = false
}

--vim.highlight.create("BufferTabpage",{
--  guibg=none
--},false)
--vim.highlight.create("BufferTabpageFill",{ctermbg=0,guibg=none},false)

local nvim_tree_events = require('nvim-tree.events')
local bufferline = require('bufferline.api')

local function get_tree_size()
  return require'nvim-tree.view'.View.width
end

nvim_tree_events.subscribe('TreeOpen', function()
  bufferline.set_offset(get_tree_size())
end)

nvim_tree_events.subscribe('Resize', function()
  bufferline.set_offset(get_tree_size())
end)

nvim_tree_events.subscribe('TreeClose', function()
  bufferline.set_offset(0)
end)
