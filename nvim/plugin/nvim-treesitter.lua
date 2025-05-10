if vim.g.vscode then
	return
end

require("nvim-treesitter.install").compilers = { "zig" }
require("nvim-treesitter.configs").setup({
	ensure_installed = { "lua" },
	sync_install = true,
	auto_install = true,

	highlight = {
		enable = true,
	},
})
