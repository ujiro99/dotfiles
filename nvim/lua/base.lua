-- バックアップファイルの作成先ディレクトリ
vim.o.backupdir = vim.fn.expand("~/.vim/backup")
-- スワップファイルの作成先ディレクトリ
vim.o.directory = vim.fn.expand("~/.vim/swap")
-- undofileの作成先ディレクトリ
vim.o.undodir = vim.fn.expand("~/.vim/undo")
vim.o.undofile = true
-- 左右のカーソル移動で行間移動可能にする。
vim.o.whichwrap = "b,s,<,>,[,]"
-- 対応括弧の瞬間強調時間
vim.o.matchtime = 3
-- タブを空白で入力する
vim.o.expandtab = true
-- 折り返し表示しない
vim.o.wrap = false
-- ヤンクをクリップボードへ送り込む
vim.opt.clipboard:append({ "unnamedplus" })
-- 編集中でもバッファを切り替えれるようにしておく
vim.o.hidden = true
-- 矩形選択で行末を超えてブロックを選択できるようにする
vim.opt.virtualedit = "block"
-- 改行文字
vim.o.fileformats = "unix,dos"
-- デフォルトエンコーディング
vim.o.encoding = "utf-8"
-- sqlite3
vim.g.sqlite_clib_path = vim.fn.expand("~/AppData/Local/nvim-data/sqlite/sqlite3.dll")
-- nvim-rg
vim.g.rg_command = "rg --vimgrep -S --hidden"

-------------------------------------------------------------------------------
-- keymap
-------------------------------------------------------------------------------
-- escでハイライトをオフ
vim.keymap.set("n", "<ESC>", "<ESC>:noh<CR>", { noremap = true })
-- ノーマルモード中でもエンターキーで改行挿入でノーマルモードに戻る
vim.keymap.set("n", "<CR>", "i<CR><ESC>", { noremap = true })
-- もう一度やる
vim.keymap.set("n", "U", "<C-r>", { noremap = true })
-- バッファを閉じる
vim.keymap.set("n", "<Space>d", ":bd<CR>zz", { noremap = true })
vim.keymap.set("n", "<Space>D", ":bd!<CR>", { noremap = true })

-- JIS配列キーボードとの互換性
vim.keymap.set("n", "'", ":", { noremap = true }) -- COMMANDモード開始
vim.keymap.set("n", '"', "*", { noremap = true }) -- 検索開始

vim.api.nvim_create_augroup("vimrc", {})
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = "qf",
	group = "vimrc",
	callback = function()
		-- quickfixウィンドウではESCで閉じる
		vim.keymap.set("n", "<ESC>", ":ccl<CR>", { noremap = true, buffer = true })
		-- エンターキーの動作をリセットする(改行挿入しないようにする)
		vim.keymap.set("n", "<CR>", "<CR>", { buffer = true, noremap = true })
	end,
})

-- Quickfixウィンドウをトグルする
vim.keymap.set("n", "tw", "<Plug>window:quickfix:loop", { noremap = true })
