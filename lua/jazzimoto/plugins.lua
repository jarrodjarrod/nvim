return {
  -- "b0o/SchemaStore.nvim",
  -- "jose-elias-alvarez/typescript.nvim",
  "folke/neodev.nvim",
  -- "MunifTanjim/nui.nvim",
  "williamboman/mason-lspconfig.nvim",
  "nvim-lua/plenary.nvim",
  -- "windwp/nvim-spectre",
  -- "rlch/github-notifications.nvim",
  -- "folke/twilight.nvim",
  -- "folke/which-key.nvim",
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufReadPre",
    config = function()
      require("treesitter-context").setup()
    end,
  },
}
