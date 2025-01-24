return {
    'stevearc/conform.nvim',
    enabled = true,
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
        {
            '<leader>lf',
            function() require('conform').format({ async = true }) end,
            mode = '',
            desc = 'format buffer',
        },
    },
    opts = {
        formatters_by_ft = {
            html = { 'prettierd' },
            json = { lsp_format = 'fallback' },
            lua = { 'stylua' },
            python = { 'black' },
            typescript = { 'prettierd' },
            typescriptreact = { 'prettierd' },
        },
        format_on_save = {
            timeout_ms = 1000,
            lsp_format = 'fallback',
        },
        formatters = {
            shfmt = { prepend_args = { '-i', '2' } },
        },
    },
}
