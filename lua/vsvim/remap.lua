vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true })
vim.keymap.set('v', '<C-j>', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', '<C-k>', ":m '<-2<CR>gv=gv")

vim.keymap.set('n', 'Y', 'yg$', { noremap = true })
vim.keymap.set('n', 'n', 'nzzzv', { noremap = true })
vim.keymap.set('n', 'N', 'Nzzzv', { noremap = true })
vim.keymap.set('n', 'J', 'mzJ`z', { noremap = true })

vim.keymap.set('x', '<leader>p', '"_dP', { noremap = true })
vim.keymap.set('v', '<leader>d', '"_d', { noremap = true })
vim.keymap.set('n', '<leader>y', '"+y', { noremap = true })
vim.keymap.set('n', '<leader>Y', '"+Y', { noremap = true })

vim.keymap.set('n', '<leader>o', 'o<Esc>0"_D', { noremap = true })
vim.keymap.set('n', '<leader>O', 'O<Esc>0"_D', { noremap = true })
vim.keymap.set('n', '<leader>l', 'a<Space><Esc>')
vim.keymap.set('n', '<leader>h', 'i<Space><Esc>')
vim.keymap.set('n', '<leader>lf', "<cmd>call VSCodeNotify('editor.action.formatDocument')<CR>")

vim.keymap.set('n', '<leader>pf', "<cmd>call VSCodeNotify('workbench.action.findInFiles', { 'query': expand('<cword>')})<CR>")
vim.keymap.set('n', 'gr', "<cmd>call VSCodeNotify('editor.action.referenceSearch.trigger')<CR>")
vim.keymap.set({ 'n', 'v', 'i' }, '<leader>e', "<cmd>call VSCodeCall('workbench.view.explorer')<CR>", {
  noremap = true,
})
vim.keymap.set('n', '<C-p>', "<cmd>call VSCodeCall('workbench.action.quickOpen')<CR>")
