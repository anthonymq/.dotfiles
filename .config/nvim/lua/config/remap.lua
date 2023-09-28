local set_keymap = vim.keymap.set
-- Making sure Space has no keymaps beforehand
-- Then defining it as the new leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Delete single character without copying into register
set_keymap({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
set_keymap('n', 'x', '"_x')

-- Move text up and down
set_keymap('n', '<M-j>', ':m .+1<CR>==')
set_keymap('n', '<M-k>', ':m .-2<CR>==')
set_keymap('v', '<M-j>', ':m \'>+1<CR>gv=gv')
set_keymap('v', '<M-k>', ':m \'<-2<CR>gv=gv')

-- perso
set_keymap("n","<leader>po", '<Cmd>Neotree toggle<CR>', { desc = 'Open file explorer NeoTree' })

set_keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = 'Move selection UP (Visual Mode)' })
set_keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = 'Move selection DOWN (Visual Mode)' })

set_keymap("n", "J", "mzJ`z", { desc = 'Append next line to current' })
set_keymap("n", "<C-d>", "<C-d>zz")
set_keymap("n", "n", "nzzzv")
set_keymap("n", "N", "Nzzzv")
set_keymap("n", "<C-u>", "<C-u>zz")

-- greatest remap ever
set_keymap("x", "<leader>p", [["_dP]], { desc = 'Paste without putting deleted selection in register' })

-- next greatest remap ever : asbjornHaland
set_keymap({"n", "v"}, "<leader>y", [["+y]], { desc = 'Paste without putting deleted selection in register' })
set_keymap("n", "<leader>Y", [["+Y]])

set_keymap({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
set_keymap("i", "<C-c>", "<Esc>")

set_keymap("n", "Q", "<nop>")
set_keymap("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
set_keymap("n", "<leader>f", vim.lsp.buf.format)

set_keymap("n", "<C-k>", "<cmd>cnext<CR>zz")
set_keymap("n", "<C-j>", "<cmd>cprev<CR>zz")
set_keymap("n", "<leader>k", "<cmd>lnext<CR>zz")
set_keymap("n", "<leader>j", "<cmd>lprev<CR>zz")

set_keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
set_keymap("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = 'Make script executable (chmod +x current)' })

-- set_keymap("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
-- set_keymap("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");
-- 
-- set_keymap("n", "<leader><leader>", function()
--     vim.cmd("so")
-- end)
