" Plugins -------------

call plug#begin()
" General -------------
Plug 'mhinz/vim-startify'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'dense-analysis/ale'
Plug 'preservim/nerdcommenter'
Plug 'sbdchd/neoformat'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'sheerun/vim-polyglot'

" HTML/CSS ------------
Plug 'mattn/emmet-vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'ap/vim-css-color'

" Javascript ----------
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

" Typescript ----------

" Python -------------
Plug 'zchee/deoplete-jedi'

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
set cmdheight=2                         " give some space to display messages
set updatetime=300                      " less delay and better user experience
set shortmess+=c                        " don't pass message to |ins-completion-menu|
set signcolumn=yes                      " always show the signcolumn

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

" enable true colors
if (has("termguicolors"))
  set termguicolors
endif

" add numbers
set number
set numberwidth=5

" disable arrows
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" startify

" airline
let g:airline_theme='base16_twilight'
let g:airline_powerline_fonts=1

" nerdcommenter

" nerdtree
map <leader>n :NERDTreeToggle<CR>

" deoplete
let g:deoplete#enable_at_startup = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif " autocloses preview window
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>" " navegates preview using <TAB>

" ALE
let b:ale_linters = ['flake8', 'pylint']
" Fix Python files with autopep8 and yapf.
let b:ale_fixers = ['autopep8', 'yapf']
" Disable warnings about trailing whitespace for Python files.
let b:ale_warn_about_trailing_whitespace = 0

" Emmet
let g:user_emmet_leader_key=',' " trigger emmet with leader key
