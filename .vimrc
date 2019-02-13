set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'w0rp/ale'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'HerringtonDarkholme/yats.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'ap/vim-buftabline'
Plugin 'briancollins/vim-jst'
Plugin 'jceb/vim-orgmode'
call vundle#end()

" File related
set encoding=utf-8
filetype plugin on
filetype indent on
filetype on
syntax on
set endofline
" Ignore some common dir and binary files
set wildignore+=.git/*,*/log/*,*/node_modules/*,*/tmp/*,*.rbc,*.pyc,*/flow-typed/*
" Ignore files in .gitignore
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Ruler related
set ruler
set rulerformat=%l\:%c
set number
set textwidth=80   " Width of doc
set relativenumber

" Search related
set incsearch
set ignorecase
set smartcase
set hlsearch

" UI related
set guifont=Consolas:h14
colorscheme OceanicNext
set wildmenu
set wildmode=longest,list
" Always show sign column for linters so that the UI does not jump
set signcolumn=yes
" Show editing mode
set showmode
" Always show status line
set laststatus=2
" let g:airline#extensions#tabline#enabled = 1
let g:lightline = {
  \ 'active': {
  \   'left': [['mode', 'paste'],
  \            ['gitbranch', 'readonly', 'filename', 'modified']]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'fugitive#head'
  \ },
  \ }
set guioptions=

" Window related
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

" Buffer
set hidden

" Key mapping
nnoremap <C-L> :bnext<CR>
nnoremap <C-H> :bprev<CR>
nnoremap <C-x> :bd<CR>
let mapleader=","
"----------------Force to not use arrow keys----------------
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
"Press jj twice to goto normal mode
imap jj <ESC>
inoremap <C-s> <Esc>:w<CR>a
vmap <C-s> <Esc>:w<CR>gv

"No need to do shift + ; to write command
nnoremap ; :
"Quit vim
inoremap <C-q> <Esc>:qa<CR>
nnoremap <C-q> :qa<CR>

"Find shortcut
inoremap <C-f> <Esc>/
nnoremap <C-f> /
" inoremap <C-S-f> <Esc>%
" nnoremap <C-S-f> %
"Undo
inoremap <C-z> <Esc>:undo<CR>i
nnoremap <C-z> :undo<CR>
"Use SPACEBAR to fold/unfold
nnoremap <space> za
"Clear last highlighted search
nnoremap <leader><space> :noh<CR>
" Find current file in the directory tree
map <leader>r :NERDTreeFind<CR>
map <C-b> :NERDTreeToggle<CR>
"--------------------------Indentation-----------------------------
set autoindent
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis

" make "tab" insert indents instead of tabs at the beginning of a line
set smarttab

" always uses spaces instead of tab characters
set expandtab

" Automatically indent when adding a curly bracket, etc.
set smartindent
" Show cursor position
set cursorline

" Basic mouse behavior
set mouse=a
if exists('$TMUX')
    set ttymouse=xterm2
endif

" Startup
" autocmd vimenter * NERDTree


" Temp files
set noswapfile
set nobackup
set nowb

" Linter settings
let g:ale_completion_enabled = 1
let g:javascript_plugin_flow = 1
let g:ale_linters = {
\ 'javascript': ['eslint', 'flow'],
\ 'typescript': ['tsserver'],
\}

highlight clear ALEErrorSign
highlight clear ALEWarningSign
nmap <silent> <leader>aj :ALENext<cr>
nmap <silent> <leader>ak :ALEPrevious<cr>