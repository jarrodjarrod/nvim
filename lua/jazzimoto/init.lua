require("jazzimoto.set")
require("jazzimoto.remap")
require("jazzimoto.keymap")
require("jazzimoto.lazy")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

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

vim.o.termguicolors = true
vim.cmd [[colorscheme tokyonight]]

-- Set lualine as statusline
-- See `:help lualine.txt`
-- require('lualine').setup {
--   options = {
--     icons_enabled = false,
--     component_separators = '|',
--     section_separators = '',
--   },
-- }
--
--
-- -- Enable Comment.nvim
-- require('Comment').setup()
--
-- -- Enable `lukas-reineke/indent-blankline.nvim`
-- -- See `:help indent_blankline.txt`
-- require('indent_blankline').setup {
--   char = '┊',
--   show_trailing_blankline_indent = false,
-- }
--
-- -- Gitsigns
-- -- See `:help gitsigns.txt`
-- require('gitsigns').setup {
--   signs = {
--     add = { text = '+' },
--     change = { text = '~' },
--     delete = { text = '_' },
--     topdelete = { text = '‾' },
--     changedelete = { text = '~' },
--   },
--   sign_priority = 10,
-- }
