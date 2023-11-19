return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.4",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    {
      "<c-f>",
      function()
        require("telescope.builtin").find_files()
      end,
      desc = "List files on your current working directory, respects .gitignore",
    },
    {
      "<c-g>",
      function()
        require("telescope.builtin").live_grep()
      end,
      desc = "Search for a string in your current working directory, respects .gitignore",
    },
  },
  opts = {},
  config = function(_, opts)
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    opts.defaults = {
      mappings = {
        n = {
          ["q"] = actions.close,
        },
      },
      file_ignore_patterns = { "dist", "node_modules", "target", ".git", "build/" },
      hidden = true,
      preview = false,
    }

    opts.pickers = {
      find_files = {
        hidden = true,
        no_ignore = true,
      },
    }

    opts.extensions = {
      file_browser = {
        theme = "dropdown",
      },
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
    }

    telescope.setup(opts)
    telescope.load_extension("fzf")
    telescope.load_extension("noice")
  end,
}
