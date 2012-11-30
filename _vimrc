" vi互換の動きにしない
set nocompatible
filetype off

" メニューをデフォルトの英語にする
set langmenu=none

" NeoBundle.vimを使用する
if has("win32") || has("win64") || has("win32unix")
   set rtp+=$HOME/vimfiles/bundle/neobundle.vim
   call neobundle#rc('$HOME/vimfiles/bundle/')
else
   set rtp& rtp+=$HOME/.vim/bundle/neobundle.vim
   call neobundle#rc()
endif

if has('gui_running')
    NeoBundle 'https://github.com/vim-scripts/Align.vim.git'
endif

NeoBundle 'https://github.com/banyan/recognize_charcode.vim.git'
NeoBundle 'https://github.com/fholgado/minibufexpl.vim.git'
NeoBundle 'https://github.com/Shougo/neobundle.vim.git'
NeoBundle 'https://github.com/Shougo/neocomplcache.git'
NeoBundle 'https://github.com/Shougo/unite.vim.git'
NeoBundle 'https://github.com/Shougo/vimfiler.git'
NeoBundle 'https://github.com/thinca/vim-quickrun.git'
NeoBundle 'https://github.com/thinca/vim-ref.git'
NeoBundle 'https://github.com/tpope/vim-fugitive.git'
NeoBundle 'https://github.com/tsukkee/unite-tag.git'
NeoBundle 'https://github.com/ujiro99/my_color_scheme.git'
NeoBundle 'https://github.com/vim-ruby/vim-ruby.git'
NeoBundle 'https://github.com/vim-scripts/eregex.vim.git'
NeoBundle 'https://github.com/vim-scripts/gtags.vim.git'
NeoBundle 'https://github.com/vim-scripts/rails.vim.git'
NeoBundle 'https://github.com/vim-scripts/surround.vim.git'
NeoBundle 'https://github.com/vim-scripts/tagexplorer.vim.git'

filetype plugin indent on     " required!


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
" 移動関連
source $HOME/dotfiles/.vimrc.moving


" インクリメンタルサーチを行う
set incsearch

" 左右のカーソル移動で行間移動可能にする。
set whichwrap=b,s,<,>,[,]

" バックアップファイルを作成しない
set nobackup

" スワップファイルを作成しない
set noswapfile

" 対応括弧の瞬間強調時間
set matchtime=3

" タブを空白で入力する
set expandtab

" 標準タブは4
set tabstop=4
set softtabstop=4
set shiftwidth=4

" 自動的にインデントする
set autoindent
" スマートインデント
set smartindent
" 折り返し表示しない
set nowrap

" ヤンクをクリップボードへ送り込む
set clipboard+=unnamed

" 編集中でもバッファを切り替えれるようにしておく
set hidden

" 矩形選択で行末を超えてブロックを選択できるようにする
set virtualedit+=block

" 検索時に大文字小文字無視
set ignorecase

" 検索時に大文字が指定された時だけ大文字無視しない
set smartcase

" ヘルプファイルの参照
nnoremap <Space>h :<C-u>help<Space>

" vimrcを編集する
nnoremap <Space>. :<C-u>edit $MYVIMRC<CR>

" escでハイライトをオフ
nnoremap <silent> <ESC> <ESC>:noh<CR>

" ノーマルモード中でもエンターキーで改行挿入でノーマルモードに戻る
noremap <CR> i<CR><ESC>

" クリップボードの貼付け
nmap <Space>p "+gP

" 空行のインデントを勝手に消さない
nnoremap o oX<C-h>
nnoremap O OX<C-h>
inoremap <CR> <CR>X<C-h>

" もう一度やる
nnoremap U <C-r>

" ckfixウィンドウではq/ESCで閉じる
autocmd FileType qf nnoremap <buffer> q :ccl<CR>
autocmd FileType qf nnoremap <buffer> <ESC> :ccl<CR>

" cwでquickfixウィンドウの表示をtoggleする
function! s:toggle_qf_window()
  for bufnr in range(1,  winnr('$'))
    if getwinvar(bufnr,  '&buftype') ==# 'quickfix'
      execute 'ccl'
      return
    endif
  endfor
  execute 'botright cw'
endfunction
nnoremap <silent> cw :call <SID>toggle_qf_window()<CR>


"---------------------------------------------
" バッファ操作関連
"---------------------------------------------
nmap <Space>b :ls<CR>:buffer
nmap <Space>v :vsplit<CR><C-w><C-w>:ls<CR>:buffer
nmap <Space>V :Vexplore!<CR><CR>
nmap <Space>d :bd<CR>zz
nmap <Space>c :Kwbd<CR>zz


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
" 自動的に日本語入力(IM)をオンにする機能を有効にする
set noimdisableactivate


"---------------------------------------------
" Vimproc関連
"--------------------------------------------
" windowsの場合はproc.dllを入れておく
if has("win32") || has("win64")
    let g:vimproc_dll_path = $HOME.'\vimfiles\autoload\proc.dll'
elseif has("win32unix")
    let g:vimproc_dll_path = $HOME.'/vimfiles/autoload/proc_cygwin.dll'
else
    let g:vimproc_dll_path = $HOME.'/.vim/autoload/proc.so'
endif


"---------------------------------------------
" 独自コマンド
"---------------------------------------------
" vimrcのリロード
command! ReloadVimrc  source $MYVIMRC
" ウィンドウレイアウトを崩さないでバッファを閉じる
command! Kwbd let kwbd_bn= bufnr("%")|enew|exe "bdel ".kwbd_bn|unlet kwbd_bn
" デスクトップへ移動
if has("win32") || has("win64") || has("win32unix")
   command! Cdd :cd $HOME/デスクトップ
endif


" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge
" 保存時にtabをスペースに変換する
autocmd BufWritePre * :%s/\t/  /ge
