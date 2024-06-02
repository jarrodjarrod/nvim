return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-file-browser.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
        },
        'nvim-telescope/telescope-symbols.nvim',
        'nvim-telescope/telescope-z.nvim',
        { 'nvim-telescope/telescope-live-grep-args.nvim', version = '^1.0.0' },
    },
    keys = {
        { '<leader>sg', '<cmd>Telescope git_files<cr>' },
        { '<leader>ga', '<cmd>Telescope live_grep_args<cr>', desc = 'live grep args' },
        { '<leader>D', '<cmd>Telescope lsp_type_definitions<cr>', desc = 'type definition' },
        { '<leader>ch', '<cmd>Telescope command_history<cr>', desc = 'command history' },
        { '<leader>ds', '<cmd>Telescope lsp_document_symbols<cr>', desc = 'document symbols' },
        { '<leader>fC', '<cmd>Telescope commands<cr>', desc = 'commands' },
        { '<leader>ff', '<cmd>Telescope find_files no_ignore=true<cr>', desc = 'find files' },
        {
            '<leader>fs',
            function()
                require('telescope.builtin').grep_string({ search = vim.fn.input('Grep > ') })
            end,
            { desc = 'grep string' },
        },
        { '<leader>fw', '<cmd>Telescope grep_string<cr>', desc = 'find word' },
        { '<leader>fz', '<cmd>Telescope z list<cr>', desc = 'find zoxide' }, -- doesn't seem to be working
        { '<leader>gc', '<cmd>Telescope git_commits<cr>', desc = 'git commits' },
        { '<leader>gs', '<cmd>Telescope git_status<cr>', desc = 'git status' },
        { '<leader>ht', '<cmd>Telescope help_tags<cr>', { desc = 'help tags' } },
        { '<leader>lg', '<cmd>Telescope live_grep<cr>', desc = 'live grep' },
        { '<leader>r', '<cmd>Telescope resume<cr>', desc = 'resume' },
        { '<leader>sC', '<cmd>Telescope commands<cr>', desc = 'Commands' },
        { '<leader>sD', '<cmd>Telescope diagnostics<cr>', desc = 'Workspace diagnostics' },
        { '<leader>sH', '<cmd>Telescope highlights<cr>', desc = 'search highlight groups' },
        { '<leader>sM', '<cmd>Telescope man_pages<cr>', desc = 'man pages' },
        { '<leader>sa', '<cmd>Telescope autocommands<cr>', desc = 'Auto Commands' },
        { '<leader>sa', '<cmd>Telescope autocommands<cr>', desc = 'auto commands' },
        { '<leader><leader>', '<cmd>Telescope current_buffer_fuzzy_find<cr>', desc = 'buffer' },
        { '<leader>sc', '<cmd>Telescope command_history<cr>', desc = 'Command History' },
        { '<leader>sd', '<cmd>Telescope diagnostics bufnr=0<cr>', desc = 'Document diagnostics' },
        { '<leader>sk', '<cmd>Telescope keymaps<cr>', desc = 'key maps' },
        { '<leader>sm', '<cmd>Telescope marks<cr>', desc = 'jump to mark' },
        { '<leader>so', '<cmd>Telescope vim_options<cr>', desc = 'options' },
        {
            '<leader>ws',
            '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>',
            desc = 'workspace symbols',
        },
        { 'gd', '<cmd>Telescope lsp_definitions<cr>', desc = 'go to definition' },
        { 'gr', '<cmd>Telescope lsp_references<cr>', desc = 'go to references' },
        { '<leader>cs', '<cmd>Telescope colorscheme<cr>', desc = 'colorscheme' },
        -- Folke LazyVim keymaps that would be cool to get working
        -- {
        --     '<leader>sw',
        --     Util.telescope('grep_string', { word_match = '-w' }),
        --     desc = 'Word (root dir)',
        -- },
        -- {
        --     '<leader>sW',
        --     Util.telescope('grep_string', { cwd = false, word_match = '-w' }),
        --     desc = 'Word (cwd)',
        -- },
        -- { '<leader>sw', Util.telescope('grep_string'), mode = 'v', desc = 'Selection (root dir)' },
        -- {
        --     '<leader>sW',
        --     Util.telescope('grep_string', { cwd = false }),
        --     mode = 'v',
        --     desc = 'Selection (cwd)',
        -- },
        -- {
        --     '<leader>uC',
        --     Util.telescope('colorscheme', { enable_preview = true }),
        --     desc = 'Colorscheme with preview',
        -- },
    },
    config = function()
        require('telescope').load_extension('fzf')
        require('telescope').load_extension('file_browser')
        require('telescope').load_extension('live_grep_args')

        local actions = require('telescope.actions')
        local live_grep_args_shortcuts = require('telescope-live-grep-args.shortcuts')
        local live_grep_args_actions = require('telescope-live-grep-args.actions')

        vim.keymap.set(
            'n',
            '<leader>lw',
            function() live_grep_args_shortcuts.grep_word_under_cursor({ postfix = ' -F --iglob ' }) end
        )
        vim.keymap.set(
            'v',
            '<leader>lv',
            function() live_grep_args_shortcuts.grep_visual_selection({ postfix = ' -F --iglob ' }) end
        )

        require('telescope').setup({
            defaults = {
                mappings = {
                    i = {
                        ['<s-down>'] = actions.cycle_history_next,
                        ['<s-up>'] = actions.cycle_history_prev,
                        ['<c-k>'] = live_grep_args_actions.quote_prompt(),
                        ['<c-s>'] = live_grep_args_actions.quote_prompt({ postfix = ' --iglob ' }),
                    },
                },
                layout_config = {
                    horizontal = {
                        width = 0.99,
                        height = 0.99,
                        preview_width = 0.6,
                        preview_cutoff = 120,
                        prompt_position = 'bottom',
                    },
                },
            },
            pickers = {
                lsp_references = { fname_width = 100 },
                git_status = {
                    mappings = {
                        i = {
                            ['<Tab>'] = function(bufnr)
                                actions.toggle_selection(bufnr)
                                actions.move_selection_previous(bufnr)
                            end,
                            ['<S-Tab>'] = function(bufnr)
                                actions.toggle_selection(bufnr)
                                actions.move_selection_next(bufnr)
                            end,
                        },
                    },
                },
                colorscheme = {
                    enable_preview = true,
                },
            },
            extensions = {
                live_grep_args = {
                    auto_quoting = true, -- enable/disable auto-quoting
                },
            },
        })
    end,
}
