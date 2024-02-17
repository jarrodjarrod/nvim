require('config.options')
require('config.autocmds')

if vim.g.vscode then
    require('config.keymaps').vscode()
else
    require('config.keymaps').nvim()
end
