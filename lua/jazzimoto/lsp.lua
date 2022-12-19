local nnoremap = require("jazzimoto.keymap").nnoremap
local inoremap = require("jazzimoto.keymap").inoremap
local lsp = require("lsp-zero")
lsp.preset("recommended")

lsp.ensure_installed({
  "cssls",
  "eslint",
  "html",
  "jsonls",
  "rust_analyzer",
  "sumneko_lua",
  "tsserver",
})

lsp.configure("sumneko_lua", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
  ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
  ["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
  ["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
  ["<C-y>"] = cmp.mapping.confirm({ select = true }),
  ["<C-i>"] = cmp.mapping.complete(),
})

-- disable completion with tab for better copilot setup
cmp_mappings["<Tab>"] = nil
cmp_mappings["<S-Tab>"] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings,
})

lsp.set_preferences({
  sign_icons = {
    error = 'e',
    warn = 'w',
    hint = 'h',
    info = 'i'
  }
})

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr }

  inoremap("<C-h>", vim.lsp.buf.signature_help, opts)
  nnoremap("<leader>lca", vim.lsp.buf.code_action, opts)
  nnoremap("<leader>lf", vim.lsp.buf.format, opts)
  nnoremap("<leader>lr", vim.lsp.buf.rename, opts)
  nnoremap("<leader>lws", vim.lsp.buf.workspace_symbol, opts)
  nnoremap("K", vim.lsp.buf.hover, opts)
  nnoremap("[d", vim.diagnostic.goto_prev, opts)
  nnoremap("]d", vim.diagnostic.goto_next, opts)
  nnoremap("gD", vim.lsp.buf.declaration, opts)
  nnoremap("gI", vim.lsp.buf.implementation, opts)
  nnoremap("gd", vim.lsp.buf.definition, opts)
  nnoremap("gl", vim.diagnostic.open_float, opts)
  nnoremap("gr", vim.lsp.buf.references, opts)
end)

lsp.setup()

vim.diagnostic.config({
  virtual_text = true,
})
