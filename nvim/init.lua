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
v.var.testvar = true
v.var.b.bufvar = 5
v.var.w.winvar = 'hi'
print(v.var.b.bufvar)