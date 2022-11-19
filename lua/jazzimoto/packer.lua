local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)

	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
	use("nvim-lua/plenary.nvim")
	use("nvim-lua/popup.nvim")
	use("nvim-telescope/telescope.nvim")
	use("wbthomason/packer.nvim")

  -- LSP
	use("neovim/nvim-lspconfig") -- Collection of configurations for built-in LSP client
	use("williamboman/mason-lspconfig.nvim")
	use("williamboman/mason.nvim")

	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-nvim-lsp") -- LSP source for nvim-cmp
	use("hrsh7th/cmp-nvim-lua") -- LSP source for nvim-cmp
	use("hrsh7th/cmp-path")
	use("hrsh7th/nvim-cmp") -- Autocompletion plugin
	use("rafamadriz/friendly-snippets")

	use("L3MON4D3/LuaSnip") -- Snippets plugin
	use("saadparwaiz1/cmp_luasnip") -- Snippets source for nvim-cmp

	use("folke/tokyonight.nvim")
	use("rigellute/shades-of-purple.vim")

	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup()
		end,
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
