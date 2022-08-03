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
  vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
  use { 'wbthomason/packer.nvim' }
  use { 'williamboman/mason.nvim', config = function() require("mason").setup() end }
  use { 'windwp/nvim-autopairs', config = function() require("nvim-autopairs").setup {} end }
  --use { 'Pocco81/auto-save.nvim', config = function() require("auto-save").setup {execution_message = ""} end }
  use { 'rmagatti/auto-session', config = function() require('auto-session').setup { log_level = 'error' } end }
  --use { 'hrsh7th/nvim-cmp', config = function() require('cmp').setup{} end }
  use { 'RRethy/vim-illuminate' }
  use { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end }
  use { 'kyazdani42/nvim-web-devicons', config = function() require("nvim-web-devicons").setup {default = true} end }
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim', config = function() require("diffview").setup() end }
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
  use {"akinsho/toggleterm.nvim", config = function() require("toggleterm").setup() end }
  -- Treesitter
  use { 'EdenEast/nightfox.nvim', config = function() require('nightfox').setup{} end }

  if packer_bootstrap then
    require('packer').sync()
  end
end)

---------- Theme ----------
vim.cmd("colorscheme duskfox")

---------- Keymaps ----------

-- Disable pattern hightlight with return
vim.keymap.set('n', "<CR>" , ":nohlsearch<CR>", {silent = true, noremap = true})

-- Move a line of text using ALT+]\[
vim.keymap.set('n',  "<M-]>" , "mz:m+<cr>`z", {silent = true})
vim.keymap.set('n',  "<M-[>" , "mz:m-2<cr>`z", {silent = true})
vim.keymap.set('v',  "<M-]>" , ":m'>+<cr>`<my`>mzgv`yo`z", {silent = true})
vim.keymap.set('v',  "<M-[>" , ":m'<-2<cr>`>my`<mzgv`yo`z", {silent = true})

-- Better split navigation
vim.keymap.set('n', "<C-J>", "<C-W><C-J>", {noremap = true})
vim.keymap.set('n', "<C-K>", "<C-W><C-K>", {noremap = true})
vim.keymap.set('n', "<C-L>", "<C-W><C-L>", {noremap = true})
vim.keymap.set('n', "<C-H>", "<C-W><C-H>", {noremap = true})

-- Split creation
vim.keymap.set('n', "<M-l>" , ":vsplit", {silent = true, noremap = true})
vim.keymap.set('n', "<M-j>" , ":split", {silent = true, noremap = true})

-- Split creates new file
vim.keymap.set('n', "<M-h>" , ":vnew", {silent = true, noremap = true})
vim.keymap.set('n', "<M-k>" , ":new", {silent = true, noremap = true})

-- Split resize
vim.keymap.set('n', "-", "<C-W><", {noremap = true})
vim.keymap.set('n', "+", "<C-W>>", {noremap = true})
vim.keymap.set('n', "=", "<C-W>=", {noremap = true})

-- Fast saving and quitting
vim.keymap.set('', "<leader>w" , ":w!<CR>", {silent = true})
vim.keymap.set('', "<leader>wq" , ":wqa!<CR>", {silent = true})
vim.keymap.set('', "<leader>q" , ":Sayonara<CR>", {silent = true})
vim.keymap.set('', "<leader>qa" , ":qa<CR>", {silent = true})

-- Fast file creation
vim.keymap.set('', "<leader>e" , ":enew<CR>", {silent = true})

-- Bash like keys for the command line
vim.keymap.set('c', "<C-A>", "<Home>", {noremap = true})
vim.keymap.set('c', "<C-E>", "<End>", {noremap = true})
vim.keymap.set('c', "<C-K>", "<C-U>", {noremap = true})
vim.keymap.set('c', "<C-P>", "<Up>", {noremap = true})
vim.keymap.set('c', "<C-N>", "<Down>", {noremap = true})

-- Interacting with the system's clipboard
vim.keymap.set('v', "<C-c>", '"+y', {noremap = true})
vim.keymap.set('v', "<C-v>", '"+p', {noremap = true})

-- Buffer navigation
vim.keymap.set('n',  "f" , require("hop").hint_char1, {silent = true})
vim.keymap.set('n',  "s" , require("hop").hint_char2, {silent = true})
vim.keymap.set('n',  "/" , require("hop").hint_patterns, {silent = true})

-- Telescope
vim.keymap.set('n',  "<leader>" , require("telescope.builtin").builtin, {silent = true})

-- Sidebar
vim.keymap.set('n',  "<leader>n" , ":SidebarNvimToggle<CR>", {silent = true})

-- [B]uffer
vim.keymap.set('n',  "<leader>b" , require("telescope.builtin").buffers, {silent = true})
vim.keymap.set('n',  "<leader>bs" , require("telescope.builtin").current_buffer_fuzzy_find, {silent = true})

-- [F]ile
vim.keymap.set('n',  "<leader>f" , require("telescope.builtin").find_files, {silent = true})
vim.keymap.set('n',  "<leader>fc" , require("telescope.builtin").grep_string, {silent = true})
vim.keymap.set('n',  "<leader>fg" , require("telescope.builtin").git_files, {silent = true})
vim.keymap.set('n',  "<leader>fh" , require("telescope.builtin").oldfiles, {silent = true})
vim.keymap.set('n',  "<leader>fs" , require("telescope.builtin").live_grep, {silent = true})

-- [G]it
vim.keymap.set('n',  "<leader>g" , ":Neogit<CR>", {silent = true})
vim.keymap.set('n',  "<leader>gb" , ":Neogit branch<CR>", {silent = true})
vim.keymap.set('n',  "<leader>gc" , ":Neogit commit<CR>", {silent = true})
vim.keymap.set('n',  "<leader>gl" , ":Neogit log<CR>", {silent = true})
vim.keymap.set('n',  "<leader>gp" , ":Neogit pull<CR>", {silent = true})
vim.keymap.set('n',  "<leader>gP" , ":Neogit push<CR>", {silent = true})
vim.keymap.set('n',  "<leader>gr" , ":Neogit rebase<CR>", {silent = true})
vim.keymap.set('n',  "<leader>gs" , ":Neogit stash<CR>", {silent = true})

-- [L]anguage

-- [N]eovim
vim.keymap.set('n',  "<leader>na" , require("telescope.builtin").autocommands, {silent = true})
vim.keymap.set('n',  "<leader>nc" , require("telescope.builtin").commands, {silent = true})
vim.keymap.set('n',  "<leader>nd" , require("telescope.builtin").help_tags, {silent = true})
vim.keymap.set('n',  "<leader>nf" , require("telescope.builtin").filetypes, {silent = true})
vim.keymap.set('n',  "<leader>nh" , require("telescope.builtin").highlights, {silent = true})
vim.keymap.set('n',  "<leader>nk" , require("telescope.builtin").keymaps, {silent = true})
vim.keymap.set('n',  "<leader>nr" , require("telescope.builtin").registers, {silent = true})
vim.keymap.set('n',  "<leader>no" , require("telescope.builtin").vim_options, {silent = true})
vim.keymap.set('n',  "<leader>nt" , require("telescope.builtin").colorscheme, {silent = true})

-- [S]ession
vim.keymap.set('n',  "<leader>s" , ":SearchSession<CR>", {silent = true})

-- [T]erm
vim.keymap.set('n',  "<leader>t" , ":ToggleTerm<CR>", {silent = true})
vim.keymap.set('t', "<ESC>" , "<C-\\><C-n><CMD>ToggleTermToggleAll<CR>", {silent = true})
