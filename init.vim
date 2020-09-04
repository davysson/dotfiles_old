" Autoinstall vim-plug
no Install vim-plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync
endif

" Plugins
call plug#begin()
Plug 'drewtempelmeyer/palenight.vim'
Plug 'mhinz/vim-startify'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'preservim/nerdcommenter'
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'farmergreg/vim-lastplace'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'RRethy/vim-illuminate'
Plug 'jiangmiao/auto-pairs'
Plug 'liuchengxu/vista.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'dense-analysis/ale'
Plug 'vim-airline/vim-airline'
Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }
Plug 'justinmk/vim-sneak'
Plug 'psliwka/vim-smoothiej'
Plug 'sheerun/vim-polyglot'
Plug 'ryanoasis/vim-devicons'
call plug#end()

" Encoding
set formatoptions-=cro                   " Disable autocommenting new lines

" File & Buffers
set nowritebackup                        " No write backup
set noswapfile                           " No swap files
set autowrite                            " Automatically save before commands
au FocusGained,BufEnter * checktime      " Autocheck buffer when switching buffer or focusing
set hidden                               " Buffer becomes hidden when abandoned
set nomodeline                           " Disable modeline
set undodir=~/.vim/undodir               " Directory to save undo history
set undofile                             " Allow vim to persist undo between sessions

" Windows and Tabs
set splitbelow                           " Vertical splits always below
set splitright                           " Horizontal splits always to the right

" Movement
set scrolloff=10                         " Always keep 10 lines below or above when scrolling

" Display
set termguicolors                        " Enable support for 24-bit colors
set title                                " Display file name on terminal title
set number                               " Show line numbers
set lazyredraw                           " Don't redraw while executing macros (good performance config)
set nowrap                               " Don't wrap lines
set noshowmode                           " Don't show current mode ( use airline)
set colorcolumn=120                      " Highlight column 120
set cursorline                           " Highlight current line
set numberwidth=5                        " Width in columns of the gutter
set signcolumn=yes                       " Always show the signcolumn
set cmdheight=2                          " Number of lines below statusline
set guicursor=n-v-c-sm:ver25-blinkon0,i-ci-ve:ver25,r-cr-o:hor20  " Use normal cursor

" Search
set ignorecase                           " Search case insensitive
set smartcase                            " Case sensitive when pattern uses upper case

" Tab
set expandtab                            " Expand tabs to spaces
set shiftround                           " Round indentation to multiples of shiftwidth
set tabstop=2                            " Number of spaces a tab counts for
set softtabstop=2                        " Number of spaces a tab counts for while editing

" Indentation
set copyindent                           " Copy previous indentation on autoindent
set smartindent                          " Smart indent new lines
set shiftwidth=2                         " Number of spaces to use as indentation

" Filetype
filetype on                              " Enable filetype detection
filetype plugin on                       " Enable loading filetype plugins
filetype indent on                       " Enable loading filetype indentation

" Misc
autocmd! bufenter * if &ft ==# 'help' | wincmd L | endif " Open help on vertical split
set backspace=indent,eol,start           " Better backspace
set updatetime=300                       " Less delay and better user experience
set shortmess+=c                         " Don't pass message to |ins-completion-menu|
set history=100                          " Save the last 100 commands
set timeoutlen=500                       " Time to wait for a mapped sequence to complete
set whichwrap+=h,l                       " Allow h,j to go to next line
set completeopt=menu,menuone,preview,noselect,noinsert  " fix autocomplete

" Colorscheme
colorscheme palenight
"let g:lightline = { 'colorscheme': 'palenight'}
let g:airline_theme = 'palenight'
let g:palenight_terminal_italics=1
highlight Sneak guifg='#bfc7d5' guibg='#697098'
highlight SneakScope guifg='#bfc7d5' guibg='#BE5046'

" Quickfix
augroup vimrcQfClose
    autocmd!
    autocmd FileType qf if mapcheck('<esc>', 'n') ==# '' | nnoremap <buffer><silent> <esc> :cclose<bar>lclose<CR> | endif
augroup END

" Keymaps
let mapleader = ','                      " Change map leader

" Disable pattern highlight with return
nnoremap <silent> <CR> :nohlsearch<CR>

