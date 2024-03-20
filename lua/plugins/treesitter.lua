---@diagnostic disable: missing-fields

local M = {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = 'BufReadPost',
    dependencies = {
        'JoosepAlviste/nvim-ts-context-commentstring',
        'RRethy/nvim-treesitter-textsubjects',
        'mfussenegger/nvim-treehopper',
        'nvim-treesitter/nvim-treesitter-refactor',
        'nvim-treesitter/nvim-treesitter-textobjects',
        'windwp/nvim-ts-autotag',
        -- opts = function(_, opts)
        --     if type(opts.ensure_installed) == 'table' then
        --         vim.list_extend(opts.ensure_installed, { 'typescript', 'tsx' })
        --     end
        -- end,
    },
}

-- function M.init()
--     vim.cmd([[
--     omap     <silent> m :<C-U>lua require('tsht').nodes()<CR>
--     xnoremap <silent> m :lua require('tsht').nodes()<CR>
--   ]])
-- end

function M.config()
    require('nvim-treesitter.configs').setup({
        ensure_installed = {
            'bash',
            'c',
            'cmake',
            'css',
            'diff',
            'gitignore',
            'go',
            'html',
            'http',
            'javascript',
            'jsdoc',
            'json',
            'json5',
            'jsonc',
            'lua',
            'markdown',
            'markdown_inline',
            'python',
            'query',
            'regex',
            'rust',
            'scss',
            'sql',
            'toml',
            'tsx',
            'typescript',
            'vhs',
            'vim',
            'vimdoc',
            'vue',
            'yaml',
            -- 'help',
        },
        sync_install = false,
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = '<c-l>',
                node_incremental = '<c-l>',
                node_decremental = '<c-h>',
                scope_incremental = '<c-s>',
            },
        },
        textobjects = {
            select = {
                enable = true,
                lookahead = true,
                keymaps = {
                    -- You can use the capture groups defined in textobjects.scm
                    ['aa'] = '@parameter.outer',
                    ['ia'] = '@parameter.inner',
                    ['af'] = '@function.outer',
                    ['if'] = '@function.inner',
                    ['ac'] = '@class.outer',
                    ['ic'] = '@class.inner',
                },
            },
            move = {
                enable = true,
                set_jumps = true, -- whether to set jumps in the jumplist
                goto_next_start = {
                    [']f'] = '@function.outer',
                    [']c'] = '@class.outer',
                },
                goto_next_end = {
                    [']F'] = '@function.outer',
                    [']C'] = '@class.outer',
                },
                goto_previous_start = {
                    ['[f'] = '@function.outer',
                    ['[c'] = '@class.outer',
                },
                goto_previous_end = {
                    ['[F'] = '@function.outer',
                    ['[C'] = '@class.outer',
                },
            },
            swap = {
                enable = false,
                swap_next = {
                    ['<leader>ta'] = '@parameter.inner',
                },
                swap_previous = {
                    ['<leader>tA'] = '@parameter.inner',
                },
            },
            lsp_interop = {
                enable = false,
                peek_definition_code = {
                    ['gD'] = '@function.outer',
                },
            },
        },
        refactor = {
            highlight_current_scope = { enable = false },
            highlight_definitions = {
                enable = true,
                clear_on_cursor_move = true,
            },
            smart_rename = {
                enable = true,
                client = {
                    smart_rename = '<leader>cr',
                },
            },
            navigation = {
                enable = true,
                keymaps = {
                    goto_definition = 'gnd',
                    list_definitions = 'gnD',
                    list_definitions_toc = 'gO',
                    goto_next_usage = '<a-*>',
                    goto_previous_usage = '<a-#>',
                },
            },
        },
        query_linter = {
            enable = true,
            use_virtual_text = true,
            lint_events = { 'BufWrite', 'CursorHold' },
        },
        textsubjects = {
            enable = true,
            keymaps = {
                ['.'] = 'textsubjects-smart',
                [';'] = 'textsubjects-container-outer',
                ['i;'] = 'textsubjects-container-inner',
            },
        },
        autotag = {
            enable = true,
        },
    })

    local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
    parser_config.markdown.filetype_to_parsername = 'octo'
end

return M
