" vi互換の動きにしない
set nocompatible
filetype off

" メニューをデフォルトの英語にする
set langmenu=none

" NeoBundle.vimを使用する
if has('vim_starting')
  if has("win32") || has("win64") || has("win32unix")
     set rtp+=$HOME/vimfiles/bundle/neobundle.vim
  else
     set rtp& rtp+=$HOME/.vim/bundle/neobundle.vim
  endif
endif

if has("win32") || has("win64") || has("win32unix")
   call neobundle#rc('$HOME/vimfiles/bundle/')
else
   call neobundle#rc()
endif

if has('gui_running')
    NeoBundle 'https://github.com/vim-scripts/Align.git'
    NeoBundle 'https://github.com/ujiro99/my_color_scheme.git'
endif
NeoBundle 'https://github.com/Shougo/neobundle.vim.git'
NeoBundle 'https://github.com/Shougo/neocomplcache.git'
NeoBundle 'https://github.com/Shougo/neosnippet.git'
NeoBundle 'https://github.com/Shougo/unite-outline.git'
NeoBundle 'https://github.com/Shougo/unite.vim.git'
NeoBundle 'https://github.com/Shougo/vimproc.git'
NeoBundle 'https://github.com/banyan/recognize_charcode.vim.git'
NeoBundle 'https://github.com/deton/jasegment.vim.git'
NeoBundle 'https://github.com/digitaltoad/vim-jade.git'
NeoBundle 'https://github.com/kchmck/vim-coffee-script.git'
NeoBundle 'https://github.com/moll/vim-node.git'
NeoBundle 'https://github.com/rhysd/clever-f.vim.git'
NeoBundle 'https://github.com/rking/ag.vim.git'
NeoBundle 'https://github.com/scrooloose/syntastic.git'
NeoBundle 'https://github.com/thinca/vim-quickrun.git'
NeoBundle 'https://github.com/tpope/vim-fugitive.git'
NeoBundle 'https://github.com/tsukkee/unite-tag.git'
NeoBundle 'https://github.com/ujiro99/memolist.vim.git'
NeoBundle 'https://github.com/vim-scripts/eregex.vim.git'
NeoBundle 'https://github.com/vim-scripts/grep.vim.git'
NeoBundle 'https://github.com/vim-scripts/gtags.vim.git'
NeoBundle 'https://github.com/vim-scripts/surround.vim.git'
NeoBundle 'https://github.com/wavded/vim-stylus.git'


" vimproc を自動でビルドする
call neobundle#config('Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ })


" 後で読み込む
NeoBundleLazy 'https://github.com/claco/jasmine.vim.git'
NeoBundleLazy 'https://github.com/jelera/vim-javascript-syntax.git'
NeoBundleLazy 'https://github.com/mattn/zencoding-vim.git'
NeoBundleLazy 'https://github.com/tpope/vim-haml.git'
NeoBundleLazy 'https://github.com/tpope/vim-rails.git'
NeoBundleLazy 'https://github.com/tpope/vim-rvm.git'
NeoBundleLazy 'https://github.com/tyru/open-browser.vim.git'
NeoBundleLazy 'https://github.com/vim-jp/vimdoc-ja.git'
NeoBundleLazy 'https://github.com/vim-ruby/vim-ruby.git'
NeoBundleLazy 'https://github.com/vim-scripts/Better-Javascript-Indentation.git'


" NeoBundle 'https://github.com/nanotech/jellybeans.vim.git'
" NeoBundle 'https://github.com/w0ng/vim-hybrid.git'
" NeoBundle 'https://github.com/altercation/vim-colors-solarized.git'


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
" インデント関連
source $HOME/dotfiles/.vimrc.indent
" 移動関連
source $HOME/dotfiles/.vimrc.moving
" 検索関連
source $HOME/dotfiles/.vimrc.search

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

" 折り返し表示しない
set nowrap

" ヤンクをクリップボードへ送り込む
set clipboard+=unnamed

" 編集中でもバッファを切り替えれるようにしておく
set hidden

" 矩形選択で行末を超えてブロックを選択できるようにする
set virtualedit+=block

" vimrcを編集する
nnoremap <Space>. :<C-u>edit $HOME/dotfiles/_vimrc<CR>

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

