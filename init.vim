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
Plug 'Yggdroot/indentLine'
Plug 'preservim/nerdcommenter'
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'roxma/nvim-yarp'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'RRethy/vim-illuminate'
Plug 'jiangmiao/auto-pairs'
Plug 'liuchengxu/vista.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'dense-analysis/ale'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }
Plug 'justinmk/vim-sneak'
Plug 'psliwka/vim-smoothie'
Plug 'sheerun/vim-polyglot'
Plug 'ryanoasis/vim-devicons'
call plug#end()

" Encoding
set encoding=utf-8                             " set default encoding to UTF-8
set fileformats=unix,dos,mac            " prefer unix file formats
set formatoptions-=cro                  " Disable autocommenting new lines

" Errors
set noerrorbells                        " no beeps
set novisualbell                        " Turn off visual bell
set visualbell t_vb=                    " Turn off error beep/flash

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
set undodir=~/.vim/undodir              " Directory to save undo history
set undofile                            " Allow vim to persist undo between sessions"

" Windows and Tabs
set splitbelow                          " Vertical splits always below
set splitright                          " Horizontal splits always to the right
set laststatus=2                        " last window always has status line

" Movement
set scrolloff=10                        " Always keep 10 lines below or above when scrolling

" Display
set background=dark
set termguicolors                             " Enable support for 24-bit colors
set title                                     " display file status on terminal title
set ruler                                     " show the cursor position all the time
set number                                    " Show line numbers
set showcmd                                   " show what is being typed
set showmatch                                 " Show matching brackets
set lazyredraw                                " Don't redraw while executing macros (good performance config)
set nowrap                                    " Don't wrap lines
set noshowmode                                " don't show current mode ( use airline)
set nocursorcolumn                            " Don't display current cursor column
set colorcolumn=120                         " HIghlight column 120
set cursorline                              " Highlight current line
set numberwidth=5                           " Width in columns of the gutter
set signcolumn=yes                          " always show the signcolumn
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

" Tab
set expandtab                           " Expand tabs to spaces
set smarttab                            " Insert 'shiftwidth' spaces when at the start of a line
set shiftround                          " Round indentation to multiples of shiftwidth
set tabstop=2                           " Number of spaces a tab counts for
set softtabstop=2                       " Number of spaces a tab counts for while editing

" Indentation
set autoindent                          " auto indent new lines
set copyindent                          " copy previous indentation on autoindent
set smartindent                         " smart indent new lines
set shiftwidth=2                        " number of spaces to use as indentation

" Filetype
filetype on                             " enable filetype detection
filetype plugin on                      " enable loading filetype plugins
filetype indent on                      " enable loading filetype indentation

" Misc
autocmd! bufenter * if &ft ==# 'help' | wincmd L | endif " Open help on vertical split
set backspace=indent,eol,start          " better backspace
set updatetime=300                      " less delay and better user experience
set shortmess+=c                        " don't pass message to |ins-completion-menu|
set history=50                          " save the last 50 commands
set timeoutlen=500
set nojoinspaces
set whichwrap+=h,l                      " Allow h,j to go to next line
set completeopt=menu,menuone,preview,noselect,noinsert  " fix autocomplete

" Colorscheme
set background=dark

colorscheme palenight
let g:lightline = { 'colorscheme': 'palenight'}
let g:palenight_terminal_italics=1

highlight Sneak guifg='#bfc7d5' guibg='#697098'
highlight SneakScope guifg='#bfc7d5' guibg='#BE5046'

" Change map leader
let mapleader = ','

" Remap VIM 0 to first non-blank character
map 0 ^

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

" Disable arrows
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

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

" Return to last position on startup
autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif

" Startify
let g:startify_custom_indices = map(range(1,100), 'string(v:val)')
let g:startify_fortune_use_unicode = 1
let g:startify_change_to_dir = 1
let g:startify_change_to_vcs_root = 1
let g:startify_files_number = 4
let g:startify_commands = [
      \ ['Neovim Reference', 'h ref'],
      \]
let g:startify_bookmarks = [{'c': '~/.dotfiles/init.vim'}
  \, {'f': '~/.dotfiles/config.fish'}
  \, {'t': '~/.dotfiles/kitty.conf'}]

let g:startify_custom_header = ''

nmap <silent> <leader>s :Startify<CR>

" LeaderF
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

nmap <silent> <leader>c :LeaderfCommand<CR>
nmap <silent> <leader>d :LeaderfHelp<CR>
nmap <silent> <leader>h :LeaderfMru<CR>
nmap <silent> <leader>l :LeaderfLine<CR>
nmap <silent> <leader>m :LeaderfFunction<CR>
nmap <silent> <leader>t :LeaderfTag<CR>
nmap <silent> <leader>r :Leaderf --nowrap task<CR>

" nerdtree
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeWinSize = 25
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1

map <silent> <leader>n :NERDTreeToggle<CR>

" Vista
let g:vista#renderer#enable_icon = 1

" Illuminate
hi illuminatedWord cterm=underline gui=underline

" Deoplete
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('sources', { '_': ['buffer', 'ale'] })

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
			\ },
		\ }

" Sneak
let g:sneak#label = 1
let g:sneak#use_ic_scs = 1

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

let g:lightline#ale#indicator_checking = "\uf110  "
let g:lightline#ale#indicator_infos = "\uf129  "
let g:lightline#ale#indicator_warnings = "\uf071  "
let g:lightline#ale#indicator_errors = "\uf05e  "
let g:lightline#ale#indicator_ok = "\uf00c  "

let g:lightline.tabline          = {'left': [['buffers']], 'right': [[]]}
let g:lightline.separator = {
	\   'left': '', 'right': ''
  \}
let g:lightline.subseparator = {
	\   'left': '', 'right': ''
  \}

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

let g:lightline.component_function = {
      \ 'gitbranch': 'fugitive#head',
      \}

let g:lightline.active = {
      \   'left': [ [ 'mode', 'paste' ], [ 'gitbranch', 'readonly', 'filename', 'modified'] ],
      \   'right': [
      \   ['lineinfo' ], [ 'percent'], [ 'linter_checking', 'linter_errors', 'linter_warnings',
      \   'linter_infos', 'linter_ok', 'fileformat', 'fileencoding', 'filetype' ]]
      \}

" ALE
nnoremap <silent> <leader>ae :ALEToggleBuffer<CR>
nnoremap <silent> <leader>af :ALEFix<CR>
nnoremap <silent> <leader>ad :ALEGoToDefinition<CR>
nnoremap <silent> <leader>at :ALEGoToTypeDefinition<CR>
nnoremap <silent> <leader>ar :ALEFindReferences<CR>
nnoremap <silent> <leader>ah :ALEHover<CR>
nnoremap <silent> <leader>as :ALESymbolSearch<CR>

let g:ale_fix_on_save = 1
let g:ale_set_signs = 0
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_delay = 0
let g:ale_linters_explicit = 1

" Prefered linters
let g:ale_linters = {
\   'javascript': ['eslint', 'tsserver'],
\   'typescript': ['eslint', 'tsserver'],
\   'python': ['pylint', 'pyls'],
\   'rust': ['cargo', 'rls'],
\   'go': ['gofmt', 'gopls']
\}

" Prefered fixers
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'eslint'],
\   'go': ['gofmt'],
\   'rust': ['rustfmt'],
\   'python': ['yapf'],
\}
