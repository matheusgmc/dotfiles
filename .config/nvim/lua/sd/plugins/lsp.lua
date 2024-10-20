return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		opts = {
			formatters_by_ft = {
				javascript = { "prettierd" },
				javascriptreact = { "prettierd" },
				typescript = { "prettierd" },
				typescriptreact = { "prettierd" },
				rust = { "rustfmt" },
				lua = { "stylua" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
		},
	},
	{
		"williamboman/mason.nvim",
		opts = {
			ui = {
				border = "rounded",
			},
		},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"tailwindcss",
				"tsserver",
				"lua_ls",
				"prismals",
				"rust_analyzer",
				"dockerls",
				"docker_compose_language_service",
				"eslint",
				"jsonls",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
		},
		opts = {
			inlay_hints = { enabled = true },
			servers = {
				rust_analyzer = {},
				tailwindcss = {
					settings = {
						classAttributes = { "labelClassName" },
					},
				},
				clangd = {},
				prismals = {},
				pylsp = {},
				csharp_ls = {},
				jdtls = {},
				eslint = {},
				jsonls = {},
				gopls = {},
				dockerls = {},
				-- ruby_ls = {},
				rubocop = {},
				solargraph = {},
				docker_compose_language_service = {},
				lua_ls = {
					settings = {
						single_file_support = true,
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
							format = {
								enable = false,
								defaultConfig = {
									indent_style = "space",
									indent_size = "2",
									continuation_indent_size = "2",
								},
							},
						},
					},
				},
				tsserver = {
					single_file_support = true,
					settings = {
						typescript = {
							inlayHints = {
								includeInlayParameterNameHints = "all",
								includeInlayParameterNameHintsWhenArgumentMatchesName = true,
								includeInlayFunctionParameterTypeHints = true,
								includeInlayVariableTypeHints = true,
								includeInlayPropertyDeclarationTypeHints = true,
								includeInlayFunctionLikeReturnTypeHints = true,
								includeInlayEnumMemberValueHints = true,
							},
						},
						javascript = {
							inlayHints = {
								includeInlayParameterNameHints = "all",
								includeInlayParameterNameHintsWhenArgumentMatchesName = false,
								includeInlayFunctionParameterTypeHints = true,
								includeInlayVariableTypeHints = true,
								includeInlayPropertyDeclarationTypeHints = true,
								includeInlayFunctionLikeReturnTypeHints = true,
								includeInlayEnumMemberValueHints = true,
							},
						},
					},
				},
			},
			setup = {},
		},
		config = function(_, opts)
			require("lspconfig.ui.windows").default_options.border = "rounded"

			local signs = { Error = " ", Warn = "󱢺 ", Hint = "󰩄 ", Info = " " }

			local capabilities = vim.tbl_deep_extend(
				"force",
				{},
				vim.lsp.protocol.make_client_capabilities(),
				require("cmp_nvim_lsp").default_capabilities() or {},
				opts.capabilities or {}
			)

			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end

			local servers = opts.servers

			local function setup(server)
				local server_opts = vim.tbl_deep_extend("force", {
					capabilities = vim.deepcopy(capabilities),
				}, servers[server] or {})

				require("lspconfig")[server].setup(server_opts)
			end

			for server in pairs(servers) do
				setup(server)
			end
		end,
	},
}
