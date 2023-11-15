return {
    'neovim/nvim-lspconfig',
    event = 'VeryLazy',
    dependencies = {
        'williamboman/mason-lspconfig.nvim',
        { 'williamboman/mason.nvim', build = ':MasonUpdate', config = true },
        'folke/neodev.nvim',
        'hrsh7th/cmp-nvim-lsp',
    },
    config = function() require('jazzimoto.plugins.configs.lsp-config') end,
}
