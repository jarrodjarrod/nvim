vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function() vim.highlight.on_yank() end,
})

vim.api.nvim_create_autocmd('BufWritePre', {
    callback = function()
        if vim.fn.exists(':EslintFixAll') == 0 then return end
        vim.cmd('EslintFixAll')
    end,
})
