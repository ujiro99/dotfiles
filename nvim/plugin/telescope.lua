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
    file_ignore_patterns = { "node_modules", "\\.git", "\\.idea" },
  },
  extensions = {
    frecency = {
      show_scores = false,
      -- show_unindexed = true,
      ignore_patterns = { "*.git/*", "*/tmp/*" },
      workspaces = {
        ["tlt"] = vim.fn.expand("~/src/github.com/ujiro99/tlt"),
        ["dotfiles"] = vim.fn.expand("~/dotfiles"),
      }
    }
  },
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', ';f', builtin.find_files, {})
vim.keymap.set('n', ';k', builtin.live_grep, {})
vim.keymap.set('n', ';j', builtin.buffers, {})
vim.keymap.set('n', ';h', builtin.help_tags, {})
vim.keymap.set('n', ';g', ":Telescope ghq list<CR>", {})
vim.keymap.set('n', ';m', "<Cmd>lua require('telescope').extensions.frecency.frecency()<CR>",
  { noremap = true, silent = true })
