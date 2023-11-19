return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "stylua",
      "luacheck",
      "tailwindcss-language-server",
      "typescript-language-server",
    },
    ui = {
      border = "rounded",
    },
  },
}
