-------------------------------------------------------------------------------
-- 移動設定 Move
-------------------------------------------------------------------------------
-- カーソルを表示行で移動
vim.keymap.set('n', 'h', '<Left>', { noremap = true })
vim.keymap.set('n', 'j', 'gj', { noremap = true })
vim.keymap.set('n', 'k', 'gk', { noremap = true })
vim.keymap.set('n', 'l', '<Right>', { noremap = true })
vim.keymap.set('n', '<Down>', 'gj', { noremap = true })
vim.keymap.set('n', '<Up>', 'gk', { noremap = true })

-- insert mode での移動
vim.keymap.set('i', '<C-h>', '<Left>', { noremap = true })
vim.keymap.set('i', '<C-l>', '<Right>', { noremap = true })
vim.keymap.set('i', '<C-e>', '<END>', { noremap = true })
vim.keymap.set('i', '<C-a>', '<HOME>', { noremap = true })

-- QuickFixの移動
vim.keymap.set('n', '<C-p>', ':cp <CR>', { noremap = true })
vim.keymap.set('n', '<C-n>', ':cn <CR>', { noremap = true })

-- LocationListの移動
vim.keymap.set('n', '<C-k>', ':lp <CR>', { noremap = true })
vim.keymap.set('n', '<C-j>', ':lne <CR>', { noremap = true })

-- カーソル位置が画面の真ん中にくるようにする
vim.o.scrolloff = 999
vim.keymap.set('n', 'n', 'nzz', { noremap = true })
vim.keymap.set('n', 'N', 'Nzz', { noremap = true })
vim.keymap.set('n', '*', '*zz', { noremap = true })
vim.keymap.set('n', '#', '#zz', { noremap = true })
vim.keymap.set('n', 'g*', 'g*zz', { noremap = true })
vim.keymap.set('n', 'g#', 'g#zz', { noremap = true })

-- 矩形選択で自由に移動する
vim.opt.virtualedit:append { 'block' }
