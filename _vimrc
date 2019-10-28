" vi互換の動きにしない
set nocompatible
filetype off

" 標準のメニューが読み込まれないようにする
let g:did_install_default_menus = 1

"---------------------------------------------
" 設定ファイルの読込
"---------------------------------------------
" 表示関連
source $HOME/dotfiles/.vimrc.appearance
" 補間関連
source $HOME/dotfiles/.vimrc.completion
" Tags関連
source $HOME/dotfiles/.vimrc.tags
" Color関連
source $HOME/dotfiles/.vimrc.colors
" エンコーディング関連
source $HOME/dotfiles/.vimrc.encoding
" インデント関連
source $HOME/dotfiles/.vimrc.indent
" 移動関連
source $HOME/dotfiles/.vimrc.moving
" 検索関連
source $HOME/dotfiles/.vimrc.search
" プラグイン関連
source $HOME/dotfiles/.vimrc.plugin


" Leader
let mapleader = " "

" 左右のカーソル移動で行間移動可能にする。
set whichwrap=b,s,<,>,[,]
" バックアップファイルの作成先ディレクトリ
set backupdir=$HOME/.vim/backup
" スワップファイルの作成先ディレクトリ
set directory=$HOME/.vim/swap
" undofileの作成先ディレクトリ
set undodir=$HOME/.vim/undo
set undofile
" 対応括弧の瞬間強調時間
set matchtime=3
" タブを空白で入力する
set expandtab
" 折り返し表示しない
set nowrap
" ヤンクをクリップボードへ送り込む
set clipboard+=unnamed
" 編集中でもバッファを切り替えれるようにしておく
set hidden
" 矩形選択で行末を超えてブロックを選択できるようにする
set virtualedit+=block

" escでハイライトをオフ
nnoremap <silent> <ESC> <ESC>:noh<CR>
" ノーマルモード中でもエンターキーで改行挿入でノーマルモードに戻る
noremap <CR> i<CR><ESC>
" もう一度やる
nnoremap U <C-r>

" ckfixウィンドウではq/ESCで閉じる
au FileType qf nnoremap <buffer> q :ccl<CR>
au FileType qf nnoremap <buffer> <ESC> :ccl<CR>

" バッファを閉じる
nmap <Space>d :bd<CR>zz
nmap <Space>D :bd!<CR>


"---------------------------------------------
" 日本語入力関連
"---------------------------------------------
" 日本語入力をリセット
au BufNewFile,BufRead * set iminsert=0
" 挿入モード終了時にIME状態を保持しない
inoremap <silent> <ESC> <ESC>
inoremap <silent> <C-[> <ESC>
" 「日本語入力固定モード」切替キー
inoremap <silent> <C-j> <C-^>


"---------------------------------------------
" coffeescript 関連
"---------------------------------------------
" nnoremap <Space>w :CoffeeCompile watch<CR>


"---------------------------------------------
" golang 関連
"---------------------------------------------
au BufNewFile,BufRead *.go set sw=4 noexpandtab ts=4 completeopt=menu
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
    if has('macunix')
    elseif has('win32')
        set pythonthreedll=%PYTHONHOME%\python36.dll
        set pythonthreehome=%PYTHONHOME%

    endif
endif

"---------------------------------------------
" command
"---------------------------------------------
" vimrcのリロード
command! ReloadVimrc source $MYVIMRC
" 表示中バッファのディレクトリへ移動
command! -nargs=0 CdCurrent cd %:p:h
" 空白の除去
command! RemoveSpace call <SID>format_space()


"---------------------------------------------
" function
"---------------------------------------------
" 空白の除去
function! s:format_space()
    :%s/\s\+$//ge  " 行末の空白を除去する
    :%s/\t/  /ge   " tabをスペースに変換する
endfunction

" twでquickfixウィンドウの表示をtoggleする
nnoremap <silent> tw :call <SID>toggle_qf_window()<CR>
function! s:toggle_qf_window()
  for bufnr in range(1,  winnr('$'))
    if getwinvar(bufnr,  '&buftype') ==# 'quickfix'
      execute 'ccl'
      return
    endif
  endfor
  execute 'botright cw'
endfunction
