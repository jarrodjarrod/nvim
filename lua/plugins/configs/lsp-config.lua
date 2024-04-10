-- LSP settings.
-- This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
    local map = function(keys, func, desc, mode)
        if desc then desc = 'LSP: ' .. desc end
        vim.keymap.set(mode or 'n', keys, func, { buffer = bufnr, desc = desc })
    end

    map('<leader>lr', vim.lsp.buf.rename, 'Rename')
    map('<leader>lc', vim.lsp.buf.code_action, 'Code Action')
    -- map('<leader>lf', vim.lsp.buf.format, 'Format')
    map('gD', vim.lsp.buf.definition, 'Goto Definition')
    map('gI', vim.lsp.buf.implementation, 'Goto Implementation')
    -- See `:help K` for why this keymap
    map('K', vim.lsp.buf.hover, 'Hover Documentation')
    map('<c-h>', vim.lsp.buf.signature_help, 'signature documentation', { 'i', 'n' })
    map('<leader>wa', vim.lsp.buf.add_workspace_folder, 'Workspace Add Folder')
    map('<leader>wr', vim.lsp.buf.remove_workspace_folder, 'Workspace Remove Folder')
    map(
        '<leader>wl',
        function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
        'Workspace List Folders'
    )
    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(
        bufnr,
        'Format',
        function(_) vim.lsp.buf.format() end,
        { desc = 'Format current buffer with LSP' }
    )
end

--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
    -- clangd = {},
    -- gopls = {},
    -- yamlls = {}
    tsserver = {},
    rust_analyzer = {},
    cssls = {},
    eslint = {},
    html = {},
    jsonls = {
        json = {
            schemas = require('schemastore').json.schemas(),
            format = { enable = true, insertFinalNewline = false },
            validate = { enable = true },
        },
    },
    lua_ls = { Lua = { format = { enable = false } } },
    pyright = {},
    bashls = {},
}

-- Setup neovim lua configuration
require('neodev').setup()
-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local lsp_capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require('cmp_nvim_lsp').default_capabilities(lsp_capabilities)
local mason_lspconfig = require('mason-lspconfig')
mason_lspconfig.setup({ ensure_installed = vim.tbl_keys(servers) })

mason_lspconfig.setup_handlers({
    function(server_name)
        require('lspconfig')[server_name].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
        })
    end,
})

vim.lsp.handlers['textDocument/hover'] =
    vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
vim.lsp.handlers['textDocument/signatureHelp'] =
    vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' })
