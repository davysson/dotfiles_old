local v = require('utils')

-- Files & Buffers
v.opt.writebackup = false
v.opt.swapfile = false
v.opt.autowrite = true
v.opt.hidden = true
v.opt.modeline = false
v.autocmd({'focusgained', 'bufenter'}, '*', v.cmd.checktime)

-- Windows & Tabs
v.opt.splitbelow = true
v.opt.splitright = true

-- Movement
v.opt.scrolloff = 10

-- Display
v.opt.termguicolors = true
v.opt.title = true
v.opt.number = true
v.opt.lazyredraw = true
v.opt.wrap = false
v.opt.showmode = false
v.opt.cursorline = true
v.opt.numberwidth = 5
v.opt.signcolumn = 'yes'
v.opt.cmdheight = 2
v.opt.guicursor = {'n-v-c-sm:ver25-blinkon0', 'i-ci-ve:ver25', 'r-cr-o:hor20'}

-- Search
v.opt.ignorecase = true
v.opt.smartcase = true

-- Tab
v.opt.expandtab = true
v.opt.shiftround = true
v.opt.tabstop = 2
v.opt.softtabstop = 2

-- Indentation
v.opt.copyindent = true
v.opt.smartindent = true
v.opt.shiftwidth = 2

-- Filetype
v.cmd.filetype('on')
v.cmd.filetype('plugin', 'on')
v.cmd.filetype('indent', 'on')

-- Misc
vim.cmd('autocmd! bufenter * if &ft ==# "help" | wincmd L | endif')
v.opt.updatetime = 300
v.opt.history = 100
v.opt.timeoutlen = 300
v.opt.whichwrap = {'b', 's', 'h', 'l'}
v.opt.completeopt = {'menu', 'menuone', 'preview', 'noselect', 'noinsert'}