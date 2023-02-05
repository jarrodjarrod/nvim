return {
  "nvim-telescope/telescope.nvim",
  cmd = { "Telescope" },
  tag = "0.1.0",

  dependencies = {
    { "nvim-telescope/telescope-file-browser.nvim" },
    { "nvim-telescope/telescope-live-grep-args.nvim" },
    { "nvim-telescope/telescope-symbols.nvim" },
    { "nvim-telescope/telescope-z.nvim" },
  },

  keys = function()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")
    local extensions = telescope.extensions

    return {
      { "<leader>,", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
      { "<leader>/", "<cmd>Telescope live_grep<cr>", desc = "Live Grep"},
      { "<leader>?", "<cmd>Telescope grep_string<cr>", desc = "Grep String" },
      { "<leader>;", "<cmd>Telescope command_history<cr>", desc = "Command History" },
      -- find
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
      -- git
      { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "commits" },
      { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "status" },
      { "<C-p>", "<cmd>Telescope git_files<cr>" },
      { "<leader>ff", "<cmd>Telescope find_files<cr>" },
      { "<leader>fa", function() telescope.extensions.live_grep_args.live_grep_args() end },
      { "<leader>fb", "<cmd>Telescope buffers<cr>" },
      { "<leader>fc", "<cmd>Telescope git_commits<cr>" },
      { "<leader>fg", "<cmd>Telescope git_branches<cr>" },
      { "<leader>fh", "<cmd>Telescope oldfiles<cr>" },
      { "<leader>fl", "<cmd>Telescope live_grep<cr>" },
      { "<leader>fs", function() builtin.grep_string({ search = vim.fn.input("Grep for > ") }) end },
      { "<leader>fw", function() builtin.grep_string({ search = vim.fn.expand("<cword>") }) end },
      { "<leader>fz",
        function()
          extensions.z.list({ cmd = { vim.o.shell, "-c", "zoxide query -ls" } })
        end,
        { desc = "Find Zoxide" }
      },
      { "<leader>vh", "<cmd>Telescope help_tags<cr>", { desc = '[V]im [H]elp' } },
      { "<leader><space>", builtin.current_buffer_fuzzy_find, { desc = 'Fuzzily search in current buffer' } },
      -- search
      { "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
      { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
      { "<leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
      { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
      { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
      { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
      { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
      { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
      { "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
    }
  end,

  config = function()
    local actions = require("telescope.actions")
    local lga_actions = require("telescope-live-grep-args.actions")
    require("telescope").load_extension("file_browser")
    require("telescope").load_extension("live_grep_args")

    require("telescope").setup({
      defaults = {
        layout_config = {
          horizontal = { width = 0.9 },
          preview_width = 0.4,
        },
        mappings = {
          i = {
            ["<c-j>"] = actions.move_selection_next,
            ["<c-k>"] = actions.move_selection_previous,
            ["<s-down>"] = actions.cycle_history_next,
            ["<s-up>"] = actions.cycle_history_prev,
          },
        },
      },
      pickers = {
        find_files = {
          hidden = true,
          find_command = {
            "rg",
            "--files",
            "--color",
            "never",
            "--ignore-file",
          },
        },
      },
      extensions = {
        live_grep_args = {
          auto_quoting = true, -- enable/disable auto-quoting
          mappings = {
            i = {
              ["<c-k>"] = lga_actions.quote_prompt(),
              ["<c-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
            },
          },
        }
      }
    })
  end
}
