"-----vundle---------------------{{{
set nocompatible		" be iMproved
filetype off			" required by vundle

set rtp+=~/.vim/bundle/vundle/	" setup vundle dir
call vundle#rc()		" call vundle init

Bundle 'gmarik/vundle'
Bundle 'vim-scripts/L9'
Bundle 'Lokaltog/vim-powerline'
Bundle 'vim-scripts/FuzzyFinder'
Bundle 'vim-scripts/xoria256.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'tomasr/molokai'
Bundle 'jceb/vim-orgmode'
Bundle 'altercation/vim-colors-solarized'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'vim-scripts/paredit.vim'
Bundle 'mattn/gist-vim'
Bundle 'mattn/webapi-vim'
"--------------------------------}}}"
"-----general------------{{{
filetype plugin indent on
set backspace=indent,eol,start

"-----encoding-----------
set encoding=utf8
set termencoding=utf-8
set fileencodings=utf8

set hidden		        " put in bg without problems
set history=256		    " number of things to remember in history
set nostartofline       " don't go to the start of the line after some commands
set timeoutlen=250	    " time to wait after ESC
set clipboard+=unnamed	" yanks go on clipboard instead
set complete=.,w,b,u,U 	" better complete options to speed it up
"-----disable-trash-files
set nobackup
set noswapfile
set nowritebackup
set directory=/tmp//
"------------------------}}}
"-----editing------------{{{
"-----search-------------
set hlsearch		" highlight search
set wrapscan		" wrap around end of file
set smartcase		" case sensetive is Capital letter
set incsearch		" show matches while typing
set ignorecase		" case insensitive
set tildeop "~" 	" behave tilda like an motion
"------------------------}}}
"-----formatting---------{{{
"-----folding------------
set foldenable		    " turn on folding
set foldlevel=10	    " don't autofold
set foldmethod=marker	" fold on markers only
set foldopen=search,block,hor,mark,percent,quickfix,tag

"-----set-tab-behavior---
set tabstop=4		" default tab - 4 spaces
set expandtab		" expand tab to spaces
set smarttab		" smart inset tab if editing in fron of a line
set shiftwidth=4	" default shift width for indents
set softtabstop=4	" number of spaces for Tab if editing thng

"-----indent-------------
set cindent		    " set C indenting rules
set smartindent		" smart autoindent when starting new line

"-----scroll-behavior----
set scrolloff=2		" 2 lines above and below of cursor
set scrolljump=1	" jump by one line

"-----wrapping-----------
set nowrap
set textwidth=0		" don't wrap lines by default
"------------------------}}}
"-----visual-------------{{{
syntax on
set nonumber		" line numbers off
set lazyredraw		" no redraw while executing thng
set showmatch		" show matching brackets
set matchtime=2		" bracket blinking
set noshowcmd       " don't show current command
set noshowmode      " we have an app for that

"-----disable-bells------
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
"------------------------}}}
"-----editor-view----------------{{{
set t_Co=256 			    " 256 terminal colors
set wildmenu 			    " command-line completion menu
set guioptions=			    " get out gui
set cpoptions+= 		    " set "$" as period in CHANGE command
set background=dark
colorscheme solarized
set laststatus=2 		    " last windows always have status line
set guicursor+=a:blinkon0	" disable cursor blinking

"-----ruler----------------------
set ruler			        " ruler on
if exists('+colorcolumn')
	"set colorcolumn=80	    " ruler on 80 column
endif
"--------------------------------}}}
"-----key-mapping----------------------{{{
let mapleader=","

"-----swap ; and : --------------------
nnoremap ; :
nnoremap : ;

"-----work with buffers----------------
nnoremap <silent> <C-o> :b#<CR>
nnoremap <silent> <C-n> :bn<CR>
nnoremap <silent> <C-p> :bp<CR>
nnoremap <silent> <leader>c :bn<CR>:bd#<CR>

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
"--------------------------------------}}}
"-----autocommands-----{{{
set autoread
set autowrite

au WinEnter * set nocursorline nocursorcolumn
"au BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')

"-----gist--------------
let g:gist_get_multiplefile=1

"-----rainbow_parentheses--
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
"----------------------}}}
