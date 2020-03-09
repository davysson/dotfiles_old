" Leader
let mapleader = ','                     " use , as leader

" Encoding
set encoding=utf-8                      " set default encoding to UTF-8
set fileformats=unix,dos,mac            " prefer unix file formats
set formatoptions-=cro                  " Disable autocommenting new lines

" Errors
set noerrorbells                        " no beeps
set novisualbell                        " Turn off visual bell
set visualbell t_vb=                    " Turn off error beep/flash
set t_vb=                               " Visual bell doddooes nothing

" File & Buffers
set nobackup                            " no backup files
set nowritebackup                       " no write backup
set noswapfile                          " no swap files
set autowrite                           " automatically save before commands
set autoread                            " automatically reload changed files
au FocusGained,BufEnter * checktime     " Autocheck buffer when switching buffer or focusing
set hidden                              " buffer becomes hidden when abandoned
set nomodeline                          " Disable modeline
set pastetoggle=<F2>                    " Paste data without autoindent

" Windows and Tabs
set splitbelow                          " Vertical splits always below
set splitright                          " Horizontal splits always to the right
set laststatus=2                        " last window always has status line

" Movement
set scrolloff=10                        " Always keep 10 lines below or above when scrolling

" Display
syntax on                               " syntax is always on
set termguicolors                       " Enable support for 24-bit colors
set title                               " display file status on terminal title
set ruler                               " show the cursor position all the time
set number                              " Show line numbers
set showcmd                             " show what is being typed
set showmatch                           " Show matching brackets
set lazyredraw                          " Don't redraw while executing macros (good performance config)
set nowrap                              " Don't wrap lines
set noshowmode                          " don't show current mode ( use airline)
set nocursorcolumn                      " Don't display current cursor column 
set colorcolumn=120                     " HIghlight column 120
set cursorline                          " Highlight current line
set numberwidth=5                       " Width in columns of the gutter
set signcolumn=yes                      " always show the signcolumn
set cmdheight=2                        " Number of lines below statusline

" Search
set incsearch                           " show matchs while typing
set hlsearch                            " highlight found searches
set ignorecase                          " search case insensitive
set smartcase                           " case sensitive when pattern uses upper case
set magic                               " Always use magic for patterns
set gdefault                            " Applies substitution globally on lines

" Selection
set selection=inclusive                 " Last selected character is included

"Tab
set expandtab                           " Expand tabs to spaces
set smarttab                            " Insert 'shiftwidth' spaces when at the start of a line
set shiftround                          " Round indentation to multiples of shiftwidth
set tabstop=2                           " Number of spaces a tab counts for
set softtabstop=2                       " Number of spaces a tab counts for while editing

" indentation
set autoindent                          " auto indent new lines
set copyindent                          " copy previous indentation on autoindent
set smartindent                         " smart indent new lines
set shiftwidth=2                        " number of spaces to use as indentation

" filetype
filetype on                             " enable filetype detection
filetype plugin on                      " enable loading filetype plugins
filetype indent on                      " enable loading filetype indentation

" misc
autocmd! bufenter * if &ft ==# 'help' | wincmd L | endif " Open help on vertical split
set backspace=indent,eol,start          " better backspace
set updatetime=300                      " less delay and better user experience
set shortmess+=c                        " don't pass message to |ins-completion-menu|
set history=50                          " save the last 50 commands
set timeoutlen=500
set nojoinspaces
set whichwrap+=h,l                          " Allow h,j to go to next line
set clipboard=unnamedplus                 " Use system clipboard

" Remap VIM 0 to first non-blank character
map 0 ^

" Disable pattern highlight with return
nnoremap <silent><CR> :nohlsearch<CR><CR>

