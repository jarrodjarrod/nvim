local nnoremap = require("vsvim.keymap").nnoremap

nnoremap("<leader>wf", ":call VSCodeNotify('workbench.action.findInFiles', { 'query': expand('<cword>')})<CR>")
nnoremap("<C-P>", ":call VSCodeNotify('workbench.action.quickOpen', 1)<CR>")
nnoremap("gr", ":call VSCodeNotify('editor.action.referenceSearch.trigger')<CR>")
