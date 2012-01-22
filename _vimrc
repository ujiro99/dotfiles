" vi�݊��̓����ɂ��Ȃ�
set nocompatible
filetype off

"NeoBundle.vim���g�p����
if has("win32") || has("win64")
   set rtp+=$VIM/vimfiles/bundle/neobundle.vim
   call neobundle#rc('$VIM/vimfiles/bundle/')
else
   set rtp& rtp+=~/.vim/bundle/neobundle.vim
   call neobundle#rc()
endif

NeoBundle 'Align'
NeoBundle 'gmarik/vundle'
NeoBundle 'https://github.com/Shougo/vimfiler.git'
NeoBundle 'https://github.com/Shougo/vimproc.git'
NeoBundle 'https://github.com/tsukkee/unite-tag.git'
NeoBundle 'https://github.com/vim-ruby/vim-ruby.git'
NeoBundle 'https://github.com/ujiro99/my-color-scheme.git'
NeoBundle 'rails.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'surround.vim'
"NeoBundle 'eregex.vim'
"NeoBundle 'https://github.com/Shougo/vimshell.git'
"NeoBundle 'NERD_tree.vim'
"NeoBundle 'project.tar.gz'
"NeoBundle 'snippetsEmu'
"NeoBundle 'srcexpl.vim' 
"NeoBundle 'tagexplorer.vim'
"NeoBundle 'taglist.vim'
"NeoBundle 'thinca/vim-ref'
"NeoBundle 'thinca/vim-quickrun'
"NeoBundle 'trinity.vim'
"NeoBundle 'unite-colorscheme'

filetype plugin indent on     " required!


"�C���N�������^���T�[�`���s��
set incsearch

" ���E�̃J�[�\���ړ��ōs�Ԉړ��\�ɂ���B
set whichwrap=b,s,<,>,[,]

" �o�b�N�A�b�v�t�@�C�����쐬���Ȃ�
set nobackup

" �X���b�v�t�@�C�����쐬���Ȃ�
set noswapfile

" �Ή����ʂ̏u�ԋ�������
set matchtime=3

" �s�ԍ��\��
set number

" �����ڂōs�ړ�
nnoremap j gj
nnoremap k gk

"�f�t�H���g�ݒ�B����runtime/indent�̐ݒ�̂ق��ŁA�t�@�C�����Ƃɐ؂�ւ���
"�^�u�Ƃ����s��\������
set nolist

"�^�u���󔒂œ��͂���
set expandtab

"�W���^�u��4
set tabstop=4
set softtabstop=4
set shiftwidth=4

"�����I�ɃC���f���g����
set autoindent
"�X�}�[�g�C���f���g
set smartindent
"�܂�Ԃ��\�����Ȃ�
set nowrap

"��s�̃C���f���g������ɏ����Ȃ�
nnoremap o oX<C-h>
nnoremap O OX<C-h>
inoremap <CR> <CR>X<C-h>

" �����R�[�h�̎������߂̗D�揇��
set fileencodings=utf-8,cp932,euc-jp

" ���s�R�[�h�̉��ߗD�揇��
set fileformats=unix,dos

" �����̉��s�R�[�h
set fileformat=unix

"�S�p�X�y�[�X�����o��
if has('syntax')
  syntax enable
  function! ActivateInvisibleIndicator()
    highlight ZenkakuSpace cterm=underline ctermfg=darkgrey gui=underline guifg=#333333
    match ZenkakuSpace /�Q/
  endfunction
  augroup InvisibleIndicator
    autocmd!
    autocmd BufEnter * call ActivateInvisibleIndicator()
  augroup END
endif

" �����N���N���b�v�{�[�h�֑��荞��
set clipboard+=unnamed

" �N���b�v�{�[�h�̓\�t��
nmap <Space>p "+gP<CR>

"�ҏW���ł��o�b�t�@��؂�ւ����悤�ɂ��Ă���
set hidden

"�X�e�[�^�X�̂Ƃ���Ƀt�@�C�����\��
set statusline=%<[%n]%F%=\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}\ %l,%c\ %P 

"���[���[��\��
set ruler
set title

" ��`�I���ōs���𒴂��ău���b�N��I���ł���悤�ɂ���
set virtualedit+=block

" esc�Ńn�C���C�g���I�t
nnoremap <silent> <ESC> <ESC>:noh<CR>
" �m�[�}�����[�h���ł��G���^�[�L�[�ŉ��s�}���Ńm�[�}�����[�h�ɖ߂�
noremap <CR> i<CR><ESC>


"�J�[�\���s���n�C���C�g
"�J�����g�E�B���h�E�ɂ̂݌r��������
set cursorline
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END


" �w���v�t�@�C���̎Q��
nnoremap <C-h>  :<C-u>help<Space>

" ��p�z�b�g�L�[���`
nnoremap <Space>. :<C-u>edit $MYVIMRC<CR>


