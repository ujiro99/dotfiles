local status, telescope = pcall(require, "telescope")
if not status then
  return
end
local actions = require("telescope.actions")

telescope.setup({
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close,
      },
    },
    path_display = { "smart" },
    file_ignore_patterns = { "node_modules", "\\.git", "\\.idea" },
  },
  extensions = {
    frecency = {
      show_scores = false,
      ignore_patterns = { "*.git/*", "*/tmp/*" },
    }
  },
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', ';f', builtin.find_files, {})
vim.keymap.set('n', ';k', builtin.live_grep, {})
vim.keymap.set('n', ';j', builtin.oldfiles, {})
vim.keymap.set('n', ';b', builtin.buffers, {})
vim.keymap.set('n', ';h', builtin.help_tags, {})
vim.keymap.set('n', ';g', ":Telescope ghq list<CR>", {})
vim.keymap.set('n', ';m', "<Cmd>lua require('telescope').extensions.frecency.frecency()<CR>",
  { noremap = true, silent = true })
