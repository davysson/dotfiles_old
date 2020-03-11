" Install vim-plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync


" Plugins
call plug#begin()
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'mhinz/vim-startify'                                           " Open startpage when no file is passed as argument
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }        " Generic finder and dispatcher
Plug 'Yggdroot/indentLine'                                          " Display indentation levels
Plug 'lambdalisue/suda.vim'                                         " Allows saving file as sudo
Plug 'roxma/nvim-yarp'                                              " Remote plugin framework
Plug 'tpope/vim-dispatch'                                           " Async build and test dispatcher
Plug 'preservim/nerdcommenter'                                      " Easy code commenting
Plug 'jiangmiao/auto-pairs'                                         " Automatically pair (), {}, etc
Plug 'liuchengxu/vista.vim'                                         " Viewer for LSP symbols and tags
Plug 'tpope/vim-surround'                                           " Easy surrounding
Plug 'tpope/vim-fugitive'                                           " Git integration
Plug 'airblade/vim-gitgutter'                                       " Display git status on gutter
Plug 'honza/vim-snippets'                                           " Community driven snippets
Plug 'dense-analysis/ale'                                           " Asyncronous lint engine
Plug 'itchyny/lightline.vim'                                     " Lightline plugin
Plug 'mengelbrecht/lightline-bufferline'
Plug 'maximbaz/lightline-ale'
Plug 'sheerun/vim-polyglot'                                         " Extensive language pack
Plug 'mattn/emmet-vim'                                              " Emmet for vim
Plug 'ryanoasis/vim-devicons'                                       " Adds devicons support for vim
call plug#end()

" Set default colorscheme
colorscheme challenger_deep

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
set showtabline=2                       " Always shows tabline
set guicursor=n-v-c-sm:ver25-blinkon0,i-ci-ve:ver25,r-cr-o:hor20  " Use normal cursor

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
nnoremap - <C-W><
nnoremap + <C-W>>
nnoremap = <C-W>=

" Fast saving and quitting
map <silent> <leader>w :w!<CR>
map <silent> <leader>W :w suda://%<CR>
map <silent> <leader>wq :wqa!<CR>
map <silent> <leader>q :q<CR>
map <silent> <leader>qa :qa!<CR>

" Better tab nav
"map <silent> <leader>tn :tabnew<cr>
"map <silent> <leader>to :tabonly<cr>
"map <silent> <leader>tc :tabclose<cr>
"map <silent> <leader>tm :tabmove<CR>
"map <silent> <leader>t :tabnext<CR>

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

" Use TAB to select popup menu
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


" Startify
let g:startify_custom_indices = map(range(1,100), 'string(v:val)')  " Start at index 1
let g:startify_fortune_use_unicode = 0                              " Draw fortune box using unicode
nmap <silent> <leader>s :Startify<CR>

" Clap
let g:clap_layout = { 'relative': 'editor' }                          " Center relative to the editor

nmap <silent> <leader>b :Clap buffers<CR>
nmap <silent> <leader>c :Clap colors<CR>
nmap <silent> <leader>d :Clap help_tags<CR>
nmap <silent> <leader>f :Clap filer<CR>
nmap <silent> <leader>g :Clap grep<CR>
nmap <silent> <leader>h :Clap history<CR>
nmap <silent> <leader>t :Clap tags<CR>

" Suda
let g:suda_smart_edit = 1                                           " Auto switch when you don't have permission

" Vista
let g:vista#renderer#enable_icon = 1                                  " Use symbols

" Emmet
let g:user_emmet_leader_key='<,>' " trigger emmet with leader key

" Lightline
nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)

let g:lightline#bufferline#filename_modifier = ':t'
let g:lightline#bufferline#min_buffer_count = 2
let g:lightline#bufferline#unicode_symbols =1
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#show_number  = 2
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed      = '[unnamed]'
let g:lightline#bufferline#composed_number_map = {
\ 1:  '⑴ ', 2:  '⑵ ', 3:  '⑶ ', 4:  '⑷ ', 5:  '⑸ ',
\ 6:  '⑹ ', 7:  '⑺ ', 8:  '⑻ ', 9:  '⑼ ', 10: '⑽ ',
\ 11: '⑾ ', 12: '⑿ ', 13: '⒀ ', 14: '⒁ ', 15: '⒂ ',
\ 16: '⒃ ', 17: '⒄ ', 18: '⒅ ', 19: '⒆ ', 20: '⒇ '}

let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_infos = "\uf129"
let g:lightline#ale#indicator_warnings = "\uf071"
let g:lightline#ale#indicator_errors = "\uf05e"
let g:lightline#ale#indicator_ok = "\uf00c"

let g:lightline = { 'colorscheme': 'challenger_deep'}
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}

let g:lightline.component_expand = {
      \  'buffers': 'lightline#bufferline#buffers',
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_infos': 'lightline#ale#infos',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

let g:lightline.component_type = {
      \     'buffers': 'tabsel',
      \     'linter_checking': 'right',
      \     'linter_infos': 'right',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'right',
      \ }

let g:lightline.active = {
      \   'left': [ [ 'mode', 'paste' ], [ 'gitbranch', 'filename' ] ],
      \   'right': [
      \    [ 'lineinfo' ], [ 'percent' ], [ 'fileformat', 'fileencoding', 'filetype' ],
      \   [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ]]
      \}

" ALE
highlight ALEWarning ctermbg=DarkMagenta

let g:ale_fix_on_save = 1                                                 " Run fixer when saving files
let g:ale_set_signs = 0                                                   " Don't use the sign column/gutter for ALE
let g:ale_lint_on_text_changed = 'normal'                                 " Lint always in Normal Mode
let g:ale_lint_on_insert_leave = 1                                          " Lint when leaving Insert Mode but don't lint when in Insert Mode
let g:ale_lint_delay = 0                                                  " Set ALE's 200ms delay to zero
let g:ale_completion_enabled = 1                                        " Use ale for autocomplete

" Set colors for marked lines to sane, readable combinations
au VimEnter,BufEnter,ColorScheme *
  \ exec "hi! ALEInfoLine
    \ guifg=".(&background=='light'?'#808000':'#538b97')."
    \ guibg=".(&background=='light'?'#ffff00':'#555500') |
  \ exec "hi! ALEWarningLine
    \ guifg=".(&background=='light'?'#808000':'#ffb86c')."
    \ guibg=".(&background=='light'?'#ffff00':'#996e40') |
  \ exec "hi! ALEErrorLine
    \ guifg=".(&background=='light'?'#ff0000':'#ff5555')."
    \ guibg=".(&background=='light'?'#ffcccc':'#993333')

let g:ale_linters_explicit = 1                                          " Only run linters named in ale_linters settings.

" prefered linters
let g:ale_linters = {
\   'javascript': ['eslint', 'tsserver'],
\   'typescript': ['eslint', 'tsserver'],
\   'python': ['pylint', 'pyls'],
\   'rust': ['cargo', 'rls'],
\   'go': ['gofmt', 'gopls']
\}

" prefered fixers
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'eslint'],
\   'go': ['gofmt'],
\   'rust': ['rustfmt'],
\   'python': ['yapf'],
\}
