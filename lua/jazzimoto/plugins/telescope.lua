return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-file-browser.nvim',
        'nvim-telescope/telescope-fzf-native.nvim',
        'nvim-telescope/telescope-symbols.nvim',
        'nvim-telescope/telescope-z.nvim',
        { 'nvim-telescope/telescope-live-grep-args.nvim', version = '^1.0.0' },
    },
    keys = {
        { '<c-p>', '<cmd>Telescope git_files<cr>' },
        { '<leader><leader>', '<cmd>Telescope live_grep_args<cr>' },
        { '<leader>D', '<cmd>Telescope lsp_type_definitions<cr>', desc = 'Type [D]efinition' },
        { '<leader>ch', '<cmd>Telescope command_history<cr>', desc = '[C]ommand [H]istory' },
        { '<leader>ds', '<cmd>Telescope lsp_document_symbols<cr>', desc = '[D]ocument [S]ymbols' },
        { '<leader>fC', '<cmd>Telescope commands<cr>', desc = 'Commands' },
        { '<leader>ff', '<cmd>Telescope find_files no_ignore=true<cr>', desc = '[F]ind [F]iles' },
        { '<leader>fw', '<cmd>Telescope grep_string<cr>', desc = '[F]ind [W]ord' },
        { '<leader>fz', '<cmd>Telescope z list<cr>', desc = '[F]ind [Z]oxide' }, -- doesn't seem to be working
        { '<leader>gs', '<cmd>Telescope git_status<cr>', desc = '[G]it [S]tatus' },
        { '<leader>ht', '<cmd>Telescope help_tags<cr>', { desc = '[H]elp [T]ags' } },
        { '<leader>lg', '<cmd>Telescope live_grep<cr>', desc = '[L]ive [G]rep' },
        { '<leader>r', '<cmd>Telescope resume<cr>', desc = '[R]esume' },
        { '<leader>sH', '<cmd>Telescope highlights<cr>', desc = 'Search Highlight Groups' },
        { '<leader>sM', '<cmd>Telescope man_pages<cr>', desc = 'Man Pages' },
        { '<leader>sa', '<cmd>Telescope autocommands<cr>', desc = 'Auto Commands' },
        { '<leader>sb', '<cmd>Telescope current_buffer_fuzzy_find<cr>', desc = 'Buffer' },
        { '<leader>sd', '<cmd>Telescope diagnostics<cr>', desc = 'Diagnostics' },
        { '<leader>sh', '<cmd>Telescope help_tags<cr>', desc = 'Help Pages' },
        { '<leader>sk', '<cmd>Telescope keymaps<cr>', desc = 'Key Maps' },
        { '<leader>sm', '<cmd>Telescope marks<cr>', desc = 'Jump to Mark' },
        { '<leader>so', '<cmd>Telescope vim_options<cr>', desc = 'Options' },
        {
            '<leader>ws',
            '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>',
            desc = '[W]orkspace [S]ymbols',
        },
        { 'gr', '<cmd>Telescope lsp_references<cr>', desc = '[Go] to [R]eferences' },
    },
    config = function()
        require('telescope').load_extension('fzf')
        require('telescope').load_extension('file_browser')
        require('telescope').load_extension('live_grep_args')

        local builtin = require('telescope.builtin')
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
        vim.keymap.set(
            'n',
            '<leader>fs',
            function() builtin.grep_string({ search = vim.fn.input('Grep > ') }) end
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
            },
            extensions = {
                live_grep_args = {
                    auto_quoting = true, -- enable/disable auto-quoting
                },
            },
        })
    end,
}
