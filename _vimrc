set rtp+=~/.vim/vundle.git/  
call vundle#rc()

Bundle 'eregex.vim'
Bundle 'https://github.com/Shougo/vimshell.git'
Bundle 'https://github.com/Shougo/vimproc.git'
Bundle 'https://github.com/vim-ruby/vim-ruby.git'
Bundle 'https://ujiro99@github.com/ujiro99/google2.git'
Bundle 'project.tar.gz'
Bundle 'rails.vim'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
Bundle 'surround.vim'
Bundle 'snippetsEmu'
Bundle 'thinca/vim-ref'
Bundle 'thinca/vim-quickrun'
Bundle 'unite-colorscheme'
Bundle 'quickrun.vim'
filetype plugin indent on     " required!

" 括弧自動補完
"inoremap { {}<LEFT>
"inoremap [ []<LEFT>
"inoremap ( ()<LEFT>
"inoremap " ""<LEFT>
"inoremap ' ''<LEFT>
"vnoremap { "zdi^V{<C-R>z}<ESC>
"vnoremap [ "zdi^V[<C-R>z]<ESC>
"vnoremap ( "zdi^V(<C-R>z)<ESC>
"vnoremap " "zdi^V"<C-R>z^V"<ESC>
"vnoremap ' "zdi'<C-R>z'<ESC>

"インクリメンタルサーチを行う
set incsearch

"入力モード時、ステータスラインのカラーを変更
"augroup InsertHook
"autocmd!
"autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
"autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
"augroup END

"日本語入力をリセット
au BufNewFile,BufRead * set iminsert=0

" vi互換の動きにしない
set nocompatible

" 左右のカーソル移動で行間移動可能にする。
set whichwrap=b,s,<,>,[,]

" バッファをキーで移動
map <F2> <ESC>:bp<CR>
map <F3> <ESC>:bn<CR>

" バックアップファイルを作成しない
set nobackup

" スワップファイルを作成しない
set noswapfile

" 対応括弧の瞬間強調時間
set matchtime=3

" 行番号表示
set number

" 見た目で行移動
nnoremap j gj
nnoremap k gk

" 削除でレジスタに格納しない(ビジュアルモードでの選択後は格納する)
"nnoremap x "_x
"nnoremap dd "_dd

"デフォルト設定。結局runtime/indentの設定のほうで、ファイルごとに切り替える
" タブとか改行を表示する
set list

" タブとか改行を示す文字列 eol(改行)は背景色違いのスペースにする。
set listchars=tab:>-,extends:<,trail:-,eol:\  

"タブを空白で入力する
set expandtab

"標準タブは4
set tabstop=4
set softtabstop=4

"自動的にインデントする
set autoindent
"スマートインデント
set smartindent
"折り返し表示しない
set nowrap

"空行のインデントを勝手に消さない
nnoremap o oX<C-h>
nnoremap O OX<C-h>
inoremap <CR> <CR>X<C-h>

" 文字コードの自動解釈の優先順位
set fileencodings=utf-8,cp932,euc-jp

" 改行コードの解釈優先順位
set fileformats=unix,dos

" 内部の解釈の文字コード　設定ファイルもこのコード
"set encoding=utf-8
" 内部の改行コード
set fileformat=unix

"==================================================================
"全角スペースを視覚化
if has('syntax')
  syntax enable
  function! ActivateInvisibleIndicator()
    highlight ZenkakuSpace cterm=underline ctermfg=darkgrey gui=underline guifg=#FF0000
    match ZenkakuSpace /　/
  endfunction
  augroup InvisibleIndicator
    autocmd!
    autocmd BufEnter * call ActivateInvisibleIndicator()
  augroup END
endif

" ヤンクをクリップボードへ送り込む
set clipboard+=unnamed

"編集中でもバッファを切り替えれるようにしておく
set hidden

"バッファ一覧ショートカット→バッファ番号で移動
nmap gb :ls<CR>:buf 

"ステータスのところにファイル情報表示
set statusline=%<[%n]%F%=\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}\ %l,%c\ %P 

"ルーラーを表示
set ruler
set title

" 矩形選択で行末を超えてブロックを選択できるようにする
set virtualedit+=block

"escでハイライトをオフ
"nnoremap <silent> <ESC> <ESC>:noh<CR>
" ノーマルモード中でもエンターキーで改行挿入でノーマルモードに戻る
noremap <CR> i<CR><ESC>

" 挿入モードでctrl+T二回うちで現在時刻挿入
imap <silent> <C-T><C-T> <C-R>=strftime("%H:%M:%S")<CR>

"VimShell
let g:vimproc_dll_path = $VIMRUNTIME . '/autoload/proc.so'

