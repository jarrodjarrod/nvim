local Remap = require("vsvim.keymap")
local nnoremap = Remap.nnoremap

nnoremap("<leader>vf", ":call VSCodeNotify('workbench.action.findInFiles', { 'query': expand('<cword>')})<CR>")

