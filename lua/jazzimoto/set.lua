vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.errorbells = false
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
-- vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
-- vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
-- Give more space for displaying messages.
vim.opt.cmdheight = 1
-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 50
-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append("c")
vim.opt.colorcolumn = "100"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.guifont = "MonoLisa:h14"
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.splitbelow = true  -- force all horizontal splits to go below current window
vim.opt.splitright = true  -- force all vertical splits to go to the right of current window
vim.g.netrw_banner = 0
-- vim.g.netrw_liststyle = 3
