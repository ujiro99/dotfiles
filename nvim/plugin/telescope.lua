if vim.g.vscode then
	return
end

local status, telescope = pcall(require, "telescope")
if not status then
	return
end
local actions = require("telescope.actions")

local function path_display(_, path)
	local cwd = vim.loop.cwd() .. "/"
	if path:sub(1, #cwd) == cwd then
		return path:sub(#cwd + 1)
	else
		-- 現在のウィンドウ幅を取得（0はカレントウィンドウを意味）
		local win_width = vim.fn.winwidth(0)
		-- ウィンドウ幅-10 を最大長として使用（余白確保のため）
		local max_len = math.floor(win_width - 10)
		if #path > max_len then
			return "..." .. path:sub(-max_len)
		else
			return path
		end
	end
end

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
		path_display = path_display,
		file_ignore_patterns = { "node_modules", "\\.git", "\\.idea" },
	},
	extensions = {
		frecency = {
			show_scores = false,
			ignore_patterns = { "*.git/*", "*/tmp/*" },
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
vim.keymap.set("n", ";s", ":Telescope lsp_document_symbols<CR>", {
	silent = true,
})
vim.keymap.set("n", ";g", ":Telescope ghq<CR>", {})
vim.keymap.set("n", ";m", function()
	require("telescope").extensions.frecency.frecency()
end, {})
vim.keymap.set("n", ";l", function()
	builtin.current_buffer_fuzzy_find({ skip_empty_lines = true })
end, {})
