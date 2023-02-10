return {
  -- "b0o/SchemaStore.nvim",
  "folke/neodev.nvim",
  -- "MunifTanjim/nui.nvim",
  "williamboman/mason-lspconfig.nvim",
  -- "windwp/nvim-spectre",
  -- "rlch/github-notifications.nvim",
  -- "folke/twilight.nvim",
  -- "folke/which-key.nvim",
  "nvim-lua/plenary.nvim",
  "nvim-lua/popup.nvim",
  "mbbill/undotree",
  "nvim-treesitter/nvim-treesitter-context",
  "ThePrimeagen/vim-be-good",
  "folke/zen-mode.nvim",
  "rose-pine/neovim",
  "lukas-reineke/indent-blankline.nvim", -- Add indentation guides even on blank lines
  "github/copilot.vim",
  "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
  "kdheepak/lazygit.nvim",
  {
    "folke/tokyonight.nvim",
    config = function()
      vim.cmd [[colorscheme tokyonight-moon]]
    end,
    lazy = false,
    opts = { style = "moon" },
    priority = 1000,
  },
  {
    "ThePrimeagen/harpoon",
    init = function()
      vim.keymap.set("n", "<leader>a", require("harpoon.mark").add_file)
      vim.keymap.set("n", "<c-e>", require("harpoon.ui").toggle_quick_menu)
      vim.keymap.set("n", "<leader>1", function() require("harpoon.ui").nav_file(1) end)
      vim.keymap.set("n", "<leader>2", function() require("harpoon.ui").nav_file(2) end)
      vim.keymap.set("n", "<leader>3", function() require("harpoon.ui").nav_file(3) end)
      vim.keymap.set("n", "<leader>4", function() require("harpoon.ui").nav_file(4) end)
    end
  },
  { "windwp/nvim-autopairs", config = true },
  { "lewis6991/gitsigns.nvim", config = true, },
  { "numToStr/Comment.nvim", config = true, },
  { "nvim-treesitter/nvim-treesitter-context", config = true, },
  { "jose-elias-alvarez/typescript.nvim", config = true },
}
