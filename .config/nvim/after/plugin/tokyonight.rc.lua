local status, tokyo = pcall(require,"tokyonight")

if (not status) then return end

tokyo.setup{
  style = "dark",
  transparent = true,
  styles = {
    sidebars = "transparent"
  }
}

vim.cmd("colorscheme tokyonight")
