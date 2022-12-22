local Remap = require("jazzimoto.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap

inoremap("<C-Space>", "<Esc>")
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")
vnoremap("<C-j>", ":m '>+1<CR>gv=gv")
vnoremap("<C-k>", ":m '<-2<CR>gv=gv")
nnoremap("<C-p>", ":call VSCodeNotify('workbench.action.quickOpen', 1)<CR>")

nnoremap("<leader>u", ":UndotreeShow<CR>")

nnoremap("Y", "yg$")
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")
nnoremap("J", "mzJ`z")

xnoremap("<leader>p", '"_dP')
vnoremap("<leader>d", '"_d')
nnoremap("<leader>y", '"+y')
nnoremap("<leader>Y", '"+Y')

nnoremap("<leader>o", 'o<Esc>0"_D')
nnoremap("<leader>O", 'O<Esc>0"_D')
nnoremap("<leader>l", "a<Space><Esc>")
nnoremap("<leader>h", "i<Space><Esc>")
nnoremap("<leader>lf", ":call VSCodeNotify('editor.action.formatDocument')<CR>")

nnoremap("<leader>pf", ":call VSCodeNotify('workbench.action.findInFiles', { 'query': expand('<cword>')})<CR>")
nnoremap("gr", ":call VSCodeNotify('editor.action.referenceSearch.trigger')<CR>")
vim.keymap.set({ 'n', 'v', 'i' }, "<leader>e", ":call VSCodeCall('workbench.view.explorer')<CR>", {
  noremap = true
})
