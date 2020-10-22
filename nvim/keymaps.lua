local v = require('utils')

-- Remap leader key
v.leader = ','

-- Disable pattern hightlight with return
v.nnoremap('<silent> <CR>', ':nohlsearch<CR>')

-- Better split navigation
v.nnoremap('<C-J>', '<C-W><C-J>')
v.nnoremap('<C-K>', '<C-W><C-K>')
v.nnoremap('<C-L>', '<C-W><C-L>')
v.nnoremap('<C-H>', '<C-W><C-H>')

-- Move a line of text using ALT+]\[
v.nmap('<silent> <M-]>', 'mz:m+<cr>`z')
v.nmap('<silent> <M-[>', 'mz:m-2<cr>`z')
v.vmap('<silent> <M-]>', ':m\'>+<cr>`<my`>mzgv`yo`z')
v.vmap('<silent> <M-[>', ':m\'<-2<cr>`>my`<mzgv`yo`z')

-- Split creation
v.nnoremap('<silent> <M-l>', ':vsplit<CR>')
v.nnoremap('<silent> <M-j>', ':split<CR>')

-- Split creates new file
v.nnoremap('<silent> <M-h>', ':vnew<CR>')
v.nnoremap('<silent> <M-k>', ':new<CR>')

-- Split resize
v.nnoremap('-', '<C-W><')
v.nnoremap('+', '<C-W>>')
v.nnoremap('=', '<C-W>=')

-- Fast saving and quitting
v.map('<silent> <leader>w', ':w!<CR>')
v.map('<silent> <leader>wq', ':wqa!<CR>')
v.map('<silent> <leader>q', ':Sayonara<CR>')
v.map('<silent> <leader>qa', ':qa<CR>')

-- Fast file creation
v.map('<silent> <leader>e', ':enew<CR>')

-- Bash like keys for the command line
v.cnoremap('<C-A>', '<Home>')
v.cnoremap('<C-E>', '<End>')
v.cnoremap('<C-K>', '<C-U>')
v.cnoremap('<C-P>', '<Up>')
v.cnoremap('<C-N>', '<Down>')

-- Plugin mappings
v.nmap('<silent> <leader>n', ':Fern . -drawer -toggle<CR>')
v.nmap('<silent> <leader>b', v.cmd.Buffers)
v.nmap('<silent> <leader>c', v.cmd.Commands)
v.nmap('<silent> <leader>d', v.cmd.Helptags)
v.nmap('<silent> <leader>h', v.cmd.History)
v.nmap('<silent> <leader>r', v.cmd.AsyncTaskFzf)
v.nmap('<silent> <leader>l', v.cmd.BLines)
v.nmap('<silent> <leader>L', v.cmd.Lines)
v.nmap('<silent> <leader>g', v.cmd.Rg)
v.nmap('<silent> <leader>t', v.cmd.BTags)
v.nmap('<silent> <leader>T', v.cmd.Tags)
v.nmap('<silent> <leader>m', v.cmd.Marks)
v.nmap('<silent> <leader>s', v.cmd.ToggleWorkspace)

-- Floaterm
v.nmap('<silent> <leader>t1', ':FloatermNew --title=1/5 --autoclose=2<CR>')

-- Git
v.nmap('<silent> <leader>gf', v.cmd.GFiles)
v.nmap('<silent> <leader>gs', v.cmd['GFiles?'])
v.nmap('<silent> <leader>gc', v.cmd.BCommits)
v.nmap('<silent> <leader>gC', v.cmd.Commits)
v.nmap('<silent> <leader>gh', v.cmd.GitGutterPreviewHunk)