---------- Variables ----------

-- Map leader
vim.g.mapleader = ","

-- Files & Buffers
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.autowrite = true
vim.opt.modeline = false

-- Windows & Tabs
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Movement
vim.opt.scrolloff = 10

-- Display
vim.opt.termguicolors = true
vim.opt.title = true
vim.opt.number = true
vim.opt.lazyredraw = true
vim.opt.wrap = false
vim.opt.showmode = false
vim.opt.cursorline = true
vim.opt.numberwidth = 5
vim.opt.signcolumn = "yes"
vim.opt.cmdheight = 2
vim.opt.guicursor = { "n-v-c-sm:ver25-blinkon0", "i-ci-ve:ver25", "r-cr-o:hor20" }
vim.opt.guifont = "VictorMono Nerd Font Mono:h14"

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Tab
vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- Indentation
vim.opt.copyindent = true
vim.opt.smartindent = true
vim.opt.shiftwidth = 4

-- Info
vim.opt.shortmess = vim.opt.shortmess + {c = true, F = true, W = true, I = true}

-- Misc
vim.opt.updatetime = 300
vim.opt.history = 100
vim.opt.timeoutlen = 300
vim.opt.whichwrap = {b = true, s = true, h = true, l = true}
vim.opt.completeopt = {menu = true, menuone = true, preview = true, noselect = true, noinsert = true}