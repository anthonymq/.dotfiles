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
-- vim.o.clipboard = 'unnamedplus'
--

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

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
--set.cursorline = true
--
--vim.api.nvim_set_hl(0,"Cursorline", { underline=true})
--

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- Fterm
-- vim.api.nvim_set_keymap("n", "<leader>tt", ":lua require('FTerm').toggle()<CR>", { noremap = true })
-- vim.api.nvim_set_keymap("t", "<leader>tt", '<C-\\><C-n>:lua require("FTerm").toggle()<CR>', { noremap = true })
--
-- -- Noice
-- vim.api.nvim_set_keymap("n", "<leader>nn", ":NoiceDismiss<CR>", { noremap = true })
--
-- vim.keymap.set("n", "<leader>ee", "<cmd>GoIfErr<cr>", { silent = true, noremap = true })
--
-- -- Git
-- vim.api.nvim_set_keymap("n", "<leader>gc", ':Git commit -m "', { noremap = false })
-- vim.api.nvim_set_keymap("n", "<leader>gp", ":Git push -u origin HEAD<CR>", { noremap = false })
