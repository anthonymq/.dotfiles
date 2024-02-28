local set_keymap = vim.keymap.set
-- Making sure Space has no keymaps beforehand
-- Then defining it as the new leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = false })

-- Delete single character without copying into register
set_keymap({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
set_keymap("n", "x", '"_x')

-- perso
-- set_keymap("n", "<leader>po", "<Cmd>Neotree toggle<CR>", { desc = "Open file explorer NeoTree" })

set_keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection UP (Visual Mode)" })
set_keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection DOWN (Visual Mode)" })

set_keymap("n", "J", "mzJ`z", { desc = "Append next line to current" })
set_keymap("n", "<C-d>", "<C-d>zz")
set_keymap("n", "n", "nzzzv")
set_keymap("n", "N", "Nzzzv")
set_keymap("n", "<C-u>", "<C-u>zz")

-- greatest remap ever
set_keymap("x", "<leader>p", [["_dP]], { desc = "Paste without putting deleted selection in register" })

-- next greatest remap ever : asbjornHaland
set_keymap({ "n", "v" }, "<leader>y", [["+y]], { desc = "Paste without putting deleted selection in register" })
set_keymap("n", "<leader>Y", [["+Y]])

set_keymap({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
set_keymap("i", "<C-c>", "<Esc>")

-- set_keymap("n", "Q", "<nop>")
set_keymap("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
set_keymap("n", "<leader>f", vim.lsp.buf.format)

set_keymap("n", "<C-k>", "<cmd>cnext<CR>zz")
set_keymap("n", "<C-j>", "<cmd>cprev<CR>zz")
set_keymap("n", "<leader>k", "<cmd>lnext<CR>zz")
set_keymap("n", "<leader>j", "<cmd>lprev<CR>zz")

set_keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
set_keymap(
    "n",
    "<leader>X",
    "<cmd>!chmod +x %<CR>",
    { silent = true, desc = "Make script executable (chmod +x current)" }
)
set_keymap('t', "<Esc>", "<C-\\><C-n>") -- Escape terminal mode
set_keymap("n", "tk", ":bnext<enter>", { noremap = false })
set_keymap("n", "tj", ":bprev<enter>", { noremap = false })
set_keymap("n", "th", ":bfirst<enter>", { noremap = false })
set_keymap("n", "tl", ":blast<enter>", { noremap = false })
set_keymap("n", "td", ":bdelete<enter>", { noremap = false })
-- files
set_keymap("n", "QQ", ":q!<enter>", { noremap = false })
set_keymap("n", "WW", ":w!<enter>", { noremap = false })
set_keymap("n", "E", "$", { noremap = false })
set_keymap("n", "B", "^", { noremap = false })
set_keymap("n", "TT", ":TransparentToggle<CR>", { noremap = true })
set_keymap("n", "st", ":TodoTelescope<CR>", { noremap = true })
set_keymap("n", "ss", ":noh<CR>", { noremap = true })
-- splits
set_keymap("n", "<C-W>,", ":vertical resize -10<CR>", { noremap = true })
set_keymap("n", "<C-W>.", ":vertical resize +10<CR>", { noremap = true })
vim.keymap.set("n", "<space><space>", "<cmd>set nohlsearch<CR>")

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Options through Telescope
vim.api.nvim_set_keymap(
    "n",
    "<leader><tab>",
    "<Cmd>lua require('telescope.builtin').commands()<CR>",
    { noremap = false }
)

set_keymap(
    "n",
    "<leader>x",
    ":bp<bar>sp<bar>bn<bar>bd<CR>",
    { silent = true, desc = "Close current buffer without exiting nvim" }
)

vim.keymap.set(
    "n",
    "<leader>ee",
    "oif err != nil {<CR>}<Esc>Oreturn err<Esc>"
)
