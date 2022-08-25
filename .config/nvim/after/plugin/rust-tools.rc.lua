local status, rust_tool = pcall(require,"rust-tools")

if (not status) then return end

rust_tool.setup {
  tools = { -- rust-tools options
        inlay_hints = {
            show_parameter_hints = true,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    }
}

