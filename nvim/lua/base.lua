-- バックアップファイルの作成先ディレクトリ
vim.o.backupdir = vim.fn.expand("~/.vim/backup")
-- スワップファイルの作成先ディレクトリ
vim.o.directory = vim.fn.expand("~/.vim/swap")
-- undofileの作成先ディレクトリ
vim.o.undodir = vim.fn.expand("~/.vim/undo")
vim.o.undofile = true
-- これで慣れてる
vim.g.mapleader = " "
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
vim.g.sqlite_clib_path = vim.fn.expand("~/AppData/Local/nvim-data/sqlite-dll-win64-x64-3420000/sqlite3.dll")

-------------------------------------------------------------------------------
-- インデント Indent
-------------------------------------------------------------------------------
vim.o.autoindent = true -- 自動でインデント
vim.o.smartindent = true -- 新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする。

-- softtabstopはTabキー押し下げ時の挿入される空白の量，0の場合はtabstopと同じ，BSにも影響する
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 0

vim.cmd([[
  autocmd FileType go         setlocal sw=4 sts=4 ts=4 noet
  autocmd FileType cs         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType css        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType stylus     setlocal sw=2 sts=2 ts=2 et
  autocmd FileType diff       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType eruby      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType html       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType jade       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType java       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
  autocmd FileType typescript setlocal sw=2 sts=2 ts=2 et
  autocmd FileType typescriptreact setlocal sw=2 sts=2 ts=2 et
  autocmd FileType vue        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 et
  autocmd FileType python     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType ruby       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType haml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType sh         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType vim        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType wsh        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType xhtml      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType xml        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType yaml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType zsh        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scala      setlocal sw=2 sts=2 ts=2 et
  autocmd FileType php        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scss       setlocal sw=2 sts=2 ts=2 et
]])

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

-- quickfixウィンドウではESCで閉じる
vim.api.nvim_create_augroup("vimrc", {})
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = "qf",
	group = "vimrc",
	callback = function()
		vim.keymap.set("n", "<ESC>", ":ccl<CR>", { noremap = true, buffer = true })
	end,
})

-- Quickfixウィンドウをトグルする
vim.keymap.set("n", "tw", "<Plug>window:quickfix:loop", { noremap = true })

-- ファイラーをトグルする
vim.keymap.set("n", ";n", ":Fern . -drawer -toggle<CR>", { noremap = true })

---------------------------------------------
-- command
---------------------------------------------
-- vimrcのリロード
vim.cmd("command! ReloadVimrc :luafile %")
-- 表示中バッファのディレクトリへ移動
vim.cmd("command! -nargs=0 CdCurrent cd %:p:h")
-- 空白の除去
vim.api.nvim_create_user_command("RemoveSpace", function()
	vim.api.nvim_command(":%s/\\s\\+$//ge") -- 行末の空白を除去する
	vim.api.nvim_command(":%s/\\t/  /ge") -- tabをスペースに変換する
end, { nargs = 0 })
-- 表示中のファイルパスをクリップボードへコピー
vim.api.nvim_create_user_command("CopyPath", function()
	vim.api.nvim_command("let @*=expand('%:p')")
end, { nargs = 0 })
