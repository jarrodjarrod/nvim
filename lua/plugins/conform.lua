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
    -- Everything in opts will be passed to setup()
    opts = {
        -- Define your formatters
        formatters_by_ft = {
            lua = { 'stylua' },
            python = { 'black' },
            typescript = { 'prettierd', 'prettier', stop_after_first = true },
            typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
            html = { 'prettierd', 'prettier', stop_after_first = true },
            json = { 'jsonls', 'deno_fmt' },
            -- ['*'] = { 'codespell' },
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
