" vi互換の動きにしない
set nocompatible
filetype off

"vundle.vimを使用する
if has("win32") || has("win64")
   set rtp+=./vimfiles/vundle.git/
   call vundle#rc('./vimfiles/bundle/')
else
   set rtp& rtp+=~/.vim/bundle/vundle
   call vundle#rc()
endif

Bundle 'Align'
Bundle 'eregex.vim'
Bundle 'gmarik/vundle'
Bundle 'https://github.com/Shougo/vimfiler.git'
Bundle 'https://github.com/Shougo/vimproc.git'
Bundle 'https://github.com/Shougo/vimshell.git'
Bundle 'https://github.com/vim-ruby/vim-ruby.git'
Bundle 'https://github.com/ujiro99/google2.git'
Bundle 'project.tar.gz'
Bundle 'rails.vim'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
Bundle 'surround.vim'
Bundle 'snippetsEmu'
Bundle 'thinca/vim-ref'
Bundle 'thinca/vim-quickrun'
Bundle 'unite-colorscheme'

filetype plugin indent on     " required!

"インクリメンタルサーチを行う
set incsearch

"入力モード時、ステータスラインのカラーを変更
"augroup InsertHook
"autocmd!
"autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
"autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
"augroup END

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

"デフォルト設定。結局runtime/indentの設定のほうで、ファイルごとに切り替える
"タブとか改行を表示する
set nolist

" タブとか改行を示す文字列 eol(改行)は背景色違いのスペースにする。
"set listchars=tab:>-,extends:<,trail:-,eol:\  

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

"空行のインデントを勝手に消さない
nnoremap o oX<C-h>
nnoremap O OX<C-h>
inoremap <CR> <CR>X<C-h>

" 文字コードの自動解釈の優先順位
set fileencodings=utf-8,cp932,euc-jp

" 改行コードの解釈優先順位
set fileformats=unix,dos

" 内部の解釈の文字コード 設定ファイルもこのコード
" set encoding=utf-8
" 内部の改行コード
set fileformat=unix

"全角スペースを視覚化
if has('syntax')
  syntax enable
  function! ActivateInvisibleIndicator()
    highlight ZenkakuSpace cterm=underline ctermfg=darkgrey gui=underline guifg=#333333
    match ZenkakuSpace /＿/
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

"ステータスのところにファイル情報表示
set statusline=%<[%n]%F%=\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}\ %l,%c\ %P 

"ルーラーを表示
set ruler
set title

" 矩形選択で行末を超えてブロックを選択できるようにする
set virtualedit+=block

" escでハイライトをオフ
nnoremap <silent> <ESC> <ESC>:noh<CR>
" ノーマルモード中でもエンターキーで改行挿入でノーマルモードに戻る
noremap <CR> i<CR><ESC>

" 挿入モードでctrl+T二回うちで現在時刻挿入
"imap <silent> <C-T><C-T> <C-R>=strftime("%H:%M:%S")<CR>

"VimShell
"windowsの場合はproc.dllを入れておく
if has("win32") || has("win64")
else
    let g:vimproc_dll_path = $VIMRUNTIME . '/autoload/proc.so'
endif

"カーソル行をハイライト
"カレントウィンドウにのみ罫線を引く
set cursorline
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END
":hi clear CursorLine
":hi CursorLine 
"highlight CursorLine ctermbg=black guibg=#eeeeee

" ヘルプファイルの参照
nnoremap <C-h>  :<C-u>help<Space>

" vimrcのリロード
command! ReloadVimrc  source $MYVIMRC

" 専用ホットキーを定義
nnoremap <Space>. :<C-u>edit $MYVIMRC<CR>

" デフォルトのエクスプローラをVimFilerへ変更
:let g:vimfiler_as_default_explorer = 1


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
" project.vim関連
"---------------------------------------------
" ファイルが選択されたら、ウィンドウを閉じる
:let g:proj_flags = "imstc"
" <Leader>Pで、プロジェクトをトグルで開閉する
:nmap <silent> <Leader>p <Plug>ToggleProject
" <Leader>pで、デフォルトのプロジェクトを開く
":nmap <silent> <Leader>P :Project<CR>
" カレントディレクトリにプロジェクト管理ファイルがあったら読み込む
if getcwd() != $HOME
    if filereadable(getcwd(). '/.vimprojects')
        :Project .vimprojects
    endif
endif


"---------------------------------------------
" neocomplcache.vim関連
"---------------------------------------------
if has("win32") || has("win64")
else
  " neocomplcacheを起動時に有効化
  let g:neocomplcache_enable_at_startup = 1
  " smart caseを有効化
  let g:neocomplcache_enable_smart_case = 1
  " camel caseを有効化
  let g:neocomplcache_enable_camel_case_completion = 1
  " _区切りの補完を有効化
  let g:neocomplcache_enable_underbar_completion = 1
  " シンタックスをキャッシュするときの最小文字長
  let g:neocomplcache_min_syntax_length = 3
  "<C-Space>でomni補完
  "imap <C-Space> <C-x><C-o>
endif


"---------------------------------------------
" バッファ操作関連
"---------------------------------------------
nmap <Space>b :ls<CR>:buffer 
nmap <Space>f :VimFiler<CR>
nmap <Space>v :vsplit<CR><C-w><C-w>:ls<CR>:buffer
nmap <Space>V :Vexplore!<CR><CR>
nmap <Space>d :bd<CR>

"---------------------------------------------
" unite.vim
"---------------------------------------------
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

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
" Vimshell関連
"---------------------------------------------
let g:vimshell_user_prompt = '"(" . getcwd() . ") --- (" . $USER . "@" . hostname() . ")"'
let g:vimshell_prompt = '$ '
let g:vimshell_right_prompt = 'vimshell#vcs#info("(%s)-[%b]", "(%s)-[%b|%a]")'
let g:vimshell_ignore_case = 1
let g:vimshell_smart_case = 1
