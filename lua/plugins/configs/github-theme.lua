-- Groups are the highlight group definitions. The keys of this table are the
-- names of the highlight groups that will be overridden. The value is a table
-- with the following keys: fg, bg, style, sp, link
local groups = {
    all = {
        FloatBorder = { link = 'NormalFloat' },
    },
}

local options = {
    transparent = true,
    styles = {
        comments = 'italic',
        functions = 'bold',
        types = 'underdotted',
    },
    inverse = { match_paren = false, visual = false, search = false },
    darken = { floats = false },
}

require('github-theme').setup({
    groups = groups,
    options = options,
})

vim.cmd.colorscheme('github_dark_tritanopia')
