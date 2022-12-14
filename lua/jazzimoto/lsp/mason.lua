local Remap = require("jazzimoto.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"cssls",
		"html",
		"jsonls",
		"sumneko_lua",
		"tsserver",
		"eslint",
	},
	automatic_installation = true,
})

local function lsp_keymaps()
	local opts = { buffer = true }
	inoremap("<C-h>", vim.lsp.buf.signature_help, opts)
	nnoremap("K", vim.lsp.buf.hover, opts)
	nnoremap("gd", vim.lsp.buf.definition, opts)
	nnoremap("gD", vim.lsp.buf.declaration, opts)
	nnoremap("gI", vim.lsp.buf.implementation, opts)
	nnoremap("gl", vim.diagnostic.open_float, opts)
	nnoremap("gr", vim.lsp.buf.references, opts)
	nnoremap("[d", function()
		vim.diagnostic.goto_prev({ buffer = 0 })
	end, opts)
	nnoremap("]d", function()
		vim.diagnostic.goto_next({ buffer = 0 })
	end, opts)
	nnoremap("<leader>lf", function()
		vim.lsp.buf.format({ async = true })
	end, opts)
	nnoremap("<leader>lr", vim.lsp.buf.rename, opts)
	nnoremap("<leader>vws", vim.lsp.buf.workspace_symbol, opts)
	nnoremap("<leader>vca", vim.lsp.buf.code_action, opts)
	nnoremap("<leader>vco", function()
		vim.lsp.buf.code_action({
			filter = function(code_action)
				if not code_action or not code_action.data then
					return false
				end
				local data = code_action.data.id
				return string.sub(data, #data - 1, #data) == ":0"
			end,
			apply = true,
		})
	end, opts)
end

local function config(_config)
	return vim.tbl_deep_extend("force", {
		on_attach = function(client)
			lsp_keymaps()
			if client.name == "tsserver" or client.name == "sumneko_lua" then
				client.server_capabilities.documentFormattingProvider = false
			end
		end,
	}, _config or {})
end

require("lspconfig").tsserver.setup(config())
require("lspconfig").cssls.setup(config())
require("lspconfig").html.setup(config())
require("lspconfig").jsonls.setup(config())
require("lspconfig").eslint.setup(config())
require("lspconfig").sumneko_lua.setup(config({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
}))
