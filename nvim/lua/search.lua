-------------------------------------------------------------------------------
-- 検索設定 Search
-------------------------------------------------------------------------------
vim.o.wrapscan = true   -- 最後まで検索したら先頭へ戻る
vim.o.ignorecase = true -- 大文字小文字無視
vim.o.smartcase = true  -- 検索文字列に大文字が含まれている場合は区別して検索する
vim.o.incsearch = true  -- インクリメンタルサーチ

-- 選択した文字列を検索
vim.cmd [[
  vnoremap <silent> // y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
]]

-- カーソル下のキーワードをヘルプでひく
vim.keymap.set('n', '<C-i><C-i>', ':<C-u>help<Space><C-r><C-w><Enter>zz', { noremap = true })

-- カーソル下の単語をgrepする
vim.keymap.set('n', 'gr', ':Rg<Space><C-r><C-w> <CR>', { noremap = true })
