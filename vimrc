"-----vundle-------------{{{
call plug#begin('~/.vim/plugged')

" smart comment
Plug 'scrooloose/nerdcommenter'

" faster grep
Plug 'rking/ag.vim'

" colorschemes
Plug 'tomasr/molokai'
Plug 'vim-scripts/xoria256.vim'
Plug 'altercation/vim-colors-solarized'

" chech syntax on the fly
Plug 'scrooloose/syntastic'

" superb auto-complete
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

" fuzzy searche everywhere
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" lisp related
Plug 'kien/rainbow_parentheses.vim'
Plug 'vim-scripts/paredit.vim', { 'for': 'clojure' }
Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
Plug 'tpope/vim-leiningen', { 'for': 'clojure' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" haskell
Plug 'Shougo/vimproc.vim', { 'for': 'haskell' }
Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }
Plug 'majutsushi/tagbar', { 'for': 'haskell' }

" latex integration
Plug 'LaTeX-Box-Team/LaTeX-Box', { 'for': 'latex' }

" other lang support
Plug 'vim-scripts/groovy.vim', { 'for': 'groovy' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

" other stuff
Plug 'kana/vim-textobj-user'
Plug 'tpope/vim-classpath'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'jpalardy/vim-slime'

call plug#end()

"------------------------}}}"
"-----general------------{{{
set nocompatible        " be iMproved
filetype plugin indent on
set backspace=indent,eol,start
set shell=bash

"-----encoding-----------
set encoding=utf8
set termencoding=utf-8
set fileencodings=utf8

set hidden              " put in bg without problems
set history=256         " number of things to remember in history
set nostartofline       " don't go to the start of the line after some commands
set timeoutlen=250      " time to wait after ESC
set ttyfast

set clipboard=unnamed   " yanks go on clipboard instead
set complete=.,w,b,u,U  " better complete options to speed it up

set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set undodir=~/.vim/undo

" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list

set mouse=a
set noesckeys

"------------------------}}}
"-----editing------------{{{
"-----search-------------
set hlsearch            " highlight search
set wrapscan            " wrap around end of file
set smartcase           " case sensetive is Capital letter
set incsearch           " show matches while typing
set ignorecase          " case insensitive
set tildeop             " behave tilda like an operator
"------------------------}}}
"-----formatting---------{{{
"-----folding------------
set foldenable          " turn on folding
set foldlevel=1         " don't autofold
set foldmethod=marker   " fold on markers only
set foldopen=search,block,hor,mark,percent,quickfix,tag

"-----set-tab-behavior---
set tabstop=4           " default tab - 4 spaces
set expandtab           " expand tab to spaces
set smarttab            " smart inset tab if editing in fron of a line
set shiftwidth=4        " default shift width for indents
set softtabstop=4       " number of spaces for Tab if editing thng

"-----indent-------------
set cindent             " set C indenting rules
set smartindent         " smart autoindent when starting new line

"-----scroll-behavior----
set scrolloff=2         " 2 lines above and below of cursor
set scrolljump=1        " jump by one line

"-----wrapping-----------
set nowrap
set linebreak
"------------------------}}}
"-----visual-------------{{{
syntax on
set nonumber            " line numbers off
set lazyredraw          " no redraw while executing thng
set showmatch           " show matching brackets
set matchtime=2         " bracket blinking
set noshowcmd           " don't show current command
set noshowmode          " we have an app for that

" Don’t show the intro message when starting Vim
set shortmess=atI
set grepprg=ag

"-----disable-bells------
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
"------------------------}}}
"-----editor-view--------{{{
set t_Co=256            " 256 terminal colors
set wildmenu            " command-line completion menu
set guioptions=acef     " autoselect,console dialogs,graphical tabs
                        " don't fork(),right-hand scrollbar

if has('gui_running')
    let g:solarized_termcolors=256
    set background=dark
    colorscheme solarized
else
    set background=dark
    colorscheme xoria256
endif
set laststatus=2        " last windows always have status line
set guicursor+=a:blinkon0

"-----ruler--------------
set ruler               " ruler on
"------------------------}}}
"-----key-mapping--------{{{
let mapleader=","

nnoremap <leader>w  :w<CR>
nnoremap <leader>q  :q<CR>
nnoremap <leader>e  :Files<CR>
nnoremap <leader>b  :Buffers<CR>
nnoremap <leader>m  :make<CR>
nnoremap <leader>cn :cn<CR>
nnoremap <leader>cp :cp<CR>
nnoremap <leader>k  :bn<CR>:bd#<CR>
nnoremap <leader>x  :x<CR>
nnoremap <leader>,  :bp<CR>
nnoremap <leader>.  :bn<CR>
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
nnoremap <leader>l  :Lines<CR>
nnoremap <leader>n  :set number!<CR><Esc>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

"-----swap ; and : ------
nnoremap ; :
nnoremap : ;

vnoremap ; :
vnoremap : ;

"-----work with buffers--
nnoremap <silent> <C-o> :b#<CR>
nnoremap <silent> <C-n> :bn<CR>
nnoremap <silent> <C-p> :bp<CR>

"-----work with wrapped lines
nnoremap <silent> j gj
nnoremap <silent> k gk

"-----work with windows--
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l

nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

nnoremap <CR> :nohlsearch<CR>/<BS>

noremap H ^
noremap L $

"-----plugins shortcuts--
"-----trail whitespaces--
nnoremap <F9> :%s/\s\+$//e<CR>

"------------------------}}}
"-----autocommands-------{{{
set autoread
set autowrite

"-----autoreload .vimrc--
autocmd! bufwritepost .vimrc source %

"-----gist---------------
let g:gist_get_multiplefile=1

"-----color column-------
highlight ColorColumn ctermbg=3 ctermfg=9
call matchadd('ColorColumn', '\%81v', 100)

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"-----syntastic----------
map <silent> <Leader>h :Errors<CR>
map <Leader>s :SyntasticToggleMode<CR>

let g:syntastic_auto_loc_list=1

"-----json highlighting--
au BufNewFile,BufRead *.json set ft=javascript

"-----python-------------
autocmd BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
autocmd BufRead *.py nnoremap <leader>r :!python %<CR>

" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType erlang set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

"-----clojure------------
autocmd BufRead *.clj nnoremap <leader>r :%Eval<CR>

"-----groovy-------------
autocmd BufRead *.groovy nnoremap <leader>r :!groovy %<CR>

"-----latex--------------
autocmd BufRead *.tex nnoremap <leader>r :Latexmk<CR>
"let g:LatexBox_latexmk_preview_continuously=1
"let g:LatexBox_latexmk_async=1

"------markdown----------
function! MarkdownLevel()
    let h = matchstr(getline(v:lnum), '^#\+')
    if empty(h)
        return "="
    else
        return ">" . len(h)
    endif
endfunction
au BufEnter *.md setlocal foldexpr=MarkdownLevel()  
au BufEnter *.md setlocal foldmethod=expr
"------------------------}}}