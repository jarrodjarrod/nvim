return {
  'VonHeikemen/lsp-zero.nvim',
  enabled = false,
  branch = 'v2.x',
  dependencies = {
    -- LSP Support
    { 'neovim/nvim-lspconfig' },
    { 'williamboman/mason.nvim', config = true },
    { 'williamboman/mason-lspconfig.nvim' },

    -- Autocompletion
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-nvim-lua' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/nvim-cmp' },
    { 'saadparwaiz1/cmp_luasnip' },

    -- Snippets
    { 'L3MON4D3/LuaSnip' },
    { 'rafamadriz/friendly-snippets' },
    { 'jose-elias-alvarez/typescript.nvim' },
  },
  config = function()
    local lsp = require('lsp-zero').preset {
      set_lsp_keymaps = { preserve_mappings = false },
    }

    lsp.on_attach(function(_, bufnr)
      lsp.default_keymaps {
        buffer = bufnr,
        omit = { 'gd', 'gr' },
        preserve_mappings = false,
      }

      vim.keymap.set('i', '<c-h>', vim.lsp.buf.signature_help, { buffer = bufnr })
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr })
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = bufnr })
      vim.keymap.set('n', '<leader>lc', vim.lsp.buf.code_action, { buffer = bufnr })
      vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, { buffer = bufnr })
      vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, { buffer = bufnr })
      vim.keymap.set('n', '<leader>lw', vim.lsp.buf.workspace_symbol, { buffer = bufnr })
    end)

    -- (Optional) Configure lua language server for neovim
    require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

    lsp.ensure_installed {
      'cssls',
      'eslint',
      'html',
      'jsonls',
      'luau_lsp',
      'rust_analyzer',
      'tsserver',
    }

    lsp.setup()

    require('typescript').setup {
      server = lsp.build_options('tsserver', {}),
    }

    local cmp = require 'cmp'

    cmp.setup {
      sources = {
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'buffer', keyword_length = 3 },
        { name = 'luasnip', keyword_length = 2 },
      },
      mapping = {
        ['<c-d>'] = cmp.mapping.scroll_docs(-4),
        ['<c-e>'] = vim.NIL,
        ['<c-f>'] = cmp.mapping.scroll_docs(4),
        ['<c-i>'] = cmp.mapping.complete(),
        ['<c-n>'] = cmp.mapping.select_next_item(),
        ['<c-p>'] = cmp.mapping.select_prev_item(),
        ['<c-y>'] = cmp.mapping.confirm { select = true },
        ['<cr>'] = cmp.mapping.confirm { select = true },
      },
    }
  end,
}
