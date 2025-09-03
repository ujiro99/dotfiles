vim.keymap.set("n", " d", "<Cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>", { silent = true })
vim.keymap.set("n", "gr", "<Cmd>call VSCodeNotify('editor.action.referenceSearch.trigger')<CR>", { silent = true })
vim.keymap.set("n", "gn", "<Cmd>call VSCodeNotify('editor.action.rename')<CR>", { silent = true })

vim.keymap.set(
	"n",
	"<C-w>j",
	"<Cmd>call VSCodeNotify('workbench.action.navigateDown')<CR>",
	{ noremap = true, silent = true }
)
vim.keymap.set(
	"x",
	"<C-w>j",
	"<Cmd>call VSCodeNotify('workbench.action.navigateDown')<CR>",
	{ noremap = true, silent = true }
)
vim.keymap.set(
	"n",
	"<C-w>k",
	"<Cmd>call VSCodeNotify('workbench.action.navigateUp')<CR>",
	{ noremap = true, silent = true }
)
vim.keymap.set(
	"x",
	"<C-w>k",
	"<Cmd>call VSCodeNotify('workbench.action.navigateUp')<CR>",
	{ noremap = true, silent = true }
)
vim.keymap.set(
	"n",
	"<C-w>h",
	"<Cmd>call VSCodeNotify('workbench.action.navigateLeft')<CR>",
	{ noremap = true, silent = true }
)
vim.keymap.set(
	"x",
	"<C-w>h",
	"<Cmd>call VSCodeNotify('workbench.action.navigateLeft')<CR>",
	{ noremap = true, silent = true }
)
vim.keymap.set(
	"n",
	"<C-w>l",
	"<Cmd>call VSCodeNotify('workbench.action.navigateRight')<CR>",
	{ noremap = true, silent = true }
)
vim.keymap.set(
	"x",
	"<C-w>l",
	"<Cmd>call VSCodeNotify('workbench.action.navigateRight')<CR>",
	{ noremap = true, silent = true }
)
