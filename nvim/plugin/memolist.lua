---------------------------------------------
-- memolist 関連
---------------------------------------------
vim.keymap.set('n', ',mn', ':MemoNew<CR>', { noremap = true })
vim.keymap.set('n', ',mg', ':Telescope memo live_grep<CR>', { noremap = true })
vim.keymap.set('n', ',mf', ':Telescope memo list<CR>', { noremap = true })

vim.g.memolist_memo_date   = "%Y%m%d %H:%M"
vim.g.memolist_memo_suffix = "md"
vim.g.memolist_path        = vim.fn.expand("~/memo")

