return {
  {
    "nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    config = function(_, opts)
      opts.sources = {
        {
          name = "emoji",
        },
      }
    end,
  },
  {
    "andweeb/presence.nvim",
    opts = {
      neovim_image_text = "Saudades Dela",
      main_image = "file",
    },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
  {
    "romgrk/barbar.nvim",
    dependencies = {
      "lewis6991/gitsigns.nvim",  -- OPTIONAL: for git status
      "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
    },
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    opts = {
      auto_hide = true,
      sidebar_filetypes = {
        -- Use the default values: {event = 'BufWinLeave', text = nil}
        NvimTree = true,
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
    config = function()
      require("lualine").setup({
        options = {
          theme = "catppuccin",
        },
      })
    end,
  },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  {
    "windwp/nvim-autopairs",
    opts = {},
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    "crusj/bookmarks.nvim",
    keys = {
      { "<tab><tab>", mode = { "n" } },
    },
    branch = "main",
    dependencies = { "nvim-web-devicons" },
    config = function()
      require("bookmarks").setup({
        border_style = "rounded",
      })
      require("telescope").load_extension("bookmarks")
    end,
  },
}
