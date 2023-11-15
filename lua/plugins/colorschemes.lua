return {
    {
        'catppuccin/nvim',
        enabled = true,
        name = 'catppuccin',
        priority = 1000,
    },

    {
        'projekt0n/github-nvim-theme',
        enabled = true,
        lazy = false,
        priority = 1000,
        config = function() require('plugins.configs.github-theme') end,
    },

    {
        'folke/tokyonight.nvim',
        enabled = true,
        lazy = false,
        priority = 1000,
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
        end,
    },

    {
        'sainnhe/gruvbox-material',
        name = 'gruvbox-material',
        enabled = true,
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.gruvbox_material_better_performance = 1

            -- Fonts
            vim.g.gruvbox_material_disable_italic_comment = 0
            vim.g.gruvbox_material_enable_bold = 1
            vim.g.gruvbox_material_enable_italic = 0
            vim.g.gruvbox_material_transparent_background = 1

            -- Themes
            -- vim.g.gruvbox_material_background = 'hard'
            -- vim.g.gruvbox_material_current_word = 'underline'
            vim.g.gruvbox_material_cursor = 'auto'
            -- vim.g.gruvbox_material_diagnostic_virtual_text = 'colored'
            -- vim.g.gruvbox_material_float_style = 'bright'
            vim.g.gruvbox_material_foreground = 'mix'

            --- @possible values: 'grey', 'red', 'orange', 'yellow', 'green', 'aqua', 'blue', 'purple'
            vim.g.gruvbox_material_menu_selection_background = 'aqua'
            vim.g.gruvbox_material_ui_contrast = 'high'
        end,
    },

    {
        'rose-pine/neovim',
        enabled = true,
        lazy = false,
        priority = 1000,
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
}
