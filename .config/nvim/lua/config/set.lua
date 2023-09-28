local set = vim.opt
set.relativenumber = true
set.number = true
-- Formatting
set.smartindent = true
set.shiftwidth = 4
set.tabstop = 4
set.softtabstop = 4
set.expandtab = true

-- Sync clipboard between OS and Neovim.
vim.o.clipboard = 'unnamedplus'

set.wrap = false
-- set.backup = false
set.undodir = os.getenv("HOME") .. "/.vim/undodir"
set.undofile = true

set.hlsearch = true
set.incsearch = true
set.termguicolors = true

set.scrolloff = 8
set.signcolumn = "yes"
set.updatetime = 50

set.colorcolumn = "80"
set.cursorline = true

vim.api.nvim_set_hl(0,"Cursorline", { underline=true})
