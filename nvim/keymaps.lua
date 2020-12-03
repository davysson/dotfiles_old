local v = require('utils')

-- Remap leader key
v.var.mapleader = ','

-- Disable pattern hightlight with return
v.nnoremap({'<silent>', '<CR>'}, v.cmd.nohlsearch)

-- Better split navigation
v.nnoremap('<C-J>', '<C-W><C-J>')
v.nnoremap('<C-K>', '<C-W><C-K>')
v.nnoremap('<C-L>', '<C-W><C-L>')
v.nnoremap('<C-H>', '<C-W><C-H>')

-- Move a line of text using ALT+]\[
v.nmap({'<silent>', '<M-]>'}, 'mz:m+<cr>`z')
v.nmap({'<silent>', '<M-[>'}, 'mz:m-2<cr>`z')
v.vmap({'<silent>', '<M-]>'}, ':m\'>+<cr>`<my`>mzgv`yo`z')
v.vmap({'<silent>', '<M-[>'}, ':m\'<-2<cr>`>my`<mzgv`yo`z')

-- Split creation
v.nnoremap({'<silent>', '<M-l>'}, v.cmd.vsplit)
v.nnoremap({'<silent>', '<M-j>'}, v.cmd.split)

-- Split creates new file
v.nnoremap({'<silent>', '<M-h>'}, v.cmd.vnew)
v.nnoremap({'<silent>', '<M-k>'}, v.cmd.new)

-- Split resize
v.nnoremap('-', '<C-W><')
v.nnoremap('+', '<C-W>>')
v.nnoremap('=', '<C-W>=')

-- Fast saving and quitting
v.map({'<silent>', '<leader>', 'w'}, v.cmd['w!'])
v.map({'<silent>', '<leader>', 'w', 'q'}, v.cmd['wqa!'])
v.map({'<silent>', '<leader>', 'q'}, v.cmd.BufferClose)
v.map({'<silent>', '<leader>', 'q', 'a'}, v.cmd.qa)

-- Fast file creation
v.map({'<silent>', '<leader>', 'e'}, v.cmd.enew)

-- Bash like keys for the command line
v.cnoremap('<C-A>', '<Home>')
v.cnoremap('<C-E>', '<End>')
v.cnoremap('<C-K>', '<C-U>')
v.cnoremap('<C-P>', '<Up>')
v.cnoremap('<C-N>', '<Down>')

-- Better popup navigation
v.inoremap({'<expr>', '<Tab>'}, 'pumvisible() ? "<C-n>" : "<Tab>"')
v.inoremap({'<expr>', '<S-Tab>'}, 'pumvisible() ? "<C-p>" : "<S-Tab>"')

-- Planetary
v.nmap({'<silent>', '<leader>', 'b'}, ':Telescope buffers<CR>')
v.nmap({'<silent>', '<leader>', 'c'}, ':Telescope commands<CR>')
v.nmap({'<silent>', '<leader>', 'd'}, ':Telescope help_tags<CR>')
v.nmap({'<silent>', '<leader>', 'h'}, ':Telescope oldfiles<CR>')
v.nmap({'<silent>', '<leader>', 'l'}, ':Telescope current_buffer_fuzzy_find<CR>')
v.nmap({'<silent>', '<leader>', 'g'}, ':Telescope find_files<CR>')
v.nmap({'<silent>', '<leader>', 'h'}, ':Telescope oldfiles<CR>')

-- Workspace
v.nmap({'<silent>', '<leader>', 's'}, v.cmd.ToggleWorkspace)

-- Floaterm
v.nmap({'<silent>', '<leader>', 't'}, ':FloatermNew --title=1/5 --autoclose=2<CR>')
v.nmap({'<silent>', '<leader>', 'n'}, ':FloatermNew ranger<CR>')

-- Git
v.nmap({'<silent>', '<leader>', 'g', 'f'}, v.cmd.GFiles)
v.nmap({'<silent>', '<leader>', 'g', 's'}, v.cmd['GFiles?'])
v.nmap({'<silent>', '<leader>', 'g', 'c'}, v.cmd.BCommits)
v.nmap({'<silent>', '<leader>', 'g', 'C'}, v.cmd.Commits)
v.nmap({'<silent>', '<leader>', 'g', 'h'}, v.cmd.GitGutterPreviewHunk)

-- Tabline
v.nnoremap({'<silent>', '<leader>', '1'}, '::BufferGoto 1<CR>')
v.nnoremap({'<silent>', '<leader>', '2'}, '::BufferGoto 2<CR>')
v.nnoremap({'<silent>', '<leader>', '3'}, '::BufferGoto 3<CR>')
v.nnoremap({'<silent>', '<leader>', '4'}, '::BufferGoto 4<CR>')
v.nnoremap({'<silent>', '<leader>', '5'}, '::BufferGoto 5<CR>')
