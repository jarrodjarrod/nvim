require("jazzimoto.set")
require("jazzimoto.remap")
require("jazzimoto.keymap")
require("jazzimoto.packer")
require("jazzimoto.lsp")
require("jazzimoto.telescope")
require("jazzimoto.treesitter")

local augroup = vim.api.nvim_create_augroup

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 80,
        })
    end,
})

vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
