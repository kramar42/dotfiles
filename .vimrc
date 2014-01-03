"-----vundle---------------------{{{
filetype off            " required by vundle
set rtp+=~/.vim/bundle/vundle/  " setup vundle dir
call vundle#rc()        " call vundle init

Bundle 'gmarik/vundle'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'tomasr/molokai'
Bundle 'vim-scripts/paredit.vim'
Bundle 'vim-scripts/xoria256.vim'
"--------------------------------}}}"
"-----general------------{{{
set nocompatible        " be iMproved
filetype plugin indent on
set backspace=indent,eol,start

"-----encoding-----------
set encoding=utf8
set termencoding=utf-8
set fileencodings=utf8

set hidden              " put in bg without problems
set history=256         " number of things to remember in history
set nostartofline       " don't go to the start of the line after some commands
set timeoutlen=250      " time to wait after ESC
set clipboard+=unnamed  " yanks go on clipboard instead
set complete=.,w,b,u,U  " better complete options to speed it up

"-----disable-trash-files
set nobackup
set noswapfile
set nowritebackup
"------------------------}}}
"-----editing------------{{{
"-----search-------------
set hlsearch        " highlight search
set wrapscan        " wrap around end of file
set smartcase       " case sensetive is Capital letter
set incsearch       " show matches while typing
set ignorecase      " case insensitive
set tildeop "~"     " behave tilda like an motion
"------------------------}}}
"-----formatting---------{{{
"-----folding------------
set foldenable          " turn on folding
set foldlevel=10        " don't autofold
set foldmethod=marker   " fold on markers only
set foldopen=search,block,hor,mark,percent,quickfix,tag

"-----set-tab-behavior---
set tabstop=4       " default tab - 4 spaces
set expandtab       " expand tab to spaces
set smarttab        " smart inset tab if editing in fron of a line
set shiftwidth=4    " default shift width for indents
set softtabstop=4   " number of spaces for Tab if editing thng

"-----indent-------------
set cindent         " set C indenting rules
set smartindent     " smart autoindent when starting new line

"-----scroll-behavior----
set scrolloff=2     " 2 lines above and below of cursor
set scrolljump=1    " jump by one line

"-----wrapping-----------
set nowrap
set textwidth=0     " don't wrap lines by default
"------------------------}}}
"-----visual-------------{{{
syntax on
set nonumber        " line numbers off
set lazyredraw      " no redraw while executing thng
set showmatch       " show matching brackets
set matchtime=2     " bracket blinking
set noshowcmd       " don't show current command
set noshowmode      " we have an app for that

"-----disable-bells------
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
"------------------------}}}
"-----editor-view----------------{{{
set t_Co=256                " 256 terminal colors
set wildmenu                " command-line completion menu
set guioptions=acef         " autoselect,console dialogs,graphical tabs
                            " don't fork(),right-hand scrollbar
colorscheme molokai
set laststatus=2            " last windows always have status line
set guicursor+=a:blinkon0   " disable cursor blinking

"-----ruler----------------------
set ruler                   " ruler on
"--------------------------------}}}
"-----key-mapping----------------------{{{
let mapleader=","

nnoremap <leader>w  :w<CR>
nnoremap <leader>q  :q<CR>
nnoremap <leader>e  :e 
nnoremap <leader>b  :b 
nnoremap <leader>m  :make<CR>
nnoremap <leader>cn :cn<CR>
nnoremap <leader>cp :cp<CR>
nnoremap <leader>k  :bn<CR>:bd#<CR>
nnoremap <leader>x  :x<CR>
nnoremap <leader>,  :bp<CR>
nnoremap <leader>.  :bn<CR>
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

"-----swap ; and : --------------------
nnoremap ; :
nnoremap : ;

vnoremap ; :
vnoremap : ;

"-----work with buffers----------------
nnoremap <silent> <C-o> :b#<CR>
nnoremap <silent> <C-n> :bn<CR>
nnoremap <silent> <C-p> :bp<CR>

"-----work with windows----------------
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l

"-----C-c & C-v uses global buffer-----
vmap <C-C> <esc> "+yi
imap <C-V> <esc> "+gPi

"-----clear the search highlight-------
nnoremap <silent> <Esc><Esc> :nohlsearch<CR><Esc>

"-----go to end/start of line easier---
noremap H ^
noremap L $

"-----plugins shortcuts----------------
nnoremap <C-t> :NERDTreeToggle<CR>

"-----trail whitespaces----------------
nnoremap <F9> :%s/\s\+$//e<CR>

"--------------------------------------}}}
"-----autocommands-----{{{
set autoread
set autowrite

"-----autoreload .vimrc-
autocmd! bufwritepost .vimrc source %

"-----gist--------------
let g:gist_get_multiplefile=1

"-----color column------
highlight ColorColumn ctermbg=3 ctermfg=9
call matchadd('ColorColumn', '\%81v', 100)

"-----rainbow_parentheses--
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"-----python autocommands--
autocmd BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
autocmd BufRead *.py nnoremap <leader>r :!python %<CR>
"----------------------}}}

