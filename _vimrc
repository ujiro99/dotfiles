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
NeoBundle 'https://github.com/Shougo/neocomplete.vim.git'
NeoBundle 'https://github.com/Shougo/neosnippet.git'
NeoBundle 'https://github.com/Shougo/unite-outline.git'
NeoBundle 'https://github.com/Shougo/unite.vim.git'
NeoBundle 'https://github.com/Shougo/vimproc.git'
NeoBundle 'https://github.com/banyan/recognize_charcode.vim.git'
NeoBundle 'https://github.com/deton/jasegment.vim.git'
NeoBundle 'https://github.com/digitaltoad/vim-jade.git'
NeoBundle 'https://github.com/hail2u/vim-css3-syntax.git'
NeoBundle 'https://github.com/kchmck/vim-coffee-script.git'
NeoBundle 'https://github.com/mojako/ref-sources.vim.git'
NeoBundle 'https://github.com/moll/vim-node.git'
NeoBundle 'https://github.com/nathanaelkane/vim-indent-guides.git'
NeoBundle 'https://github.com/rhysd/clever-f.vim.git'
NeoBundle 'https://github.com/rking/ag.vim.git'
NeoBundle 'https://github.com/scrooloose/syntastic.git'
NeoBundle 'https://github.com/thinca/vim-quickrun.git'
NeoBundle 'https://github.com/thinca/vim-ref.git'
NeoBundle 'https://github.com/tpope/vim-fugitive.git'
NeoBundle 'https://github.com/tsukkee/unite-tag.git'
NeoBundle 'https://github.com/tyru/open-browser.vim.git'
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
NeoBundleLazy 'https://github.com/mattn/emmet-vim'
NeoBundleLazy 'https://github.com/tpope/vim-haml.git'
NeoBundleLazy 'https://github.com/tpope/vim-rails.git'
NeoBundleLazy 'https://github.com/tpope/vim-rvm.git'
NeoBundleLazy 'https://github.com/vim-jp/vimdoc-ja.git'
NeoBundleLazy 'https://github.com/vim-ruby/vim-ruby.git'
" javascript
NeoBundleLazy 'https://github.com/vim-scripts/Better-Javascript-Indentation.git'
NeoBundleLazy 'https://github.com/claco/jasmine.vim.git'
NeoBundleLazy 'https://github.com/othree/javascript-libraries-syntax.vim.git'
NeoBundleLazy 'https://github.com/mustardamus/jqapi.git'
NeoBundleLazy 'https://github.com/teramako/jscomplete-vim.git'
NeoBundleLazy 'https://github.com/tokuhirom/jsref.git'
NeoBundleLazy 'https://github.com/marijnh/tern_for_vim.git'
NeoBundleLazy 'https://github.com/jelera/vim-javascript-syntax.git'


" NeoBundle 'https://github.com/nanotech/jellybeans.vim.git'
NeoBundle 'https://github.com/altercation/vim-colors-solarized.git'


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
" プラグイン関連
source $HOME/dotfiles/.vimrc.plugin


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

" ckfixウィンドウではq/ESCで閉じる
autocmd FileType qf nnoremap <buffer> q :ccl<CR>
autocmd FileType qf nnoremap <buffer> <ESC> :ccl<CR>

" twでquickfixウィンドウの表示をtoggleする
function! s:toggle_qf_window()
  for bufnr in range(1,  winnr('$'))
    if getwinvar(bufnr,  '&buftype') ==# 'quickfix'
      execute 'ccl'
      return
    endif
  endfor
  execute 'botright cw'
endfunction

nnoremap <silent> tw :call <SID>toggle_qf_window()<CR>


" 挿入モードでのカーソル移動
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" Leader
map ¥ <leader>


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
" javascript 関連
"---------------------------------------------
autocmd FileType javascript :compiler gjslint
autocmd QuickfixCmdPost make copen
let g:used_javascript_libs = 'angularjs, jquery'
let g:jscomplete_use = ['dom', 'moz']


"---------------------------------------------
" coffeescript 関連
"---------------------------------------------
" nnoremap <Space>w :CoffeeCompile watch<CR>


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
command! JsonFormat :execute '%!python -m json.tool'
  \ | :execute '%!python -c "import re,sys;chr=__builtins__.__dict__.get(\"unichr\", chr);sys.stdout.write(re.sub(r\"\\u[0-9a-f]{4}\", lambda x: chr(int(\"0x\" + x.group(0)[2:], 16)), sys.stdin.read()))"'
  \ | :%s/ \+$//ge
  \ | :set ft=javascript
  \ | :1
map <Leader>j JsonFormat<CR>
" 空白の除去
command! RemoveSpace call <SID>format_space()


"---------------------------------------------
" function
"---------------------------------------------
function! s:format_space()
    :%s/\s\+$//ge  " 行末の空白を除去する
    :%s/\t/  /ge   " tabをスペースに変換する
endfunction
