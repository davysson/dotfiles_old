" Plugins

call plug#begin()
Plug 'mhinz/vim-startify'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'dense-analysis/ale'
Plug 'preservim/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

let mapleader = ','                     " use , as leader

set encoding=utf-8                      " set default encoding to UTF-8

set noerrorbells                        " no beeps
set backspace=indent,eol,start          " better backspace
set nobackup                            " no backup files
set nowritebackup
set noswapfile                          " no swap files
set autowrite                           " automatically save before commands
set autoread                            " automatically reread changed files

set splitbelow                          " horizontal split always bellow current window
set splitright                          " vertical split always to the right of current window

set history=50                          " save the last 50 commands
set ruler                               " show the cursor position all the time
set showcmd                             " show what is being typed
set noshowmode                          " don't show current mode ( use airline)
set laststatus=2                        " last window always has status line
set modelines=0
set nomodeline
set hidden                              " buffer becomes hidden when abandoned

syntax on                               " syntax is always on
set nocursorcolumn
set nocursorline

set fileformats=unix,dos,mac            " prefer unix file formats

set incsearch                           " show matchs while typing
set hlsearch                            " highlight found searches
set ignorecase                          " search case insensitive
set smartcase                           " case sensitive when pattern uses upper case

" use soft tabs
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set nojoinspaces

" add numbers
set number
set numberwidth=5

" disable arrows
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>


" better window movements
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" airline
let g:airline_theme='base16_twilight'
let g:airline_powerline_fonts=1

" nerdcommenter

" nerdtree
map <leader>n :NERDTreeToggle<CR>

" tagbar
