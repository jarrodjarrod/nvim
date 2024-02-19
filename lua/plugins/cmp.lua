---@diagnostic disable: missing-fields
return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        -- Autocompletion
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/nvim-cmp',

        -- -- For vsnip users.
        -- 'hrsh7th/cmp-vsnip',
        -- 'hrsh7th/vim-vsnip',

        -- luasnip users
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',

        'rafamadriz/friendly-snippets',
    },
    event = { 'InsertEnter', 'CmdlineEnter' },
    config = function()
        local cmp = require('cmp')
        local luasnip = require('luasnip')
        require('luasnip.loaders.from_vscode').lazy_load()
        luasnip.config.setup({})

        cmp.setup({
            snippet = {
                expand = function(args) luasnip.lsp_expand(args.body) end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-e>'] = vim.NIL,
                ['<Tab>'] = vim.NIL,
                ['<S-tab>'] = vim.NIL,
                ['<C-i>'] = cmp.mapping.complete(),
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-n>'] = cmp.mapping.select_next_item(),
                ['<C-p>'] = cmp.mapping.select_prev_item(),
                ['<CR>'] = cmp.mapping.confirm({
                    cmp.ConfirmBehavior.Replace,
                    select = true,
                }),
            }),
            sources = {
                { name = 'path' },
                { name = 'nvim_lsp' },
                { name = 'buffer', keyword_length = 2 },
                { name = 'luasnip', keyword_length = 2 },
            },
            completion = {
                completeopt = 'menu,menuone,noinsert',
            },
        })

        -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline({ '/', '?' }, {
            completion = { autocomplete = false },
            mapping = cmp.mapping.preset.cmdline(),
            -- sources = { { name = 'buffer' } },
            sources = { name = 'buffer', opts = { keyword_pattern = [=[[^[:blank:]].*]=] } },
        })

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({ { name = 'path' } }, { { name = 'cmdline' } }),
        })
    end,
}
