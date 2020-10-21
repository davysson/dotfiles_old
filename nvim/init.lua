require('plugins')
require('options')
require('keymaps')
local v = require('utils')
-- print(vim.api.nvim_buf_get_option(0, 'swapfile'))
v.leader = ','
-- v.nmap('<silent> <leader>e', ':enew<CR>')
local function print_newfile()
    print('opened new file')
end
v.autocmd('bufenter', '*', print_newfile)