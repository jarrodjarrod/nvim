return {
    'github/copilot.vim',
    enabled = true,
    event = 'InsertEnter',
    config = function() vim.cmd('Copilot disable') end,
}
