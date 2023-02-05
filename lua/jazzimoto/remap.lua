local Remap = require("jazzimoto.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap

nnoremap("<leader>u", ":UndotreeShow<CR>")

nnoremap("Y", "yg$")
nnoremap("J", "mzJ`z")

nnoremap("<leader>ll", "a<Space><Esc>")
nnoremap("<leader>hh", "i<Space><Esc>")
nnoremap("<leader>o", 'o<Esc>0"_D')
nnoremap("<leader>O", 'O<Esc>0"_D')
inoremap("<c-c>", "<nop>")

nnoremap("<leader>e", vim.cmd.Ex)

vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")

nnoremap("J", "mzJ`z")

-- greatest remap ever
xnoremap("<leader>p", '"_dP')

-- next greatest remap ever : asbjornHaland
nnoremap("<leader>y", '"+y')
vnoremap("<leader>y", '"+y')
nnoremap("<leader>Y", '"+Y')

nnoremap("<leader>d", '"_d')
vnoremap("<leader>d", '"_d')

nnoremap("Q", "<nop>")
nnoremap("<C-k>", "<cmd>cnext<CR>zz")
nnoremap("<C-j>", "<cmd>cprev<CR>zz")
nnoremap("<leader>k", "<cmd>lnext<CR>zz")
nnoremap("<leader>j", "<cmd>lprev<CR>zz")
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")

nnoremap("<leader>ss", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- Move to window using the movement keys
nnoremap("<left>", "<C-w>h")
nnoremap("<down>", "<C-w>j")
nnoremap("<up>", "<C-w>k")
nnoremap("<right>", "<C-w>l")

-- I know what this does but I don't understand how it's useful yet
-- nnoremap("<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- qflist
nnoremap("<leader>q", ":copen<CR>")
nnoremap("]q", ":cnext<CR>")
nnoremap("[q", ":cprev<CR>")
