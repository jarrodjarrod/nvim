return {
    'zbirenbaum/copilot.lua',
    enabled = false,
    event = 'InsertEnter',
    build = ':Copilot auth',
    config = function() require('jazzimoto.plugins.configs.copilot-lua') end,
}
