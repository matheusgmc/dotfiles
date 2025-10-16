local CONFIG_PATH = vim.fn.stdpath("config")


local M = {
  formatters = {},
  servers = {},
  grammars = {},
  _mounted = false
}

if M.mount == 1 then return M end

for _, lang_path in ipairs(vim.fn.glob(CONFIG_PATH .. "/lua/langs/*.lua", true, true)) do
  local name = vim.fn.fnamemodify(lang_path, ":t:r")
  local mod_path = "langs/" .. name;

  if not package.loaded[mod_path] then
    local ok, mod = pcall(require, mod_path)
    if ok then
      vim.list_extend(M.grammars, mod.ts_name or {})

      if mod.lsp_config and mod.lsp_config.filetypes then
        for _, filetype in pairs(mod.lsp_config.filetypes) do
          M.formatters[filetype] = mod.formatters
        end
      end

      M.servers[mod.lsp_name] = mod.lsp_config or {}
    end
  end
end

M._mounted = true


return M
