return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000, -- Ensure it loads first
  config = function()
    local status, cat = pcall(require, "catppuccin")

    if not status then
      return
    end

    cat.setup({
      highlights_overrides = {
        mocha = function(mocha)
          return {
            NormalFloat = {
              fg = mocha.text,
              bg = mocha.none,
            },
          }
        end,
      },
      flavour = "mocha",
      transparent_background = true,
      background = {
        dark = "mocha",
      },
      integration = {
        nvimtree = {
          enabled = true,
          transparent_panel = true,
        },
        mason = false,
        barbar = true,
        noice = true,
        notify = true,
        cmp = true,
      },
    })

    vim.cmd.colorscheme("catppuccin")
  end,
}