" Better split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Move a line of text using ALT+]\[
nmap <silent> <M-]> mz:m+<cr>`z
nmap <silent> <M-[> mz:m-2<cr>`z
vmap <silent> <M-]> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-[> :m'<-2<cr>`>my`<mzgv`yo`z

" Split creation
nnoremap <silent> <M-l> :vsplit<CR>
nnoremap <silent> <M-j> :split<CR>

" Split creates new file
nnoremap <silent> <M-h> :vnew<CR>
nnoremap <silent> <M-k> :new<CR>

" Split resize
nnoremap - <C-W><
nnoremap + <C-W>>
nnoremap = <C-W>=

" Fast saving and quitting
map <silent> <leader>w :w!<CR>
map <silent> <leader>wq :wqa!<CR>
map <silent> <leader>q :Sayonara<CR>
map <silent> <leader>qa :qa<CR>

" Fast file creation
map <silent> <leader>e :enew<CR>

" Bash like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" Use TAB to select popup menu
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Plugin mappings
nmap <silent> <leader>s :Startify<CR>
nmap <silent> <leader>n :NERDTreeToggle<CR>

nmap <silent> <leader>c :LeaderfCommand<CR>
nmap <silent> <leader>d :LeaderfHelp<CR>
nmap <silent> <leader>h :LeaderfMru<CR>
nmap <silent> <leader>l :LeaderfLine<CR>
nmap <silent> <leader>m :LeaderfFunction<CR>
nmap <silent> <leader>t :LeaderfTag<CR>
nmap <silent> <leader>r :Leaderf --nowrap task<CR>

nnoremap <silent> <leader>ae :ALEToggleBuffer<CR>
nnoremap <silent> <leader>af :ALEFix<CR>
nnoremap <silent> <leader>ad :ALEGoToDefinition<CR>
nnoremap <silent> <leader>at :ALEGoToTypeDefinition<CR>
nnoremap <silent> <leader>ar :ALEFindReferences<CR>
nnoremap <silent> <leader>ah :ALEHover<CR>
nnoremap <silent> <leader>as :ALESymbolSearch<CR>

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

" Startify
let g:startify_custom_indices = map(range(1,100), 'string(v:val)')
let g:startify_change_to_dir = 1
let g:startify_change_to_vcs_root = 1
let g:startify_files_number = 5
let g:startify_skiplist = ['/home/davysson/.dotfiles/*', '/home/davysson/.config/nvim/*', '/usr/share/nvim']
let g:startify_bookmarks = [{'c': '~/.dotfiles/init.vim'}, {'f': '~/.dotfiles/config.fish'}, {'r': '~/.dotfiles/tasks.ini'}, {'t': '~/.dotfiles/kitty.conf'}]
let g:startify_custom_header = ''

" LeaderF
let g:Lf_WindowPosition = 'popup'

" Nerdtree
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeWinSize = 25
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1

" Coc
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

" Vista
let g:vista#renderer#enable_icon = 1

" Illuminate
hi illuminatedWord cterm=underline gui=underline

" Asyntask
let g:asyncrun_open = 6

function! s:lf_task_source(...)
  let rows = asynctasks#source(&columns * 48 / 100)
  let source = []
  for row in rows
    let name = row[0]
    let source += [name . '  ' . row[1] . '  : ' . row[2]]
  endfor
  return source
endfunction

function! s:lf_task_accept(line, arg)
  let pos = stridx(a:line, '<')
  if pos < 0
    return
  endif
  let name = strpart(a:line, 0, pos)
  let name = substitute(name, '^\s*\(.\{-}\)\s*$', '\1', '')
  if name != ''
    exec "AsyncTask " . name
  endif
endfunction

function! s:lf_task_digest(line, mode)
  let pos = stridx(a:line, '<')
  if pos < 0
    return [a:line, 0]
  endif
  let name = strpart(a:line, 0, pos)
  return [name, 0]
endfunction

function! s:lf_win_init(...)
  setlocal nonumber
  setlocal nowrap
endfunction

let g:Lf_Extensions = get(g:, 'Lf_Extensions', {})
let g:Lf_Extensions.task = {
      \ 'source': string(function('s:lf_task_source'))[10:-3],
      \ 'accept': string(function('s:lf_task_accept'))[10:-3],
      \ 'get_digest': string(function('s:lf_task_digest'))[10:-3],
      \ 'highlights_def': {
      \     'Lf_hl_funcScope': '^\S\+',
      \     'Lf_hl_funcDirname': '^\S\+\s*\zs<.*>\ze\s*:',
      \ }}

" Sneak
let g:sneak#label = 1
let g:sneak#use_ic_scs = 1

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#buffer_idx_mode = 1

" ALE
let g:ale_fix_on_save = 1
let g:ale_set_signs = 0
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_delay = 0
let g:ale_linters_explicit = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_linters = {'javascript': ['eslint', 'tsserver'],
\   'typescript': ['eslint', 'tsserver'],
\   'python': ['pylint', 'pyls'],
\   'rust': ['cargo', 'rls'],
\   'go': ['gofmt', 'gopls']}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'eslint'],
\   'go': ['gofmt'],
\   'rust': ['rustfmt'],
\   'python': ['yapf']}
