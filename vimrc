"-----vundle-------------{{{
call plug#begin('~/.vim/plugged')

" smart comment
Plug 'scrooloose/nerdcommenter'

Plug 'scrooloose/nerdtree'
Plug 'qpkorr/vim-bufkill'

Plug 'pseewald/vim-anyfold'

"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'powerline/powerline'

" faster grep
Plug 'rking/ag.vim'

" colorschemes
"Plug 'tomasr/molokai'
Plug 'vim-scripts/xoria256.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'dylanaraps/wal.vim'

Plug 'elzr/vim-json'

" chech syntax on the fly
"Plug 'scrooloose/syntastic'

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" lisp related
Plug 'kien/rainbow_parentheses.vim'
"Plug 'vim-scripts/paredit.vim', { 'for': 'clojure' }
"Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
"Plug 'tpope/vim-leiningen', { 'for': 'clojure' }
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
"Plug 'jpalardy/vim-slime', { 'for': 'clojure' }

" haskell
"Plug 'Shougo/vimproc.vim', { 'for': 'haskell' }
"Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }
"Plug 'majutsushi/tagbar', { 'for': 'haskell' }

" latex integration
"Plug 'LaTeX-Box-Team/LaTeX-Box', { 'for': 'latex' }

" other lang support
"Plug 'vim-scripts/groovy.vim', { 'for': 'groovy' }
"Plug 'rust-lang/rust.vim', { 'for': 'rust' }

" other stuff
Plug 'kana/vim-textobj-user'
"Plug 'tpope/vim-classpath'
"Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tmux-plugins/vim-tmux-focus-events'

Plug 'ajh17/VimCompletesMe'

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

"set clipboard^=unnamed   " yanks go on clipboard instead
"set unnamedplus^=unnamed
set complete=.,w,b,u,U  " better complete options to speed it up

set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backup
set directory=~/.vim/swap
set undodir=~/.vim/undo
set viminfo+=n~/.vim/viminfo

" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list

set mouse=a
"set noesckeys

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
set foldmethod=syntax
set foldopen=search,block,hor,mark,percent,quickfix,tag

"autocmd Filetype * AnyFoldActivate
"let g:anyfold_fold_comments=1
"set foldlevel=0
"hi Folded term=NONE cterm=NONE
"hi Folded term=underline
"let g:anyfold_fold_display=0
"set foldclose=all

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
set shortmess=a

if has('gui_running')
    let g:solarized_termcolors=256
    set background=dark
    colorscheme wal
else
    "let g:solarized_termcolors=256
    "set background=light
    "colorscheme solarized
    colorscheme wal
endif
set laststatus=2        " last windows always have status line
set guicursor+=a:blinkon0

"-----ruler--------------
"set ruler               " ruler on
"------------------------}}}
"-----key-mapping--------{{{
let mapleader="\<space>"

nnoremap <leader>w  :w<CR>
nnoremap <leader>q  :qall!<CR>
nnoremap <leader>e  :Files<CR>
nnoremap <leader>b  :Buffers<CR>
nnoremap <leader>m  :make<CR>
nnoremap <leader>cn :cn<CR>
nnoremap <leader>cp :cp<CR>
nnoremap <leader>k  :bn<CR>:bd#<CR>
nnoremap <leader>x  :xa<CR>
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
nnoremap <leader>l  :Lines<CR>
nnoremap <leader>n  :set number!<CR><Esc>
nnoremap <leader>W  :w !sudo tee % > /dev/null<CR>
nnoremap <leader>t  :NERDTreeToggle<CR>
nnoremap <leader>d  :BD<CR>

" poor man's zen mode?
let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
        set nolist
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
        set list
    endif
endfunction
nnoremap <silent> <leader>l :call ToggleHiddenAll()<CR>

"-----swap ; and : ------
nnoremap ; :
nnoremap : ;

vnoremap ; :
vnoremap : ;

"-----work with buffers--
"nnoremap <silent> <C-o> :b#<CR>
"nnoremap <silent> <C-n> :bn<CR>
"nnoremap <silent> <C-p> :bp<CR>

"-----work with tabs--
nnoremap <silent> <C-h> :tabprev<CR>
nnoremap <silent> <C-l> :tabnext<CR>

"-----work with wrapped lines
nnoremap <silent> j gj
nnoremap <silent> k gk

"-----search and center--
nnoremap n nzz

nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

nnoremap <CR> :nohlsearch<CR>/<BS>

noremap H ^
noremap L $
"------diff--------------
noremap ]] ]c
noremap [[ [c

noremap <silent> <leader>2 :diffget 2<CR> :diffupdate<CR>
noremap <silent> <leader>3 :diffget 3<CR> :diffupdate<CR>
noremap <silent> <leader>4 :diffget 4<CR> :diffupdate<CR>
noremap <silent> <leader>u :diffput<CR> :diffupdate<CR>

"-----plugins shortcuts--
"-----trail whitespaces--
nnoremap <F8> :%s///g<CR>
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
"map <silent> <Leader>h :Errors<CR>
"map <Leader>s :SyntasticToggleMode<CR>

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

"-----php----------------
autocmd BufRead *.php nnoremap <leader>r :!php %<CR>

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