" better split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <silent> <M-j> mz:m+<cr>`z
nmap <silent> <M-k> mz:m-2<cr>`z
vmap <silent> <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" split creation
nnoremap <silent> <S-L> :vsplit<CR>
nnoremap <silent> <S-J> :split<CR>

" Split creates new file
nnoremap <silent> <S-H> :vnew<CR>
nnoremap <silent> <S-K> :new<CR>

" Split resize
nnoremap < <C-W>< 
nnoremap > <C-W>>

" Fast saving and quitting
map <silent> <leader>w :w!<CR>
map <silent> <leader>W :w suda://%<CR>
map <silent> <leader>wq :wqa!<CR>
map <silent> <leader>q :q<CR>
map <silent> <leader>qa :qa!<CR>

" Better tab nav
map <silent> <leader>tn :tabnew<cr>
map <silent> <leader>to :tabonly<cr>
map <silent> <leader>tc :tabclose<cr>
map <silent> <leader>tm :tabmove<CR>
map <silent> <leader>t :tabnext<CR>

" Reload config
map <silent> <leader>r :so %<CR>

" Disable arrows
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Bash like keys for the command line
cnoremap <C-A>		<Home>
cnoremap <C-E>		<End>
cnoremap <C-K>		<C-U>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" Use tab for completion
inoremap <silent> <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <silent> <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent> <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

" Plugins 
call plug#begin()
Plug 'dracula/vim', { 'as': 'dracula' }                             " Dracula theme
Plug 'mhinz/vim-startify'                                           " Open startpage when no file is passed as argument
Plug 'lambdalisue/suda.vim'                                         " Allows saving file as sudo
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }         " UI for vim
Plug 'preservim/nerdcommenter'                                      " Easy code commenting
Plug 'jiangmiao/auto-pairs'                                         " Automatically pair (), {}, etc
Plug 'majutsushi/tagbar'                                            " Tag bar panel
Plug 'tpope/vim-surround'                                           " Easy surrounding
Plug 'tpope/vim-fugitive'                                           " Git integration
Plug 'airblade/vim-gitgutter'                                       " Display git status on gutter
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }             " Code completion engine for vim
Plug 'SirVer/ultisnips'                                             " Snippets engine
Plug 'honza/vim-snippets'                                           " Community driven snippets
Plug 'dense-analysis/ale'                                           " Asyncronous lint engine
Plug 'sbdchd/neoformat'                                             " Code formating
Plug 'vim-airline/vim-airline'                                      " Better status line
Plug 'sheerun/vim-polyglot'                                         " Extensive language pack
Plug 'mattn/emmet-vim'                                              " Emmet for vim
Plug 'ryanoasis/vim-devicons'                                       " Adds devicons support for vim
call plug#end()

" Set default colorscheme
colorscheme dracula

" Startify
let g:startify_custom_indices = map(range(1,100), 'string(v:val)')  " Start at index 1
nmap <leader>o :Startify<CR>

" Ultisnip
let g:UltiSnipsExpandTrigger='<c-space>'
let g:UltiSnipsJumpForwardTrigger='<c-j>'
let g:UltiSnipsJumpBackwardTrigger='<c-k>'


" Tagbar
let g:tagbar_width=42
"autocmd BufEnter * nested :call tagbar#autoopen(0)
"autocmd BufWinLeave *.py :TagbarClose

" Airline
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1

" ALE
let b:ale_linters = ['flake8', 'pylint']
let b:ale_fixers = ['autopep8', 'yapf']
let b:ale_warn_about_trailing_whitespace = 0

" Emmet
let g:user_emmet_leader_key='<,>' " trigger emmet with leader key

" Denite
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction

nmap <silent> ;; :Denite buffer file/rec -split=floating -winrow=1<CR>
nmap <silent> ;b :Denite buffer -split=floating -winrow=1<CR>
nmap <silent> ;c :Denite colorscheme -split=floating -winrow=1<CR>
nmap <silent> ;f :Denite file/rec -split=floating -winrow=1<CR>
nmap <silent> ;g :Denite grep -split=floating -winrow=1<CR>
nmap <silent> ;d :Denite directory_rec -split=floating -winrow=1<CR>
nmap <silent> ;h :Denite help -split=floating -winrow=1<CR>