" 括弧補完
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
vnoremap { "zdi^V{<C-R>z}<ESC>
vnoremap [ "zdi^V[<C-R>z]<ESC>
vnoremap ( "zdi^V(<C-R>z)<ESC>
vnoremap " "zdi^V"<C-R>z^V"<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>

" コンソールでは desert
colorscheme desert

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


" 挿入モードでのカーソル移動
inoremap <C-h> <Left>
inoremap <C-l> <Right>


"---------------------------------------------
" バッファ操作関連
"---------------------------------------------
nmap <Space>b :ls<CR>:buffer
nmap <Space>v :vsplit<CR><C-w><C-w>:ls<CR>:buffer
nmap <Space>d :bd<CR>zz
nmap <Space>D :bd!<CR>
nmap <Space>k :Kwbd<CR>zz


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
" NeoBundle 関連
"---------------------------------------------
augroup NeoBundleSource
    autocmd!
    if has("mac")
        autocmd FileType {ruby,markdown} NeoBundleSource
                    \ vim-rvm
        " ruby, markdown のBufferではRvmで設定した環境を使う
        autocmd FileType {ruby,markdown} :Rvm
    endif
    autocmd FileType ruby NeoBundleSource
                \ vim-rails
                \ vim-ruby
    autocmd FileType {xhtml,html,css,eruby,markdown} NeoBundleSource
                \ open-browser.vim
                \ zencoding-vim
    autocmd FileType {javascript,coffee} NeoBundleSource
                \ Better-Javascript-Indentation
                \ vim-javascript-syntax
    autocmd FileType haml NeoBundleSource
                \ vim-haml
augroup END


"---------------------------------------------
" Vimproc関連
"--------------------------------------------
" windowsの場合はproc.dllを入れておく
if has("win32") || has("win64")
    let g:vimproc_dll_path = $HOME.'\vimfiles\bundle\vimproc\autoload\vimproc_win32.dll'
elseif has("win32unix")
    let g:vimproc_dll_path = $HOME.'/vimfiles/autoload/proc_cygwin.dll'
else
    let g:vimproc_dll_path = $HOME.'/.vim/bundle/vimproc/autoload/vimproc_mac.so'
endif


"---------------------------------------------
" Unite.vim関連
"---------------------------------------------
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
nnoremap <silent> ;b :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ;f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ;r :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ;m :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> ;u :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
nnoremap <silent> ;a :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
" memolist
nnoremap <silent> ;l :Unite file:<C-r>=g:memolist_path."/"<CR><CR>
" Tags
nnoremap <silent> ;t :Unite tag<CR>
" Outline
nnoremap <silent> ;o :Unite outline<CR>


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
" ref.vim関連
"---------------------------------------------
" ruby
let g:ref_open         = 'split'
let g:ref_refe_cmd     = "rurema"
let g:ref_refe_version = 2
nnoremap <Space>r :<C-U>Ref refe<Space>


"---------------------------------------------
" Fugitive 関連
"---------------------------------------------
nnoremap <Space>gd :<C-u>Gdiff<Enter>
nnoremap <Space>gs :<C-u>Gstatus<Enter>
nnoremap <Space>gl :<C-u>Glog<Enter>
nnoremap <Space>ga :<C-u>Gwrite<Enter>
nnoremap <Space>gc :<C-u>Gcommit<Enter>
nnoremap <Space>gC :<C-u>Git commit --amend<Enter>
nnoremap <Space>gb :<C-u>Gblame<Enter>


"---------------------------------------------
" QuickRun 関連
"---------------------------------------------
" 現在のバッファを実行
nnoremap <F5> :QuickRun<CR>
let g:quickrun_config = {}
let g:quickrun_config.markdown = {
      \ 'command': 'bluefeather',
      \ 'exec': 'cat %s | %c - -f d',
      \ 'hook/enable': 1,
      \ 'hook/eval/template': "CSS: $HOME/dotfiles/vimfiles/template/style.css\nEncoding: utf-8\n%s",
      \ 'hook/time/enable': 0,
      \ 'outputter': 'browser'
      \ }
let g:quickrun_config.coffee = {
      \'command' : 'coffee',
      \'exec' : ['%c -cbp %s']
      \}


"---------------------------------------------
" javascript 関連
"---------------------------------------------
autocmd FileType javascript :compiler gjslint
autocmd QuickfixCmdPost make copen


"---------------------------------------------
" coffeescript 関連
"---------------------------------------------
nnoremap <Space>w :CoffeeCompile watch<CR>


"---------------------------------------------
" Align 関連
"---------------------------------------------
" utf8を使うときに必要らしい
let g:Align_xstrlen=3


"---------------------------------------------
" zencoding 関連
"---------------------------------------------
" 補完を有効化
let g:use_zen_complete_tag = 1
" キーマップを変更する
let g:user_zen_leader_key = '<C-e>'
" インデントは半角スペース4個
let g:user_zen_settings = {
             \'indentation' : '    ',
             \}


"---------------------------------------------
" surround 関連
"---------------------------------------------
" 記号に対応する数字は :ascii で調べられる
" -
let g:surround_45 = "<% \r %>"
" =
let g:surround_61 = "<%= \r %>"


"---------------------------------------------
" memolist 関連
"---------------------------------------------
map ,mn  :MemoNew<CR>
map ,ml  :MemoList<CR>
map ,mg  :MemoGrep<CR>
let g:memolist_memo_date         = "%Y%m%d %H:%M"
let g:memolist_memo_suffix       = "md"
if has("win32") || has("win64")
    let g:memolist_path = "~/GoogleDrive/memo/win"
elseif has("mac")
    let g:memolist_path = "~/GoogleDrive/memo/mac"
endif


"---------------------------------------------
" command
"---------------------------------------------
" vimrcのリロード
command! ReloadVimrc  source $MYVIMRC
" ウィンドウレイアウトを崩さないでバッファを閉じる
command! Kwbd let kwbd_bn= bufnr("%")|enew|exe "bdel ".kwbd_bn|unlet kwbd_bn
" デスクトップへ移動
if has("win32") || has("win64") || has("win32unix")
    command! Cdd :cd $HOME\Desktop\
endif
" 表示中バッファのディレクトリへ移動
command! -nargs=0 CdCurrent cd %:p:h
" XMLの整形
map <Leader>x !python -m BeautifulSoup<CR>
" Jsonの整形
map <Leader>j !python -m json.tool<CR>

"---------------------------------------------
" function
"---------------------------------------------
function! s:format_space()
    if &ft != 'markdown'
        :%s/\s\+$//ge  " 行末の空白を除去する
        :%s/\t/  /ge   " tabをスペースに変換する
    endif
endfunction

augroup format_space
  autocmd!
  autocmd BufWritePre * call <SID>format_space()
augroup END


