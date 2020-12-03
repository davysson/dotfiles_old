-- Bootstrap packer
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end

local packer = require('packer')
local v = require('utils')

-- Install Plugins
packer.startup(function()
    use {'wbthomason/packer.nvim'}
    use {'neovim/nvim-lspconfig'}
    use {'nvim-lua/completion-nvim'}
    use {'drewtempelmeyer/palenight.vim', config='vim.cmd[[colorscheme palenight]]'}
    use {'preservim/nerdcommenter'}
    use {'jiangmiao/auto-pairs'}
    use {'tpope/vim-fugitive'}
    use {'airblade/vim-gitgutter'}
    use {'psliwka/vim-smoothie'}
    use {'sheerun/vim-polyglot'}
    use {'kyazdani42/nvim-web-devicons'}
    use {'romgrk/barbar.nvim'}
    use {'glepnir/galaxyline.nvim', branch = 'main', config = function() require'statusline' end, requires = {'kyazdani42/nvim-web-devicons', opt = true}}
    use {'voldikss/vim-floaterm'}
    use {'justinmk/vim-sneak'}
    use {'thaerkh/vim-workspace'}
    use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}}
    use {'nvim-treesitter/nvim-treesitter', opt = true}
end)

-- LSP
local lsp = require 'lspconfig'
local completion = require 'completion'

lsp.tsserver.setup{on_attach=completion.on_attach}
lsp.rust_analyzer.setup{on_attach=completion.on_attach}
lsp.pyls.setup{on_attach=completion.on_attach}

-- Workspace
v.v.g.workspace_autosave = 0
v.v.g.workspace_session_directory = '/home/davysson/.vim/sessions'

-- Fern
v.v.g['fern#renderer'] = 'nerdfont'
