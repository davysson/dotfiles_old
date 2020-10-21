vim.cmd [[packadd packer.nvim]]
local packer = require('packer')

return packer.startup(function()
    use {'wbthomason/packer.nvim', opt = true}
    use {'drewtempelmeyer/palenight.vim', config='vim.cmd[[colorscheme palenight]]'}
    use {'preservim/nerdcommenter'}
    use {'skywind3000/asynctasks.vim'}
    use {'skywind3000/asyncrun.vim'}
    use {'farmergreg/vim-lastplace'}
    use {'RRethy/vim-illuminate'}
    use {'voldikss/vim-floaterm'}
    use {'jiangmiao/auto-pairs'}
    use {'liuchengxu/vista.vim'}
    use {'tpope/vim-fugitive'}
    use {'airblade/vim-gitgutter'}
    use {'dense-analysis/ale'}
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