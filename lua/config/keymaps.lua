M = {}

M.nvim = function()
    vim.keymap.set('n', '<c-d>', '<c-d>zz')
    vim.keymap.set('n', '<c-k>', '<cmd>cprev<cr>zz')
    vim.keymap.set('n', '<c-j>', '<cmd>cnext<cr>zz')
    vim.keymap.set('n', '<c-u>', '<c-u>zz')
    vim.keymap.set('n', '<down>', '<c-w>j')
    vim.keymap.set('n', '<leader><tab><tab>', '<cmd>tabe %<cr>')
    vim.keymap.set('n', '<leader>O', 'O<Esc>0"_D')
    vim.keymap.set('n', '<leader>X', '<cmd>!chmod -x %<cr>')
    vim.keymap.set('n', '<leader>Y', '"+Y')
    vim.keymap.set('n', '<leader>d', '"_d')
    vim.keymap.set('n', '<leader>e', '<cmd>Explore<cr>')
    vim.keymap.set('n', '<leader>hh', 'i<Space><Esc>')
    vim.keymap.set('n', '<leader>j', '<cmd>lprev<cr>zz')
    vim.keymap.set('n', '<leader>k', '<cmd>lnext<cr>zz')
    vim.keymap.set('n', '<leader>ll', 'a<Space><Esc>')
    vim.keymap.set('n', '<leader>o', 'o<Esc>0"_D')
    vim.keymap.set('n', '<leader>q', '<cmd>copen<cr>')
    vim.keymap.set('n', '<leader>ss', ':%s/\\<<c-r><c-w>\\>/<c-r><c-w>/gI<left><left><left>')
    vim.keymap.set('n', '<leader>u', '<cmd>UndotreeShow<cr>')
    vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<cr>')
    vim.keymap.set('n', '<leader>y', '"+y')
    vim.keymap.set('n', '<left>', '<c-w>h')
    vim.keymap.set('n', '<right>', '<c-w>l')
    vim.keymap.set('n', '<up>', '<c-w>k')
    vim.keymap.set('n', 'J', 'mzJ`z')
    vim.keymap.set('n', 'J', 'mzJ`z')
    vim.keymap.set('n', 'Q', '<nop>')
    vim.keymap.set('n', 'Y', 'yg$')
    vim.keymap.set('n', '[q', '<cmd>cprev<cr>')
    vim.keymap.set('n', ']q', '<cmd>cnext<cr>')
    vim.keymap.set('n', '&', '<cmd>&<cr>', { noremap = true })
    vim.keymap.set('v', '<leader>d', '"_d')
    vim.keymap.set('v', '<leader>y', '"+y')
    vim.keymap.set('v', 'J', ":m '>+1<cr>gv=gv")
    vim.keymap.set('v', 'K', ":m '<-2<cr>gv=gv")
    vim.keymap.set('x', '<leader>p', '"_dP')
    vim.keymap.set({ 'n', 'i', 'v', 'x' }, '<c-s>', '<cmd>w<cr>')
    -- vim.cmd.tnoremap('<Esc>', '<c-\\><c-n>')
    -- Diagnostic keymaps
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic' })
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic' })
    vim.keymap.set('n', 'gl', vim.diagnostic.open_float, { desc = 'Open floating diagnostic' })
    vim.keymap.set('n', 'gq', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
end

M.vscode = function()
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

    vim.keymap.set(
        'n',
        '<leader>pf',
        "<cmd>call VSCodeNotify('workbench.action.findInFiles', { 'query': expand('<cword>')})<CR>"
    )
    vim.keymap.set('n', 'gr', "<cmd>call VSCodeNotify('editor.action.referenceSearch.trigger')<CR>")
    vim.keymap.set(
        { 'n', 'v', 'i' },
        '<leader>e',
        "<cmd>call VSCodeCall('workbench.view.explorer')<CR>",
        { noremap = true }
    )
    vim.keymap.set(
        'n',
        '<c-s-n>',
        "<cmd>call VSCodeCall('search.action.focusNextSearchResult')<CR>"
    )
    vim.keymap.set(
        'n',
        '<c-s-p>',
        "<cmd>call VSCodeCall('search.action.focusPreviousSearchResult')<CR>"
    )
end

return M
