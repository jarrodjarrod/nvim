require('config')
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

if not vim.g.vscode then
    local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
    if not vim.loop.fs_stat(lazypath) then
        vim.fn.system({
            'git',
            'clone',
            '--filter=blob:none',
            'https://github.com/folke/lazy.nvim.git',
            '--branch=stable', -- latest stable release
            lazypath,
        })
    end
    vim.opt.rtp:prepend(lazypath)

    require('lazy').setup('plugins', {
        checker = { enabled = true },
        defaults = {
            lazy = false, -- should plugins be lazy-loaded?
            version = nil,
            -- default `cond` you can use to globally disable a lot of plugins
            -- when running inside vscode for example
            cond = vim.g.vscode, ---@type boolean|fun(self:LazyPlugin):boolean|nil
            -- version = "*", -- enable this to try installing the latest stable versions of plugins
        },
    })
end
