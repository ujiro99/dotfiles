-- バックアップファイルの作成先ディレクトリ
vim.o.backupdir = vim.fn.expand("~/.vim/backup")
-- スワップファイルの作成先ディレクトリ
vim.o.directory = vim.fn.expand("~/.vim/swap")
-- undofileの作成先ディレクトリ
vim.o.undodir = vim.fn.expand("~/.vim/undo")
vim.o.undofile = true
-- これで慣れてる
vim.g.mapleader = ' '
-- 左右のカーソル移動で行間移動可能にする。
vim.o.whichwrap = "b,s,<,>,[,]"
-- 対応括弧の瞬間強調時間
vim.o.matchtime = 3
-- タブを空白で入力する
vim.o.expandtab = true
-- 折り返し表示しない
vim.o.wrap = false
-- ヤンクをクリップボードへ送り込む
vim.opt.clipboard:append { 'unnamedplus' }
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
vim.o.autoindent = true  -- 自動でインデント
vim.o.smartindent = true -- 新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする。

-- softtabstopはTabキー押し下げ時の挿入される空白の量，0の場合はtabstopと同じ，BSにも影響する
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 0


-------------------------------------------------------------------------------
-- keymap
-------------------------------------------------------------------------------
-- escでハイライトをオフ
vim.keymap.set('n', '<ESC>', '<ESC>:noh<CR>', { noremap = true })
-- ノーマルモード中でもエンターキーで改行挿入でノーマルモードに戻る
vim.keymap.set('n', '<CR>', 'i<CR><ESC>', { noremap = true })
-- もう一度やる
vim.keymap.set('n', 'U', '<C-r>', { noremap = true })
-- バッファを閉じる
vim.keymap.set('n', '<Space>d', ':bd<CR>zz', { noremap = true })
vim.keymap.set('n', '<Space>D', ':bd!<CR>', { noremap = true })

-- quickfixウィンドウではq/ESCで閉じる
vim.api.nvim_create_augroup('vimrc', {})
vim.api.nvim_create_autocmd({ 'FileType' }, {
    pattern = 'quickfix',
    group = 'vimrc',
    callback = function()
        vim.keymap.set('n', 'q', ':ccl<CR>', { noremap = true })
        vim.keymap.set('n', '<ESC>', ':ccl<CR>', { noremap = true })
    end
})

-- ファイラーをトグルする
vim.keymap.set('n', ';n', ':Fern . -drawer -toggle<CR>', { noremap = true })


---------------------------------------------
-- command
---------------------------------------------
-- vimrcのリロード
vim.cmd("command! ReloadVimrc :luafile %")
-- 表示中バッファのディレクトリへ移動
vim.cmd("command! -nargs=0 CdCurrent cd %:p:h")
-- 空白の除去
vim.api.nvim_create_user_command('RemoveSpace',
    function()
        vim.api.nvim_command(":%s/\\s\\+$//ge") -- 行末の空白を除去する
        vim.api.nvim_command(":%s/\\t/  /ge") -- tabをスペースに変換する
    end,
    { nargs = 0 }
)
-- 表示中のファイルパスをクリップボードへコピー
vim.api.nvim_create_user_command('CopyPath',
    function()
        vim.api.nvim_command("let @*=expand('%:p')")
    end,
    { nargs = 0 }
)

--[[

"---------------------------------------------
" golang 関連
"---------------------------------------------
au FileType go compiler go
au FileType go :highlight goErr cterm=bold ctermfg=214
au FileType go :match goErr /\<err\>/
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>e <Plug>(go-rename)
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1


"---------------------------------------------
" python 関連
"---------------------------------------------
if has('vim_starting')
if has('mac')
" NeoVim用のPython環境
" https://qiita.com/sigwyg/items/41630f8754c2028a7a9f
let $PYENV_ROOT = $HOME."/.pyenv"
if has('nvim') && executable( $PYENV_ROOT."/versions/neovim-2/bin/python" )
let g:python_host_prog = $PYENV_ROOT.'/versions/neovim-2/bin/python'
endif
if has('nvim') && executable( $PYENV_ROOT."/versions/neovim-3/bin/python" )
let g:python3_host_prog = $PYENV_ROOT.'/versions/neovim-3/bin/python'
endif
elseif has('win32')
let g:python3_host_prog = 'C:\Python311\python.exe'
endif
endif
]]
