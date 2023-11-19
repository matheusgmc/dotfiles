return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  opts = {
    cmdline = {
      view = "cmdline",
    },
    messages = {
      enabled = false,
    },
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
      hover = {
        silent = true,
      },
    },
    presents = {
      lsp_doc_border = true,
    },
    views = {
      hover = {
        border = { style = "rounded" },
      },
    },
  },
  config = function(_, opts)
    require("noice").setup(opts)
    require("notify").setup({
      background_colour = "#000000",
    })
  end,
}
