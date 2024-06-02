return {
    'zbirenbaum/copilot.lua',
    enabled = false,
    event = 'InsertEnter',
    build = ':Copilot auth',
    config = function() require('plugins.configs.copilot-lua') end,
}
