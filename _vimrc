" vi互換の動きにしない
set nocompatible
filetype off

" メニューをデフォルトの英語にする
set langmenu=none

"NeoBundle.vimを使用する
if has("win32") || has("win64") || has("win32unix")
   set rtp+=$HOME/vimfiles/bundle/neobundle.vim
   call neobundle#rc('$HOME/vimfiles/bundle/')
else
   set rtp& rtp+=$HOME/.vim/bundle/neobundle.vim
   call neobundle#rc()
endif

if has('gui_running')
    NeoBundle 'https://github.com/Shougo/unite.vim.git'
    NeoBundle 'https://github.com/Shougo/vimfiler.git'
    NeoBundle 'https://github.com/tsukkee/unite-tag.git'
    NeoBundle 'https://github.com/ujiro99/my_color_scheme.git'
    NeoBundle 'https://github.com/vim-ruby/vim-ruby.git'
    NeoBundle 'tagexplorer.vim'
endif

NeoBundle 'Align'
NeoBundle 'eregex.vim'
NeoBundle 'rails.vim'
NeoBundle 'surround.vim'
NeoBundle 'https://github.com/banyan/recognize_charcode.vim.git'
NeoBundle 'https://github.com/Lokaltog/vim-powerline.git'
NeoBundle 'https://github.com/Shougo/neobundle.vim.git'
NeoBundle 'https://github.com/Shougo/vimproc.git'
NeoBundle 'https://github.com/vim-scripts/AutoComplPop.git'

filetype plugin indent on     " required!


"---------------------------------------------
" 設定ファイルの読込
"---------------------------------------------
"表示関連
source $HOME/dotfiles/.vimrc.apperance
"補間関連
source $HOME/dotfiles/.vimrc.completion
"Tags関連
source $HOME/dotfiles/.vimrc.tags
"Color関連
source $HOME/dotfiles/.vimrc.colors
"エンコーディング関連
source $HOME/dotfiles/.vimrc.encoding


"インクリメンタルサーチを行う
set incsearch

" 左右のカーソル移動で行間移動可能にする。
set whichwrap=b,s,<,>,[,]

" バックアップファイルを作成しない
set nobackup

" スワップファイルを作成しない
set noswapfile

" 対応括弧の瞬間強調時間
set matchtime=3

"タブを空白で入力する
set expandtab

"標準タブは4
set tabstop=4
set softtabstop=4
set shiftwidth=4

"自動的にインデントする
set autoindent
"スマートインデント
set smartindent
"折り返し表示しない
set nowrap

" ヤンクをクリップボードへ送り込む
set clipboard+=unnamed

"編集中でもバッファを切り替えれるようにしておく
set hidden

" 矩形選択で行末を超えてブロックを選択できるようにする
set virtualedit+=block

" ヘルプファイルの参照
nnoremap <C-h>  :<C-u>help<Space>

" vimrcを編集する
nnoremap <Space>. :<C-u>edit $MYVIMRC<CR>

" escでハイライトをオフ
nnoremap <silent> <ESC> <ESC>:noh<CR>

" ノーマルモード中でもエンターキーで改行挿入でノーマルモードに戻る
noremap <CR> i<CR><ESC>

" クリップボードの貼付け
nmap <Space>p "+gP

"空行のインデントを勝手に消さない
nnoremap o oX<C-h>
nnoremap O OX<C-h>
inoremap <CR> <CR>X<C-h>

" 見た目で行移動
nnoremap j gjzz
nnoremap k gkzz

" マッチ文字列が画面の真ん中にくるようにする
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

" もう一度やる
nnoremap U <C-r>

" QuickFixの移動
nnoremap <C-p> :cp <CR> 
nnoremap <C-n> :cn <CR>

" 行末へ移動
noremap - $

" 対応する括弧に移動
nnoremap [ %
nnoremap ] %

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
nmap <Space>j :bp<CR>zz
nmap <Space>k :bn<CR>zz
nmap <Space>b :ls<CR>:buffer
nmap <Space>v :vsplit<CR><C-w><C-w>:ls<CR>:buffer
nmap <Space>V :Vexplore!<CR><CR>
nmap <Space>d :bd<CR>zz
nmap <Space>c :Kwbd<CR>zz


"---------------------------------------------
" 日本語入力関連
"---------------------------------------------
"日本語入力をリセット
au BufNewFile,BufRead * set iminsert=0
" 挿入モード終了時にIME状態を保持しない
inoremap <silent> <ESC> <ESC>
inoremap <silent> <C-[> <ESC>
" 「日本語入力固定モード」切替キー
inoremap <silent> <C-j> <C-^>


"---------------------------------------------
" VimFiler関連
"---------------------------------------------
" デフォルトのエクスプローラをVimFilerへ変更
:let g:vimfiler_as_default_explorer  = 1
" セーフモードを解除
:let g:vimfiler_safe_mode_by_default = 0
" VimFiler表示
nmap <Space>f :VimFiler<CR>


"---------------------------------------------
" unite.vim
"---------------------------------------------
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
nnoremap <silent> ,mb :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,mf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,mr :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,mm :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> ,mu :<C-u>Unite buffer file_mru<CR>
" カレントバッファの行
nnoremap <silent> ,m/ :<C-u>Unite -buffer-name=search line -start-insert -no-quit<CR>
" 全部乗せ
nnoremap <silent> ,ma :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q


"---------------------------------------------
" Vimproc関連
"--------------------------------------------
"windowsの場合はproc.dllを入れておく
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
