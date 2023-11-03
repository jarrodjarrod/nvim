return {
    'nvim-lua/plenary.nvim',
    'nvim-lua/popup.nvim',
    'mbbill/undotree',
    'nvim-treesitter/nvim-treesitter-context',
    'ThePrimeagen/vim-be-good',

    -- Git related plugins
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',

    'lukas-reineke/indent-blankline.nvim', -- Add indentation guides even on blank lines
    'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
    { 'jose-elias-alvarez/typescript.nvim', opts = {} },
    { 'windwp/nvim-autopairs', opts = {} },
    { 'nvim-treesitter/nvim-treesitter-context', opts = {} },

    {
        'kdheepak/lazygit.nvim',
        config = function() vim.keymap.set('n', '<leader>z', '<cmd>LazyGit<cr>') end,
    },

    {
        -- Adds git releated signs to the gutter, as well as utilities for managing changes
        'lewis6991/gitsigns.nvim',
        opts = {
            -- See `:help gitsigns.txt`
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
            on_attach = function(bufnr)
                vim.keymap.set(
                    'n',
                    '<leader>ph',
                    require('gitsigns').preview_hunk,
                    { buffer = bufnr, desc = 'Preview hunk' }
                )
                -- don't override the built-in and fugitive keymaps
                local gs = package.loaded.gitsigns
                vim.keymap.set({ 'n', 'v' }, ']c', function()
                    if vim.wo.diff then return ']c' end
                    vim.schedule(function() gs.next_hunk() end)
                    return '<Ignore>'
                end, { expr = true, buffer = bufnr, desc = 'Jump to next hunk' })
                vim.keymap.set({ 'n', 'v' }, '[c', function()
                    if vim.wo.diff then return '[c' end
                    vim.schedule(function() gs.prev_hunk() end)
                    return '<Ignore>'
                end, { expr = true, buffer = bufnr, desc = 'Jump to previous hunk' })
            end,
        },
    },

    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup({
                pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
            })
        end,
    },

    {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function() return vim.fn.executable('make') == 1 end,
    },

    {
        'sainnhe/gruvbox-material',
        name = 'gruvbox-material',
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.gruvbox_material_better_performance = 1
            -- Fonts
            vim.g.gruvbox_material_disable_italic_comment = 0
            vim.g.gruvbox_material_enable_italic = 0
            vim.g.gruvbox_material_enable_bold = 1
            vim.g.gruvbox_material_transparent_background = 1
            -- Themes
            vim.g.gruvbox_material_foreground = 'mix'
            vim.g.gruvbox_material_background = 'hard'
            vim.g.gruvbox_material_ui_contrast = 'high'
            vim.g.gruvbox_material_float_style = 'dim'
            vim.g.gruvbox_material_cursor = 'red'
            vim.g.gruvbox_material_menu_selection_background = 'yellow'
            vim.g.gruvbox_material_diagnostic_virtual_text = 'colored'

            vim.cmd([[colorscheme "gruvbox-material"]])
        end,
    },

    {
        'rose-pine/neovim',
        lazy = false,
        config = function()
            require('rose-pine').setup({
                --- @usage 'auto'|'main'|'moon'|'dawn'
                variant = 'auto',
                --- @usage 'main'|'moon'|'dawn'
                dark_variant = 'moon',
                disable_background = true,
                disable_float_background = true,
            })
        end,
    },

    {
        -- Theme inspired by Atom
        'navarasu/onedark.nvim',
        -- init = function() vim.cmd([[colorscheme onedark]]) end,
        lazy = false,
    },

    {
        'folke/tokyonight.nvim',
        lazy = false,
        config = function()
            require('tokyonight').setup({
                style = 'moon',
                styles = {
                    -- Style to be applied to different syntax groups
                    -- Value is any valid attr-list value for `:help nvim_set_hl`
                    comments = { italic = true },
                    keywords = { italic = true },
                    functions = {},
                    variables = {},
                    -- Background styles. Can be "dark", "transparent" or "normal"
                    sidebars = 'dark', -- style for sidebars, see below
                    floats = 'transparent', -- style for floating windows
                },
                transparent = true,
                on_colors = function(colors) colors.error = '#ff0000' end,
                on_highlights = function(hl, c) hl.IncSearch = { bg = '#ff66ff', fg = '#66ff66' } end,
            })

            -- vim.cmd([[colorscheme tokyonight-moon]])
            -- vim.api.nvim_set_hl(0, 'Cursor', { bg = '#ff007c', fg = '#ffffff' })
            -- vim.o.guicursor = 'a:block-Cursor,i:ver25'
        end,
    },

    {
        'ThePrimeagen/harpoon',
        init = function()
            vim.keymap.set('n', '<leader>a', require('harpoon.mark').add_file)
            vim.keymap.set('n', '<c-e>', require('harpoon.ui').toggle_quick_menu)
            vim.keymap.set('n', '<leader>1', function() require('harpoon.ui').nav_file(1) end)
            vim.keymap.set('n', '<leader>2', function() require('harpoon.ui').nav_file(2) end)
            vim.keymap.set('n', '<leader>3', function() require('harpoon.ui').nav_file(3) end)
            vim.keymap.set('n', '<leader>4', function() require('harpoon.ui').nav_file(4) end)
            vim.keymap.set('n', '<leader>5', function() require('harpoon.ui').nav_file(5) end)
            vim.keymap.set('n', '<leader>6', function() require('harpoon.ui').nav_file(6) end)
            vim.keymap.set('n', '<leader>7', function() require('harpoon.ui').nav_file(7) end)
            vim.keymap.set('n', '<leader>8', function() require('harpoon.ui').nav_file(8) end)
            vim.keymap.set('n', '<leader>9', function() require('harpoon.ui').nav_file(9) end)
        end,
        opts = {
            menu = {
                width = vim.api.nvim_win_get_width(0) - 4,
                height = vim.api.nvim_win_get_height(0) - 10,
            },
        },
    },

    {
        'folke/which-key.nvim',
        event = 'VeryLazy',
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {},
    },

    -- "b0o/SchemaStore.nvim",
    -- "MunifTanjim/nui.nvim",
    -- "windwp/nvim-spectre",
    -- "rlch/github-notifications.nvim",
    -- "folke/twilight.nvim",
}
