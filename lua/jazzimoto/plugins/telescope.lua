local M = {
  "nvim-telescope/telescope.nvim",
  --  cmd = { "Telescope" },
  tag = "0.1.0",
  dependencies = {
    { "nvim-telescope/telescope-file-browser.nvim" },
    { "nvim-telescope/telescope-z.nvim" },
    { "nvim-telescope/telescope-symbols.nvim" },
    -- { "nvim-telescope/telescope-project.nvim" },
    -- { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
}

function M.config()
  local actions = require("telescope.actions")

  require("telescope").setup({
    defaults = {
      layout_config = {
        horizontal = { width = 0.9 },
        preview_width = 0.4,
        -- other layout configuration here
      },
      mappings = {
        i = {
          ["<c-j>"] = actions.move_selection_next,
          ["<c-k>"] = actions.move_selection_previous,
          ["<s-down>"] = actions.cycle_history_next,
          ["<s-up>"] = actions.cycle_history_prev,
        },
      },
      -- other defaults configuration here
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
    -- other configuration values here
  })
end

function M.init()
  local telescope = require("telescope")
  local builtin = require("telescope.builtin")
  local nnoremap = require("jazzimoto.keymap").nnoremap
  nnoremap("<C-p>", builtin.git_files)

  nnoremap("<leader>ps", function()
    builtin.grep_string({ search = vim.fn.input("Grep for > ") })
  end)

  nnoremap("<leader>pw", function()
    builtin.grep_string({ search = vim.fn.expand("<cword>") })
  end)

  nnoremap("<leader>pl", builtin.live_grep)

  nnoremap("<Leader>pf", builtin.find_files)

  nnoremap("<leader>pb", builtin.buffers)

  nnoremap("<leader>pt", builtin.git_status)

  nnoremap("<leader>pc", builtin.git_commits)

  nnoremap("<leader>pg", builtin.git_branches)

  nnoremap("<leader>ph", builtin.oldfiles)

  nnoremap("<leader>vh", builtin.help_tags, { desc = '[V]im [H]elp' })

  nnoremap('<leader><space>', builtin.current_buffer_fuzzy_find, { desc = 'Fuzzily search in current buffer]' })

  vim.keymap.set("n", "<leader>pz", function()
    telescope.extensions.z.list({ cmd = { vim.o.shell, "-c", "zoxide query -ls" } })
  end, { desc = "Find Zoxide" })

end

return M
