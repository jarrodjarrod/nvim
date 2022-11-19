require("telescope")

local Remap = require("jazzimoto.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

nnoremap("<leader>e", ":Ex<CR>")
nnoremap("<leader>u", ":UndotreeShow<CR>")

vnoremap("<C-j>", ":m '>+1<CR>gv=gv")
vnoremap("<C-k>", ":m '<-2<CR>gv=gv")

nnoremap("Y", "yg$")
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")
nnoremap("J", "mzJ`z")
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")

-- greatest remap ever
xnoremap("<leader>p", "\"_dP")

-- next greatest remap ever : asbjornHaland
nnoremap("<leader>y", "\"+y")
vnoremap("<leader>y", "\"+y")
nmap("<leader>Y", "\"+Y")

nnoremap("<leader>d", "\"_d")
vnoremap("<leader>d", "\"_d")

nnoremap("<leader>o", "o<Esc>0\"_D")
nnoremap("<leader>O", "O<Esc>0\"_D")
-- nnoremap("<leader>l", "a<Space><Esc>")
-- nnoremap("<leader>h", "i<Space><Esc>")

-- This is going to get me cancelled
inoremap("<C-c>", "<Esc>")
inoremap("jj", "<Esc>")

nnoremap("<C-p>", function()
    require('telescope.builtin').git_files()
end)

nnoremap("<leader>ps", function()
    require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})
end)

nnoremap("<Leader>pf", function()
    require('telescope.builtin').find_files()
end)

nnoremap("<leader>pw", function()
    require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }
end)

nnoremap("<leader>pb", function()
    require('telescope.builtin').buffers()
end)

nnoremap("<leader>vh", function()
    require('telescope.builtin').help_tags()
end)

--nnoremap("<leader>vrc", function()
--    require('theprimeagen.telescope').search_dotfiles({ hidden = true })
--end)
--
--nnoremap("<leader>va", function()
--    require('theprimeagen.telescope').anime_selector()
--end)
--
--nnoremap("<leader>vc", function()
--    require('theprimeagen.telescope').chat_selector()
--end)
--
--nnoremap("<leader>gc", function()
--    require('theprimeagen.telescope').git_branches()
--end)

nnoremap("<leader>gw", function()
    require('telescope').extensions.git_worktree.git_worktrees()
end)

nnoremap("<leader>gm", function()
    require('telescope').extensions.git_worktree.create_git_worktree()
end)

--nnoremap("<leader>td", function()
--    require('theprimeagen.telescope').dev()
--end)
