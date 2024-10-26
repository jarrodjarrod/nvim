---@diagnostic disable: missing-fields
return {
    'nvim-lua/plenary.nvim',
    'nvim-lua/popup.nvim',
    'mbbill/undotree',
    'ThePrimeagen/vim-be-good',
    'nvim-tree/nvim-web-devicons',
    {
        'nvim-treesitter/nvim-treesitter-context',
        opts = {
            max_lines = 4,
        },
    },
    -- Git related plugins
    {
        'tpope/vim-fugitive',
        config = function()
            vim.keymap.set('n', '<leader>gf', '<CMD>Git<CR><C-w>L', { noremap = true })
        end,
    },
    'tpope/vim-rhubarb',
    'tpope/vim-sleuth',
    { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {} },
    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        config = function()
            require('nvim-autopairs').setup({})
            local cmp_autopairs = require('nvim-autopairs.completion.cmp')
            local cmp = require('cmp')
            cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
        end,
    },
    {
        'kdheepak/lazygit.nvim',
        config = function() vim.keymap.set('n', '<leader>z', '<cmd>LazyGit<cr>') end,
    },
    {
        'lewis6991/gitsigns.nvim',
        opts = {
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
            on_attach = function(bufnr)
                local gs = require('gitsigns')
                -- stylua: ignore start
                vim.keymap.set('n', '<leader>hp', gs.preview_hunk, { buffer = bufnr, desc = 'Preview hunk' })
                vim.keymap.set('n', '<leader>hr', gs.reset_hunk, { buffer = bufnr, desc = 'Reset hunk' })
                vim.keymap.set('n', '<leader>hb', gs.blame_line, { desc = 'Blame line' })
                vim.keymap.set('n', '<leader>tb', gs.toggle_current_line_blame, { desc = 'Toggle show blame line' })
                -- stylua: ignore end

                -- don't override the built-in and fugitive keymaps
                vim.keymap.set({ 'n', 'v' }, ']c', function()
                    if vim.wo.diff then
                        vim.cmd.normal({ ']c', bang = true })
                    else
                        gs.nav_hunk('next')
                    end
                end, { buffer = bufnr, desc = 'Jump to next hunk' })

                vim.keymap.set({ 'n', 'v' }, '[c', function()
                    if vim.wo.diff then
                        vim.cmd.normal({ ']c', bang = true })
                    else
                        gs.nav_hunk('prev')
                    end
                end, { buffer = bufnr, desc = 'Jump to previous hunk' })
            end,
        },
    },
    {
        'numToStr/Comment.nvim',
        event = 'VeryLazy',
        config = function()
            vim.g.skip_ts_context_commentstring_module = true
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
        'ThePrimeagen/harpoon',
        init = function()
            vim.keymap.set('n', '<leader>ha', require('harpoon.mark').add_file)
            vim.keymap.set('n', '<leader>hh', require('harpoon.ui').toggle_quick_menu)
            vim.keymap.set('n', '<leader>gn', require('harpoon.ui').nav_next)
            vim.keymap.set('n', '<leader>gp', require('harpoon.ui').nav_prev)
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
    {
        'stevearc/aerial.nvim',
        opts = {
            on_attach = function() vim.keymap.set('n', '<leader>aa', '<cmd>AerialToggle!<CR>') end,
            layout = {
                default_direction = 'prefer_left',
            },
        },
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'nvim-tree/nvim-web-devicons',
        },
    },
    {
        'b0o/SchemaStore.nvim',
        lazy = true,
        version = false,
    },
    {
        'folke/trouble.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {},
    },
    {
        'stevearc/oil.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            view_options = {
                show_hidden = true,
            },
        },
    },
    { 'junegunn/fzf.vim', dependencies = { 'junegunn/fzf' } },
    {
        'folke/trouble.nvim',
        opts = {},
        cmd = 'Trouble',
        keys = {
            {
                '<leader>xx',
                '<cmd>Trouble diagnostics toggle<cr>',
                desc = 'Diagnostics (Trouble)',
            },
            {
                '<leader>xX',
                '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
                desc = 'Buffer Diagnostics (Trouble)',
            },
            {
                '<leader>cs',
                '<cmd>Trouble symbols toggle focus=false<cr>',
                desc = 'Symbols (Trouble)',
            },
            {
                '<leader>cl',
                '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
                desc = 'LSP Definitions / references / ... (Trouble)',
            },
            {
                '<leader>xL',
                '<cmd>Trouble loclist toggle<cr>',
                desc = 'Location List (Trouble)',
            },
            {
                '<leader>xQ',
                '<cmd>Trouble qflist toggle<cr>',
                desc = 'Quickfix List (Trouble)',
            },
        },
    },
    -- { 'dmmulroy/tsc.nvim', opts = {} },
    -- "b0o/SchemaStore.nvim",
    -- "MunifTanjim/nui.nvim",
    -- "windwp/nvim-spectre",
    -- "rlch/github-notifications.nvim",
    -- "folke/twilight.nvim",
}
