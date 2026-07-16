if vim.g.vscode then
	return
end

require("nvim-treesitter").install({ "rust", "javascript", "zig", "lua" })
require("nvim-treesitter").setup({
	install_dir = vim.fn.stdpath("data") .. "/site",
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "rust", "javascript", "zig", "lua" },
	callback = function(ev)
		vim.treesitter.start(ev.buf)
		vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
		vim.wo[0][0].foldmethod = "expr"
	end,
})
