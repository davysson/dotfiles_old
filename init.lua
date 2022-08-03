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

---------- Packages ----------

local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  use { 'wbthomason/packer.nvim' }
  use { 'williamboman/mason.nvim', config = function() require("mason").setup() end }
  use { 'windwp/nvim-autopairs', config = function() require("nvim-autopairs").setup {} end }
  use { 'Pocco81/auto-save.nvim', config = function() require("auto-save").setup {execution_message = ""} end }
  use { 'rmagatti/auto-session', config = function() require('auto-session').setup { log_level = 'error' } end }
  --use { 'hrsh7th/nvim-cmp', config = function() require('cmp').setup{} end }
  --use { 'RRethy/vim-illuminate' }
  use { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end }
  use { 'kyazdani42/nvim-web-devicons', config = function() require("nvim-web-devicons").setup {default = true} end }
  --use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim', config = function() require("diffview").setup() end }
  --use { 'feline-nvim/feline.nvim', config = function () require('feline').setup() end }
  use { 'lewis6991/gitsigns.nvim',  config = function() require('gitsigns').setup{current_line_blame = true} end }
  use { 'phaazon/hop.nvim', config = function() require("hop").setup() end }
  -- Luasnip
  use { 'TimUntersberger/neogit', requires = { 'nvim-lua/plenary.nvim' }, config = function() require("neogit").setup{ 
    signs = { section = { "→", "↓" }, item = { "→", "↓" }, hunk = { "", "" }}, 
    integrations = { diffview = true }} 
  end }
  -- use { 'jose-elias-alvarez/null-ls.nvim', config = function() require("null-ls").setup() end }
  use { 'sheerun/vim-polyglot' }
  use { 'mhinz/vim-sayonara' }
  -- Session Lens
  -- Sidebar
  use { 'nvim-telescope/telescope.nvim', config = function() require('telescope').setup{} end }
  -- TODO
  use {"akinsho/toggleterm.nvim", config = function() require("toggleterm").setup() end }
  -- Treesitter

  if packer_bootstrap then
    require('packer').sync()
  end
end)