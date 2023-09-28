-- plugins/telescope.lua:
return {
    'nvim-telescope/telescope.nvim', tag = '0.1.3',
    -- or                              , branch = '0.1.x',
    dependencies = {"nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-ui-select.nvim",
    "nvim-tree/nvim-web-devicons",},
    config = function()
        local builtin = require("telescope.builtin")

		local keymap = vim.keymap
		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })                -- find files within current working directory, respects .gitignore
		vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
		vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
		vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
	end
}

