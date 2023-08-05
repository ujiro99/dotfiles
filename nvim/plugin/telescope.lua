local status, telescope = pcall(require, "telescope")
if not status then
    return
end
local actions = require("telescope.actions")

local function telescope_buffer_dir()
    return vim.fn.expand("%:p:h")
end

local fb_actions = require("telescope").extensions.file_browser.actions
telescope.setup({
    defaults = {
        mappings = {
            n = {
                ["q"] = actions.close,
            },
        },

        file_ignore_patterns = { "node_modules", ".git", ".idea" },
    },
    extensions = {
        file_browser = {
            theme = "ivy",
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            mappings = {
                -- your custom insert mode mappings
                ["i"] = {
                    ["<C-w>"] = function()
                        vim.cmd("normal vbd")
                    end,
                },
                ["n"] = {
                    -- your custom normal mode mappings
                    ["N"] = fb_actions.create,
                    ["h"] = fb_actions.goto_parent_dir,
                    ["/"] = function()
                        vim.cmd("startinsert")
                    end,
                },
            },
        },
    },
})

telescope.load_extension("file_browser")
local builtin = require('telescope.builtin')
vim.keymap.set('n', ';f', builtin.find_files, {})
vim.keymap.set('n', ';k', builtin.live_grep, {})
vim.keymap.set('n', ';j', builtin.buffers, {})
vim.keymap.set('n', ';h', builtin.help_tags, {})
vim.keymap.set('n', ';m', "<Cmd>lua require('telescope').extensions.frecency.frecency()<CR>",
    { noremap = true, silent = true })
vim.keymap.set('n', ';n', function()
    telescope.extensions.file_browser.file_browser({
        path = "%:p:h",
        cwd = telescope_buffer_dir(),
        respect_gitignore = false,
        hidden = true,
        grouped = true,
        previewer = false,
        initial_mode = "normal",
        layout_config = { height = 40 },
    })
end)
