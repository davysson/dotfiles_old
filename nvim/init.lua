require('plugins')
require('options')
require('keymaps')
local v = require('utils')
-- print(vim.api.nvim_eval('exists(\':enew\')'))
-- v.cmd.vsplit()
-- v.cmd.Testcmd = function(a, b)
--     print('got ' .. a .. ' and ' .. b)
-- end
-- print(vim.inspect(v.cmd.Testcmd))
-- print(vim.inspect(v.fn.api_info()))
v.fn.Sayhi = function(a, b)
    -- print('hi there')
    -- print('got ' .. a .. ' and ' .. b)
    print(vim.inspect(a))
end

v.fn.Sayhi(5, 10)