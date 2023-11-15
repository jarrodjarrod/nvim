-- @tokyonight_moon_colours
local colours = {
    bg = '#222436',
    bg_dark = '#1e2030',
    bg_float = '#1e2030',
    bg_highlight = '#2f334d',
    bg_popup = '#1e2030',
    bg_search = '#3e68d7',
    bg_sidebar = '#1e2030',
    bg_statusline = '#1e2030',
    bg_visual = '#2d3f76',
}

-- Palettes are the base color defines of a colorscheme.
-- You can override these palettes for each colorscheme defined by github-theme.
local palettes = {
    github_dark = {
        bg1 = colours.bg,
        bg0 = colours.bg,
        bg2 = colours.bg,
        bg3 = colours.bg,
        bg4 = colours.bg,
    },
}

-- Specs (specifications) are a mapping of palettes to logical groups that will
-- be used by the groups. Some examples of the groups that specs map would be:
--   - syntax groups (functions, types, keywords, ...)
--   - diagnostic groups (error, warning, info, hints)
--   - git groups (add, removed, changed)
--
-- You can override these just like palettes
local specs = {
    github_dark = {
        syntax = {
            conditional = 'magenta.bright',
            keyword = 'magenta',
            number = 'orange',
            operator = 'orange',
        },
    },
}

-- Groups are the highlight group definitions. The keys of this table are the
-- names of the highlight groups that will be overridden. The value is a table
-- with the following keys: fg, bg, style, sp, link
local groups = {
    -- As with specs and palettes, a specific style's value will be used
    -- over the `all` value.
    github_dark_tritanopia = {
        -- TelescopeNormal = { bg = colours.bg },
        -- ColorColumn = { bg = colours.bg_dark },
    },
    github_dark = {
        PmenuSel = { bg = '#73daca', fg = 'bg0' },
        TelescopeNormal = { bg = 'bg1' },
    },
}

require('github-theme').setup({
    palettes = palettes,
    specs = specs,
    groups = groups,
    options = {
        transparent = true,
        styles = {
            comments = 'italic',
            functions = 'bold',
        },
        inverse = {
            match_paren = true,
            visual = true,
            search = true,
        },
    },
})

vim.cmd.colorscheme('github_dark_tritanopia')
