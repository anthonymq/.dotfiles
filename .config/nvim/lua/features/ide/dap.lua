-- Debugger Adapter
require("mason-nvim-dap").setup({
	ensure_installed = { "jdtls", "delve" },
})

local dap = require("dap")
dap.configurations.java = {
	{
		type = "java",
		request = "attach",
		name = "Debug (Attach) - Remote",
		hostName = "127.0.0.1",
		port = 5005,
	},
}

require("dapui").setup()
require("dap-go").setup({
	delve = {
		port = "38697",
	},
	dap_configurations = {
		{
			type = "go",
			name = "Attach remote",
			mode = "remote",
			request = "attach",
		},
	},
})
require("nvim-dap-virtual-text").setup()
vim.fn.sign_define(
	"DapBreakpoint",
	{ text = "🔴", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)
vim.api.nvim_set_hl(0, "DapStoppedLinehl", { bg = "#555530" })
vim.fn.sign_define("DapStopped", { text = "▶️", texthl = "Error", linehl = "DapStoppedLinehl", numhl = "" })

-- Debugger
vim.api.nvim_set_keymap("n", "<leader>dt", ":lua require('dapui').toggle({})<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>db", ":DapToggleBreakpoint<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>dc", ":DapContinue<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>dr", ":lua require('dapui').open({reset = true})<CR>", { noremap = true })
-- vim.api.nvim_set_keymap("n", "<leader>m", ":lua require('harpoon.mark').add_file()<CR>", {noremap=true})
-- vim.api.nvim_set_keymap("n", "<leader>ht", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", {noremap=true})
