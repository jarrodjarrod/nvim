local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("jazzimoto.lsp.mason")
require("jazzimoto.lsp.handlers").setup()
require("jazzimoto.lsp.null-ls")
