local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"duane9/nvim-rg",
	"glidenote/memolist.vim",
	"junegunn/vim-easy-align",
	"drmingdrmer/vim-toggle-quickfix",

	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = { "VeryLazy" },
		config = function()
			require("nvim-surround").setup({})
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufNewFile", "BufRead" },
		keys = {
			{ "<C-j>d", ":Gitsigns preview_hunk<CR>" },
			{ "<C-j>D", ":Gitsigns diffthis<CR>" },
			{ "<C-j><C-u>", ":Gitsigns reset_hunk<CR>" },
			{ "<Space>s", ":Gitsigns stage_hunk<CR>" },
			{ "<Space>j", ":Gitsigns next_hunk<CR>" },
			{ "<Space>k", ":Gitsigns prev_hunk<CR>" },
		},
		config = function()
			require("gitsigns").setup()
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = { "InsertEnter" },
		opts = {},
	},

	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

	{
		"lambdalisue/fern.vim",
		keys = {
			{ ";n", ":Fern . -reveal=% -drawer -toggle<CR>", desc = "toggle fern" },
		},
		dependencies = {
			{ "lambdalisue/nerdfont.vim" },
			{
				"lambdalisue/fern-renderer-nerdfont.vim",
				config = function()
					vim.g["fern#renderer"] = "nerdfont"
				end,
			},
		},
	},

	-- appearance
	{
		"neanias/everforest-nvim",
		version = false,
		lazy = false,
		priority = 1000, -- make sure to load this before all the other start plugins
		-- Optional; default configuration will be used if setup isn't called.
		config = function()
			require("everforest").setup({
				-- Your config here
			})
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = { "BufNewFile", "BufRead" },
		opts = {
			icons_enabled = false,
			theme = "everforest",
		},
		config = function()
			require("lualine").setup({
				sections = {
					lualine_x = {
						{
							require("lazy.status").updates,
							cond = require("lazy.status").has_updates,
						},
					},
				},
			})
		end,
	},

	-- telescope
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.3",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"nvim-telescope/telescope-frecency.nvim",
		config = function()
			require("telescope").load_extension("frecency")
		end,
		dependencies = { "kkharji/sqlite.lua" },
	},
	{
		"nvim-telescope/telescope-ghq.nvim",
		config = function()
			require("telescope").load_extension("ghq")
		end,
	},
	{
		"delphinus/telescope-memo.nvim",
		config = function()
			require("telescope").load_extension("memo")
		end,
	},

	-- LSP
	"neovim/nvim-lspconfig",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			{
				"L3MON4D3/LuaSnip",
				keys = function()
					return {}
				end,
			},
		},
	},

	{
		"j-hui/fidget.nvim",
		tag = "legacy",
		event = { "LspAttach" },
		opts = {},
	},
	"jose-elias-alvarez/null-ls.nvim",
	"MunifTanjim/prettier.nvim",

	-- Github copilot
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = { "InsertEnter" },
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		config = function()
			require("copilot_cmp").setup()
		end,
	},

	{
		"mattn/emmet-vim",
		ft = { "html", "css", "react" },
	},
})
