return {
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      {
        "mason-org/mason.nvim",
        opts = {
          ui = {
            border = "rounded",
          },
        },
      },
      "neovim/nvim-lspconfig",
    },
    config = function()
      local langs = require("util.langs")
      local ensure_installed = {}

      for server in pairs(langs.servers) do
        table.insert(ensure_installed, server)

        local config = langs.servers[server]

        local capabilities = vim.tbl_deep_extend(
          "force",
          {},
          vim.lsp.protocol.make_client_capabilities(),
          require("blink.cmp").get_lsp_capabilities() or {},
          config.capabilities or {}
        )

        local server_opts = vim.tbl_deep_extend("force", {
          capabilities = vim.deepcopy(capabilities),
        }, langs.servers[server] or {})

        vim.lsp.config(server, server_opts)
        vim.lsp.enable(server)
      end

      require("mason-lspconfig").setup({
        ensure_installed = ensure_installed,
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "VeryLazy",
    opts = function()
      local langs = require("util.langs")
      return {
        sync_install = true,
        ensure_installed = langs.grammars,
        highlight = {
          enable = true,
        },
        indent = { enable = true },
      }
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = function()
      local langs = require("util.langs")
      return {
        formatters_by_ft = langs.formatters,
        format_on_save = {
          timeout_ms = 500,
          lsp_format = "fallback",
        },
      }
    end,
  },
  {
    "saghen/blink.cmp",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    version = "1.*",
    opts = {
      keymap = { preset = "enter" },
      fuzzy = { implementation = "rust" },
      signature = { enabled = true, window = { border = "rounded" } },
      sources = {
        default = { "lsp", "buffer", "path" },
      },
      completion = {
        keyword = { range = "prefix" },
        menu = {
          border = "rounded",
          draw = {
            columns = { { "label", "label_description", gap = 1, "kind_icon", "kind" } },
          },
        },
        documentation = {
          auto_show = true,
          window = {
            border = "rounded",
          },
        },
      },
    },
  },
}
