local v = require('utils')

-- Files & Buffers
v.writebackup = false
v.swapfile = false
v.autowrite = true
v.hidden = true
v.modeline = false
vim.cmd('au FocusGained,BufEnter * checktime')

-- Windows & Tabs
v.splitbelow = true
v.splitright = true

-- Movement
v.scrolloff = 10

-- Display
v.termguicolors = true
v.title = true
v.number = true
v.lazyredraw = true
v.wrap = false
v.showmode = false
v.cursorline = true
v.numberwidth = 5
v.signcolumn = 'yes'
v.cmdheight = 2
v.guicursor = 'n-v-c-sm:ver25-blinkon0,i-ci-ve:ver25,r-cr-o:hor20'

-- Search
v.ignorecase = true
v.smartcase = true

-- Tab
v.expandtab = true
v.shiftround = true
v.tabstop = 2
v.softtabstop = 2

-- Indentation
v.copyindent = true
v.smartindent = true
v.shiftwidth = 2

-- Filetype
vim.cmd('filetype on')
vim.cmd('filetype plugin on')
vim.cmd('filetype indent on')

-- Misc
vim.cmd('autocmd! bufenter * if &ft ==# "help" | wincmd L | endif')
v.updatetime = 300
v.history = 100
v.timeoutlen = 300
v.whichwrap = 'b,s,h,l'
v.completeopt = 'menu,menuone,preview,noselect,noinsert'