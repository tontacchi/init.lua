-- definition, references, and hover keybinds
local function onAttach(client, bufnr)
	local bufOpts = {
		noremap = true,
		silent  = true,
		buffer  = bufnr,
	}

	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufOpts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufOpts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufOpts)

	print("LSP started: " .. client.name .. "")
end

local lsp = {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"folke/lazydev.nvim",
				ft = "lua", -- only load on lua files
				opts = {
					library = {
						-- See the configuration section for more details
						-- Load luvit types when the `vim.uv` word is found
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
		},
		config = function()
			local lspconf = require("lspconfig")

			local servers = {
				lspconf.lua_ls,
				lspconf.pyright,
				-- lspconf.kotlin_language_server,
			}

			for _, server in ipairs(servers) do
				server.setup({ on_attach = onAttach })
			end

			-- lspconf.lua_ls.setup({ on_attach = onAttach })
			-- lspconf.pyright.setup({ on_attach = onAttach })
			-- lspconf.kotlin_language_server.setup({on_attach = onAttach})
		end
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")

			cmp.setup({
				sources = {
					{
						name = "nvim_lsp"
					}
				},
				snippet = {
					expand = function(args)
						vim.snippet.expand(args.body)
					end
				},
				mapping = cmp.mapping.preset.insert({})
			})
		end
	},
	{
		"hrsh7th/cmp-nvim-lsp",
		config = function() end
	}
}

return lsp
