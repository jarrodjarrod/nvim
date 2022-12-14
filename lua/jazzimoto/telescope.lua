local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
local nnoremap = require("jazzimoto.keymap").nnoremap

nnoremap("<C-p>", builtin.find_files)

nnoremap("<leader>pl", builtin.live_grep)

nnoremap("<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Grep for > ") })
end)

nnoremap("<Leader>pf", builtin.git_files)

nnoremap("<leader>pw", function()
	builtin.grep_string({ search = vim.fn.expand("<cword>") })
end)

nnoremap("<leader>pb", builtin.buffers)

nnoremap("<leader>vh", builtin.help_tags)

nnoremap("<leader>pt", builtin.git_status)

nnoremap("<leader>pc", builtin.git_commits)

nnoremap("<leader>pg", builtin.git_branches)

--[[
nnoremap("<leader>vrc", function()
    require('theprimeagen.telescope').search_dotfiles({ hidden = true })
end)

nnoremap("<leader>va", function()
    require('theprimeagen.telescope').anime_selector()
end)

nnoremap("<leader>vc", function()
    require('theprimeagen.telescope').chat_selector()
end)

nnoremap("<leader>gc", function()
    require('theprimeagen.telescope').git_branches()
end)

nnoremap("<leader>gw", function()
    require('telescope').extensions.git_worktree.git_worktrees()
end)

nnoremap("<leader>gm", function()
    require('telescope').extensions.git_worktree.create_git_worktree()
end)

nnoremap("<leader>td", function()
    require('theprimeagen.telescope').dev()
end)
--]]

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

				["<s-up>"] = actions.cycle_history_prev,
				["<s-down>"] = actions.cycle_history_next,
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
