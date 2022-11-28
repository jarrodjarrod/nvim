local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
local nnoremap = require("jazzimoto.keymap").nnoremap

nnoremap("<C-p>", function()
	builtin.find_files()
end)

nnoremap("<leader>pl", function()
	builtin.live_grep()
end)

nnoremap("<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Grep for > ") })
end)

nnoremap("<Leader>pf", function()
	builtin.git_files()
end)

nnoremap("<leader>pw", function()
	builtin.grep_string({ search = vim.fn.expand("<cword>") })
end)

nnoremap("<leader>pb", function()
	builtin.buffers()
end)

nnoremap("<leader>vh", function()
	builtin.help_tags()
end)

nnoremap("<leader>pt", function()
	builtin.git_status()
end)

nnoremap("<leader>pc", function()
	builtin.git_commits()
end)

nnoremap("<leader>pg", function()
	builtin.git_branches()
end)

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
