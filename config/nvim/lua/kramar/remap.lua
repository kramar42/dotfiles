
vim.g.mapleader = ' '

vim.keymap.set({'n', 'v'}, ':', ';')
vim.keymap.set({'n', 'v'}, ';', ':')

vim.keymap.set('n', '<leader>w', ':w<CR>')

vim.keymap.set('n', '<leader>q',  ':qall!<CR>')
vim.keymap.set('n', '<leader>m',  ':make<CR>')
vim.keymap.set('n', '<leader>cn', ':cn<CR>')
vim.keymap.set('n', '<leader>cp', ':cp<CR>')
vim.keymap.set('n', '<leader>k',  ':bn<CR>:bd#<CR>')
vim.keymap.set('n', '<leader>x',  ':xa<CR>')
vim.keymap.set('n', '<leader>cd', ':cd %:p:h<CR>:pwd<CR>')
vim.keymap.set('n', '<leader>l',  ':Lines<CR>')
vim.keymap.set('n', '<leader>n',  ':set number!<CR><Esc>')
vim.keymap.set('n', '<leader>W',  ':w !sudo tee % > /dev/null<CR>')
vim.keymap.set('n', '<leader>t',  ':NERDTreeToggle<CR>')
vim.keymap.set('n', '<leader>d',  ':BD<CR>')


vim.keymap.set('n', 'L', '$')
vim.keymap.set('n', 'H', '^')


vim.keymap.set('n', '<leader>f', vim.cmd.Ex)

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- greatest remap ever
vim.keymap.set('x', '<leader>p', [['_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({'n', 'v'}, '<leader>y', [['+y]])
vim.keymap.set('n', '<leader>Y', [['+Y]])

vim.keymap.set({'n', 'v'}, '<leader>d', [['_d]])

-- This is going to get me cancelled
vim.keymap.set('i', '<C-c>', '<Esc>')

vim.keymap.set('n', 'Q', '<nop>')
vim.keymap.set('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>')
vim.keymap.set('n', '<leader>=', vim.lsp.buf.format)

vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz')
vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz')
vim.keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz')
vim.keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz')

vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true })

vim.keymap.set('n', '<leader>mr', '<cmd>CellularAutomaton make_it_rain<CR>');