"---------------------------------------------
" �Ǝ��R�}���h
"---------------------------------------------
" vimrc�̃����[�h
command! ReloadVimrc  source $MYVIMRC
" �f�X�N�g�b�v�ֈړ�
command! Cdd :cd $HOME/�f�X�N�g�b�v


"---------------------------------------------
" ���{����͊֘A
"---------------------------------------------
"���{����͂����Z�b�g
au BufNewFile,BufRead * set iminsert=0
" �}�����[�h�I������IME��Ԃ�ێ����Ȃ�
inoremap <silent> <ESC> <ESC>
inoremap <silent> <C-[> <ESC>
" �u���{����͌Œ胂�[�h�v�ؑփL�[
inoremap <silent> <C-j> <C-^>


"---------------------------------------------
" project.vim�֘A
"---------------------------------------------
" �t�@�C�����I�����ꂽ��A�E�B���h�E�����
":let g:proj_flags = "imstc"
" <Leader>P�ŁA�v���W�F�N�g���g�O���ŊJ����
":nmap <silent> <Leader>p <Plug>ToggleProject
" <Leader>p�ŁA�f�t�H���g�̃v���W�F�N�g���J��
":nmap <silent> <Leader>P :Project<CR>
" �J�����g�f�B���N�g���Ƀv���W�F�N�g�Ǘ��t�@�C������������ǂݍ���
"if getcwd() != $HOME
"    if filereadable(getcwd(). '/.vimprojects')
"        :Project .vimprojects
"    endif
"endif


"---------------------------------------------
" neocomplcache�֘A
"---------------------------------------------
if has("win32") || has("win64")
else
    " neocomplcache���N�����ɗL����
    let g:neocomplcache_enable_at_startup = 1
    " smart case��L����
    let g:neocomplcache_enable_smart_case = 1
    " camel case��L����
    let g:neocomplcache_enable_camel_case_completion = 1
    " _��؂�̕⊮��L����
    let g:neocomplcache_enable_underbar_completion = 1
    " �V���^�b�N�X���L���b�V������Ƃ��̍ŏ�������
    let g:neocomplcache_min_syntax_length = 4
endif

"---------------------------------------------
" VimFiler�֘A
"---------------------------------------------
" �f�t�H���g�̃G�N�X�v���[����VimFiler�֕ύX
:let g:vimfiler_as_default_explorer  = 1
" �Z�[�t���[�h������
:let g:vimfiler_safe_mode_by_default = 0


"---------------------------------------------
" �o�b�t�@����֘A
"---------------------------------------------
nmap <Space>j  :bp<CR>
nmap <Space>k  :bn<CR>
nmap <Space>b  :ls<CR>:buffer 
nmap <Space>f  :VimFiler<CR>
nmap <Space>v  :vsplit<CR><C-w><C-w>:ls<CR>:buffer
nmap <Space>V  :Vexplore!<CR><CR>
nmap <Space>d  :bd<CR>


"---------------------------------------------
" unite.vim
"---------------------------------------------
" ���̓��[�h�ŊJ�n����
let g:unite_enable_start_insert=1
" �o�b�t�@�ꗗ
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" �t�@�C���ꗗ
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" ���W�X�^�ꗗ
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" �ŋߎg�p�����t�@�C���ꗗ
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" ��p�Z�b�g
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
" �S���悹
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
" �E�B���h�E�𕪊����ĊJ��
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" �E�B���h�E���c�ɕ������ĊJ��
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" ESC�L�[��2�񉟂��ƏI������
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q


"---------------------------------------------
" Vimshell�֘A
"---------------------------------------------
"windows�̏ꍇ��proc.dll�����Ă���
if has("win32") || has("win64")
else
    let g:vimproc_dll_path = $HOME.'/.vim/autoload/proc.so'
endif
let g:vimshell_user_prompt = '"(" . getcwd() . ") --- (" . $USER . "@" . hostname() . ")"'
let g:vimshell_prompt = '$ '
let g:vimshell_right_prompt = 'vimshell#vcs#info("(%s)-[%b]", "(%s)-[%b|%a]")'
let g:vimshell_ignore_case = 1
let g:vimshell_smart_case = 1
let g:vimshell_interactive_update_time = 10
" vimshell map
nnoremap <silent> vs  :VimShell<CR>
nnoremap <silent> vsc :VimShellCreate<CR>
nnoremap <silent> vp  :VimShellPop<CR>


"---------------------------------------------
" tag�֘A
"---------------------------------------------
:set tags+=./tags
nnoremap <silent> mt  :!ctags -R<CR>


" �R�}���h���C���⊮��zsh���C�N�ɂ���
set wildmode=list:full
" �R�}���h���C���⊮���g�����[�h�ɂ���
set wildmenu
" �R�}���h���C����⊮���͂���L�[
set wildchar=<Tab>


" ������x���
nnoremap U <C-r> 
nnoremap <C-p> :cp <CR> 
nnoremap <C-n> :cn <CR>


"<C-Space>��omni�⊮
imap <C-Space> <C-x><C-o>


" �}�b�`�����񂪉�ʂ̐^�񒆂ɂ���悤�ɂ���
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz
