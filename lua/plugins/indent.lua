return {
    'echasnovski/mini.indentscope',
    dependencies = {
        -- Using both in conjunction looks nice. Indent-blankline is setup in
        -- the same file as mini.indentscope.
        'lukas-reineke/indent-blankline.nvim',
    },
    name = 'mini.indentscope',
    event = 'VeryLazy',
    config = function() require('plugins.configs.indent') end,
}
