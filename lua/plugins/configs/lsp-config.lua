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

local ensure_installed = {
    'tsserver',
    'cssls',
    'eslint',
    'html',
    'lua_ls',
    'pyright',
    'bashls',
    'denols',
    'typos_lsp',
}

require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local lsp_capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require('cmp_nvim_lsp').default_capabilities(lsp_capabilities)
local nvim_lsp = require('lspconfig')

local handlers = {
    function(server_name)
        nvim_lsp[server_name].setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })
    end,
    ['lua_ls'] = function()
        nvim_lsp.lua_ls.setup({
            settings = {
                Lua = { diagnostics = { globals = { 'vim' } }, format = { enable = false } },
            },
            on_attach = on_attach,
            capabilities = capabilities,
        })
    end,
    ['denols'] = function()
        nvim_lsp.denols.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            root_dir = nvim_lsp.util.root_pattern('deno.json', 'deno.jsonc'),
        })
    end,
    ['tsserver'] = function()
        nvim_lsp.tsserver.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            root_dir = nvim_lsp.util.root_pattern('package.json'),
            single_file_support = false,
        })
    end,
    ['jsonls'] = function()
        nvim_lsp.jsonls.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                json = {
                    schemas = require('schemastore').json.schemas(),
                    validate = { enable = true },
                    format = { enable = true, insertFinalNewline = false },
                },
            },
        })
    end,
}

require('mason-lspconfig').setup({ ensure_installed = ensure_installed, handlers = handlers })

vim.lsp.handlers['textDocument/hover'] =
    vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
vim.lsp.handlers['textDocument/signatureHelp'] =
    vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' })
