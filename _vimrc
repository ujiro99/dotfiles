" vi�݊��̓����ɂ��Ȃ�
set nocompatible
filetype off

"vundle.vim���g�p����
if has("win32") || has("win64")
   set rtp+=./vimfiles/vundle.git/
   call vundle#rc('./vimfiles/bundle/')
else
   set rtp+=~/.vim/vundle.vim/
   call vundle#rc()
endif

Bundle 'Align.vim'
Bundle 'eregex.vim'
Bundle 'https://github.com/Shougo/vimshell.git'
Bundle 'https://github.com/Shougo/vimproc.git'
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
Bundle 'quickrun.vim'

filetype plugin indent on     " required!

"�C���N�������^���T�[�`���s��
set incsearch

"���̓��[�h���A�X�e�[�^�X���C���̃J���[��ύX
"augroup InsertHook
"autocmd!
"autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
"autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
"augroup END

"���{����͂����Z�b�g
au BufNewFile,BufRead * set iminsert=0

" ���E�̃J�[�\���ړ��ōs�Ԉړ��\�ɂ���B
set whichwrap=b,s,<,>,[,]

" �o�b�t�@���L�[�ňړ�
map <F2> <ESC>:bp<CR>
map <F3> <ESC>:bn<CR>

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

" �폜�Ń��W�X�^�Ɋi�[���Ȃ�(�r�W���A�����[�h�ł̑I����͊i�[����)
"nnoremap x "_x
"nnoremap dd "_dd

"�f�t�H���g�ݒ�B����runtime/indent�̐ݒ�̂ق��ŁA�t�@�C�����Ƃɐ؂�ւ���
"�^�u�Ƃ����s��\������
set nolist

" �^�u�Ƃ����s������������ eol(���s)�͔w�i�F�Ⴂ�̃X�y�[�X�ɂ���B
"set listchars=tab:>-,extends:<,trail:-,eol:\  

"�^�u���󔒂œ��͂���
set expandtab

"�W���^�u��4
set tabstop=4
set softtabstop=4

"�����I�ɃC���f���g����
set autoindent
"�X�}�[�g�C���f���g
set smartindent
"�܂�Ԃ��\�����Ȃ�
"set nowrap

"��s�̃C���f���g������ɏ����Ȃ�
nnoremap o oX<C-h>
nnoremap O OX<C-h>
inoremap <CR> <CR>X<C-h>

" �����R�[�h�̎������߂̗D�揇��
set fileencodings=utf-8,cp932,euc-jp

" ���s�R�[�h�̉��ߗD�揇��
set fileformats=unix,dos

" �����̉��߂̕����R�[�h�@�ݒ�t�@�C�������̃R�[�h
" set encoding=utf-8
" �����̉��s�R�[�h
set fileformat=unix

"�S�p�X�y�[�X�����o��
if has('syntax')
  syntax enable
  function! ActivateInvisibleIndicator()
    highlight ZenkakuSpace cterm=underline ctermfg=darkgrey gui=underline guifg=#FF0000
    match ZenkakuSpace /�@/
  endfunction
  augroup InvisibleIndicator
    autocmd!
    autocmd BufEnter * call ActivateInvisibleIndicator()
  augroup END
endif

" �����N���N���b�v�{�[�h�֑��荞��
set clipboard+=unnamed

"�ҏW���ł��o�b�t�@��؂�ւ����悤�ɂ��Ă���
set hidden

"�o�b�t�@�ꗗ�V���[�g�J�b�g���o�b�t�@�ԍ��ňړ�
nmap gb :ls<CR>:buf 

"�X�e�[�^�X�̂Ƃ���Ƀt�@�C�����\��
set statusline=%<[%n]%F%=\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}\ %l,%c\ %P 

"���[���[��\��
set ruler
set title

" ��`�I���ōs���𒴂��ău���b�N��I���ł���悤�ɂ���
set virtualedit+=block

"esc�Ńn�C���C�g���I�t
"nnoremap <silent> <ESC> <ESC>:noh<CR>
" �m�[�}�����[�h���ł��G���^�[�L�[�ŉ��s�}���Ńm�[�}�����[�h�ɖ߂�
noremap <CR> i<CR><ESC>

" �}�����[�h��ctrl+T��񂤂��Ō��ݎ����}��
imap <silent> <C-T><C-T> <C-R>=strftime("%H:%M:%S")<CR>

"VimShell
"windows�̏ꍇ��proc.dll�����Ă���
if has("win32") || has("win64")
else
    let g:vimproc_dll_path = $VIMRUNTIME . '/autoload/proc.so'
endif

"�J�[�\���s���n�C���C�g
set cursorline
"�J�����g�E�B���h�E�ɂ̂݌r��������
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END
:hi clear CursorLine
:hi CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black

"<C-Space>��omni�⊮
imap <C-Space> <C-x><C-o>
