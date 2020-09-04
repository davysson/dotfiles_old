" Autoinstall vim-plug
no Install vim-plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync
endif

" Plugins
call plug#begin()
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'
call plug#end()

" Search
set ignorecase                           " Search case insensitive
set smartcase                            " Case sensitive when pattern uses upper case

" Better leader
let mapleader = ','
set timeoutlen=50                       " Time to wait for a mapped sequence to complete

" Display
set guicursor=n-v-c-sm:ver25-blinkon0,i-ci-ve:ver25,r-cr-o:hor20  " Use normal cursor

" Call whick-key menu in normal/visual mode
xmap <leader> :<c-u>call VSCodeNotify('whichkey.show')<cr>
nmap <leader> :<c-u>call VSCodeNotify('whichkey.show')<cr>
omap <leader> :<c-u>call VSCodeNotify('whichkey.show')<cr>
vmap <leader> :<c-u>call VSCodeNotify('whichkey.show')<cr>

" Sneak
let g:sneak#label = 1
let g:sneak#use_ic_scs = 1
map f <Plug>Sneak_s
map t <Plug>Sneak_S