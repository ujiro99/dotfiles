-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim") -- Packer can manage itself
	use("duane9/nvim-rg")
	use("glidenote/memolist.vim")
	use("junegunn/vim-easy-align")
	use("drmingdrmer/vim-toggle-quickfix")

	use({
		"kylechui/nvim-surround",
		tag = "*",
		config = function()
			require("nvim-surround").setup({})
		end,
	})

	use({
		"dinhhuy258/git.nvim",
		config = function()
			require("git").setup({})
		end,
	})
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({})
		end,
	})

	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

	use("lambdalisue/fern.vim")
	use({
		"TheLeoP/fern-renderer-web-devicons.nvim",
		requires = { "nvim-tree/nvim-web-devicons" },
	})

	-- appearance
	use({
		"neanias/everforest-nvim",
		config = function()
			require("everforest").setup()
		end,
	})
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
		config = function()
			require("lualine").setup({
				options = {
					icons_enabled = false,
					theme = "everforest",
				},
			})
		end,
	})

	-- telescope
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		requires = { "nvim-lua/plenary.nvim" },
	})
	use({
		"nvim-telescope/telescope-frecency.nvim",
		commit = "62d3381",
		config = function()
			require("telescope").load_extension("frecency")
		end,
		requires = { "kkharji/sqlite.lua" },
	})
	use({
		"nvim-telescope/telescope-ghq.nvim",
		config = function()
			require("telescope").load_extension("ghq")
		end,
	})
	use({
		"delphinus/telescope-memo.nvim",
		config = function()
			require("telescope").load_extension("memo")
		end,
	})

	-- LSP
	use("neovim/nvim-lspconfig")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			{
				"L3MON4D3/LuaSnip",
				tag = "v2.*",
				run = "make install_jsregexp",
				requires = "saadparwaiz1/cmp_luasnip",
			},
		},
	})
	use({
		"j-hui/fidget.nvim",
		tag = "legacy",
		config = function()
			require("fidget").setup({})
		end,
	})
	use("jose-elias-alvarez/null-ls.nvim")
	use("MunifTanjim/prettier.nvim")

	-- Github copilot
	use({
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end,
	})
	use({
		"zbirenbaum/copilot-cmp",
		after = { "copilot.lua" },
		config = function()
			require("copilot_cmp").setup()
		end,
	})

	use({ "mattn/emmet-vim", ft = { "html", "css", "react" } })
end)
