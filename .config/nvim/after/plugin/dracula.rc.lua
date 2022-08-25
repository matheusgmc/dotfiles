local status, dracula = pcall(require,"dracula")
if (not status) then return end

dracula.setup{
  transparent_bg = true
}

vim.cmd[[colorscheme dracula]]
