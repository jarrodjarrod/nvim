return {
  "nvim-lua/plenary.nvim",
  "nvim-lua/popup.nvim",
  "mbbill/undotree",
  "nvim-treesitter/nvim-treesitter-context",
  "ThePrimeagen/vim-be-good",
  "folke/zen-mode.nvim",
  "rose-pine/neovim",
  "lukas-reineke/indent-blankline.nvim", -- Add indentation guides even on blank lines
  "tpope/vim-sleuth",                    -- Detect tabstop and shiftwidth automatically
  "kdheepak/lazygit.nvim",

  { "jose-elias-alvarez/typescript.nvim",      opts = {}, },
  { "windwp/nvim-autopairs",                   opts = {}, },
  { "lewis6991/gitsigns.nvim",                 opts = {}, },
  { "numToStr/Comment.nvim",                   opts = {}, },
  { "nvim-treesitter/nvim-treesitter-context", opts = {}, },

  {
    'nvim-telescope/telescope-fzf-native.nvim',
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },

  {
    "folke/tokyonight.nvim",
    init = function()
      vim.cmd [[colorscheme tokyonight-moon]]
    end,
    lazy = false,
    opts = { style = "moon" },
    priority = 1000,
  },

  {
    "ThePrimeagen/harpoon",
    init = (function()
      vim.keymap.set("n", "<leader>a", require("harpoon.mark").add_file)
      vim.keymap.set("n", "<c-e>", require("harpoon.ui").toggle_quick_menu)
      vim.keymap.set("n", "<leader>1", function() require("harpoon.ui").nav_file(1) end)
      vim.keymap.set("n", "<leader>2", function() require("harpoon.ui").nav_file(2) end)
      vim.keymap.set("n", "<leader>3", function() require("harpoon.ui").nav_file(3) end)
      vim.keymap.set("n", "<leader>4", function() require("harpoon.ui").nav_file(4) end)
      vim.keymap.set("n", "<leader>5", function() require("harpoon.ui").nav_file(5) end)
      vim.keymap.set("n", "<leader>6", function() require("harpoon.ui").nav_file(6) end)
      vim.keymap.set("n", "<leader>7", function() require("harpoon.ui").nav_file(7) end)
      vim.keymap.set("n", "<leader>8", function() require("harpoon.ui").nav_file(8) end)
      vim.keymap.set("n", "<leader>9", function() require("harpoon.ui").nav_file(9) end)
    end),
    opts = { menu = { width = vim.api.nvim_win_get_width(0) - 4, } }
  },

  -- "b0o/SchemaStore.nvim",
  -- "MunifTanjim/nui.nvim",
  -- "windwp/nvim-spectre",
  -- "rlch/github-notifications.nvim",
  -- "folke/twilight.nvim",
  -- "folke/which-key.nvim",
}
