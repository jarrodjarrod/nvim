return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v1.x',
  dependencies = {
    -- LSP Support
    { 'neovim/nvim-lspconfig' },             -- Required
    { 'williamboman/mason.nvim' },           -- Optional
    { 'williamboman/mason-lspconfig.nvim' }, -- Optional

    -- Autocompletion
    { 'hrsh7th/nvim-cmp' },         -- Required
    { 'hrsh7th/cmp-nvim-lsp' },     -- Required
    { 'hrsh7th/cmp-buffer' },       -- Optional
    { 'hrsh7th/cmp-path' },         -- Optional
    { 'saadparwaiz1/cmp_luasnip' }, -- Optional
    { 'hrsh7th/cmp-nvim-lua' },     -- Optional

    -- Snippets
    { 'L3MON4D3/LuaSnip' },             -- Required
    { 'rafamadriz/friendly-snippets' }, -- Optional
    { "jose-elias-alvarez/typescript.nvim" },
  },
  config = function()
    local lsp = require('lsp-zero')

    lsp.preset("recommended")

    lsp.skip_server_setup({ 'tsserver' })

    lsp.nvim_workspace()

    lsp.ensure_installed({
      "cssls",
      "eslint",
      "html",
      "jsonls",
      "luau_lsp",
      "rust_analyzer",
      "tsserver",
    })


    lsp.set_preferences({
      sign_icons = {
        error = 'e',
        warn = 'w',
        hint = 'h',
        info = 'i'
      }
    })

    lsp.on_attach(function(_, bufnr)
      local opts = { buffer = bufnr }
      vim.keymap.set("i", "<c-h>", vim.lsp.buf.signature_help, opts)
      vim.keymap.set("n", "<leader>lc", vim.lsp.buf.code_action, opts)
      vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, opts)
      vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)
      vim.keymap.set("n", "<leader>ws", vim.lsp.buf.workspace_symbol, opts)
      vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    end)

    local cmp = require('cmp')
    local cmp_mappings = lsp.defaults.cmp_mappings({
          ["<c-i>"] = cmp.mapping.complete(),
          ["<c-e>"] = vim.NIL,
          ["<tab>"] = vim.NIL,
          ["<s-tab>"] = vim.NIL,
    })

    lsp.setup_nvim_cmp({
      mapping = cmp_mappings
    })


    lsp.setup()

    require('typescript').setup({
      debug = false,
      server = lsp.build_options('tsserver', {})
    })
  end
}
