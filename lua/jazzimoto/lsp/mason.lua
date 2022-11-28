local servers = {
  "cssls",
  "html",
  "jsonls",
  "sumneko_lua",
  "tsserver",
}

local settings = {
  ui = {
    border = "none",
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
  ensure_installed = servers,
  automatic_installation = true,
})

local status_lspconfig, lspconfig = pcall(require, "lspconfig")
if not status_lspconfig then
  return
end

local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = require("jazzimoto.lsp.handlers").on_attach,
    capabilities = require("jazzimoto.lsp.handlers").capabilities,
  }

  server = vim.split(server, "@")[1]

  local status_lsp_settings, conf_opts = pcall(require, "jazzimoto.lsp.settings." .. server)
  if status_lsp_settings then
    opts = vim.tbl_deep_extend("force", conf_opts, opts)
  end

  lspconfig[server].setup(opts)
end
