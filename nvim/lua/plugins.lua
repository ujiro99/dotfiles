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
			{ "<C-j>b", ":Gitsigns blame<CR>" },
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

	{ "nvim-treesitter/nvim-treesitter", branch = "main", lazy = false, build = ":TSUpdate" },

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

	{
		"brianhuster/live-preview.nvim",
		cmd = { "LivePreview" },
		ft = { "markdown" },
		dependencies = {
			-- You can choose one of the following pickers
			"nvim-telescope/telescope.nvim",
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
	{
		"stevearc/aerial.nvim",
		keys = {
			{ "<Leader>a", "<cmd>AerialToggle<CR>", desc = "Toggle Aerial" },
		},
		lazy = false,
		config = function()
			require("aerial").setup({
				layout = {
					-- These control the width of the aerial window.
					-- They can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
					-- min_width and max_width can be a list of mixed types.
					-- max_width = {40, 0.2} means "the lesser of 40 columns or 20% of total"
					max_width = { 40, 0.3 },
					width = nil,
					min_width = 10,
				},
			})
		end,
		-- Optional dependencies
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},

	-- github copilot
	{
		"github/copilot.vim",
	},

	-- LSP
	"mason-org/mason.nvim",
	"mason-org/mason-lspconfig.nvim",
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})
		end,
	},
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
	"nvimtools/none-ls.nvim",

	{
		"mattn/emmet-vim",
		ft = { "html", "css", "react" },
	},

	{
		"lewis6991/hover.nvim",
		config = function()
			require("hover").setup({
				init = function()
					-- Require providers
					require("hover.providers.lsp")
					require("hover.providers.diagnostic")
					-- require('hover.providers.gh')
					-- require('hover.providers.gh_user')
					-- require('hover.providers.jira')
					-- require('hover.providers.dap')
					-- require('hover.providers.fold_preview')
					-- require('hover.providers.man')
					-- require('hover.providers.dictionary')
				end,
				preview_opts = {
					border = "single",
				},
				-- Whether the contents of a currently open hover window should be moved
				-- to a :h preview-window when pressing the hover keymap.
				preview_window = false,
				title = true,
				mouse_providers = {
					"LSP",
					"Diagnostics",
				},
				mouse_delay = 1000,
			})

			-- Setup keymaps
			vim.keymap.set("n", "K", require("hover").hover, { desc = "hover.nvim" })
			vim.keymap.set("n", "<C-p>", function()
				require("hover").hover_switch("previous")
			end, { desc = "hover.nvim (previous source)" })
			vim.keymap.set("n", "<C-n>", function()
				require("hover").hover_switch("next")
			end, { desc = "hover.nvim (next source)" })

			-- Mouse support
			vim.keymap.set("n", "<MouseMove>", require("hover").hover_mouse, { desc = "hover.nvim (mouse)" })
			vim.o.mousemoveevent = true
		end,
	},
})
