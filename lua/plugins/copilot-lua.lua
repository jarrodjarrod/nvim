return {
    'zbirenbaum/copilot.lua',
    enabled = true,
    event = 'InsertEnter',
    build = ':Copilot auth',
    config = function() require('plugins.configs.copilot-lua') end,
}
