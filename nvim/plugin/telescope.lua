local status, telescope = pcall(require, "telescope")
if not status then
    return
end
local actions = require("telescope.actions")

local function telescope_buffer_dir()
    return vim.fn.expand("%:p:h")
end

telescope.setup({
    defaults = {
        mappings = {
            n = {
                ["q"] = actions.close,
            },
        },
        file_ignore_patterns = { "node_modules", ".git", ".idea" },
    },
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', ';f', builtin.find_files, {})
vim.keymap.set('n', ';k', builtin.live_grep, {})
vim.keymap.set('n', ';j', builtin.buffers, {})
vim.keymap.set('n', ';h', builtin.help_tags, {})
vim.keymap.set('n', ';m', "<Cmd>lua require('telescope').extensions.frecency.frecency()<CR>",
    { noremap = true, silent = true })
