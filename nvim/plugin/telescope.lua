local status, telescope = pcall(require, "telescope")
if not status then
	return
end
local actions = require("telescope.actions")
local home = os.getenv("USERPROFILE")
telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<esc>"] = actions.close,
			},
			n = {
				["q"] = actions.close,
			},
		},
		path_display = { "truncate" },
		file_ignore_patterns = { "node_modules", "\\.git", "\\.idea" },
	},
	extensions = {
		frecency = {
			show_scores = false,
			ignore_patterns = { "*.git/*", "*/tmp/*" },
			workspaces = {
				["tlt"] = home .. "/src/github.com/ujiro99/tlt",
				["dotfiles"] = home .. "/dotfiles",
			},
		},
	},
})

local builtin = require("telescope.builtin")
vim.keymap.set("n", ";f", builtin.find_files, {})
vim.keymap.set("n", ";k", builtin.live_grep, {})
vim.keymap.set("n", ";j", builtin.oldfiles, {})
vim.keymap.set("n", ";b", builtin.buffers, {})
vim.keymap.set("n", ";h", builtin.help_tags, {})
vim.keymap.set("n", ";r", builtin.registers, {})
vim.keymap.set("n", ";g", ":Telescope ghq<CR>", {})
vim.keymap.set(
	"n",
	";m",
	"<Cmd>lua require('telescope').extensions.frecency.frecency()<CR>",
	{ noremap = true, silent = true }
)
