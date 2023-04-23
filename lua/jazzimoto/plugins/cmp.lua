return {
  -- Autocompletion
  'hrsh7th/nvim-cmp',
  dependencies = {
    -- Autocompletion
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-path',
    'hrsh7th/nvim-cmp',
    'saadparwaiz1/cmp_luasnip',

    -- Snippets
    'L3MON4D3/LuaSnip',
    'rafamadriz/friendly-snippets',
    "jose-elias-alvarez/typescript.nvim",
  },
  config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')

    luasnip.config.setup({})

    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert {
        ["<c-e>"] = vim.NIL,
        ['<tab>'] = vim.NIL,
        ['<s-tab>'] = vim.NIL,
        ["<c-i>"] = cmp.mapping.complete(),
        ["<c-d>"] = cmp.mapping.scroll_docs(-4),
        ["<c-f>"] = cmp.mapping.scroll_docs(4),
        ["<c-n>"] = cmp.mapping.select_next_item(),
        ["<c-p>"] = cmp.mapping.select_prev_item(),
        ["<c-y>"] = cmp.mapping.confirm({ select = true }),
        ['<cr>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true, }),
      },
      sources = {
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'buffer',  keyword_length = 3 },
        { name = 'luasnip', keyword_length = 2 },
      },
    }
  end
}
