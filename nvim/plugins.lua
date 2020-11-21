vim.cmd [[packadd packer.nvim]]
local packer = require('packer')
local v = require('utils')

packer.startup(function()
    use {'wbthomason/packer.nvim', opt = true}
    use {'neovim/nvim-lspconfig'}
    use {'nvim-lua/completion-nvim'}
    use {'drewtempelmeyer/palenight.vim', config='vim.cmd[[colorscheme palenight]]'}
    use {'preservim/nerdcommenter'}
    use {'skywind3000/asynctasks.vim'}
    use {'skywind3000/asyncrun.vim'}
    use {'RRethy/vim-illuminate'}
    use {'voldikss/vim-floaterm'}
    use {'jiangmiao/auto-pairs'}
    use {'liuchengxu/vista.vim'}
    use {'tpope/vim-fugitive'}
    use {'airblade/vim-gitgutter'}
    use {'vim-airline/vim-airline'}
    use {'mhinz/vim-sayonara', cmd = {'Sayonara'}}
    use {'justinmk/vim-sneak'}
    use {'psliwka/vim-smoothie'}
    use {'thaerkh/vim-workspace'}
    use {'sheerun/vim-polyglot'}
    use {'ryanoasis/vim-devicons'}
    use {'junegunn/fzf', run = ':fzf#install()'}
    use {'junegunn/fzf.vim'}
    use {'lambdalisue/fern.vim'}
    use {'lambdalisue/fern-git-status.vim'}
    use {'lambdalisue/fern-renderer-nerdfont.vim'}
    use {'lambdalisue/nerdfont.vim'}
    use {'lambdalisue/fern-hijack.vim'}
end)

-- LSP
require'nvim_lsp'.rust_analyzer.setup{}
require'nvim_lsp'.pyls.setup{on_attach=require'completion'.on_attach}

-- Workspace
v.v.g.workspace_autosave = 0
v.v.g.workspace_session_directory = '/home/davysson/.vim/sessions'

-- Fern
v.v.g['fern#renderer'] = 'nerdfont'