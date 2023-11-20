require('copilot').setup({
    panel = {
        enabled = true,
        auto_refresh = false,
        keymap = {
            jump_prev = '<[[>',
            jump_next = '<]]>',
            accept = '<CR>',
            refresh = 'gr',
            open = '<C-CR>',
        },
        layout = { position = 'right', ratio = 0.4 },
    },
    suggestion = {
        enabled = false,
        auto_trigger = true,
        debounce = 75,
        keymap = {
            accept = '<Tab>',
            accept_word = false,
            accept_line = false,
            next = '<M-]>',
            prev = '<M-[>',
            dismiss = [[<M-\>]],
        },
    },
    filetypes = {
        yaml = false,
        markdown = false,
        help = false,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        ['.'] = false,
    },
    copilot_node_command = 'node', -- Node.js version must be > 18.x
    server_opts_overrides = {},
})

vim.keymap.set(
    'n',
    '<leader>tc',
    require('copilot.suggestion').toggle_auto_trigger,
    { noremap = true, silent = true }
)
