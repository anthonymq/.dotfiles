require('telescope').load_extension('harpoon')

-- local mark = require("harpoon.mark")
-- local ui = require("harpoon.ui")
local harpoon = require("harpoon")
-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>m", function() harpoon:list():append() end, { desc = "Harpoon Add File" })
vim.keymap.set("n", "²", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
-- vim.keymap.set("n", "<leader>hn", ui.nav_next)
-- vim.keymap.set("n", "<leader>hp", ui.nav_prev)

-- harpoon.setup({
--     itabline = true,
--     tabline_prefix = "@   ",
--     tabline_suffix = "&   ",
-- })
-- vim.keymap.set('n', '<leader>ht', ":Telescope harpoon marks<CR>", { desc = 'Harpoon [M]arks' })
--
-- --stylua: ignore
-- keys = {
--     { "<leader>ha", function() require("harpoon.mark").add_file() end,            desc = "Harpoon Add File" },
--     { "<leader>hm", function() require("harpoon.ui").toggle_quick_menu() end,     desc = "Harpoon File Menu" },
--     { "<leader>hc", function() require("harpoon.cmd-ui").toggle_quick_menu() end, desc = "Harpoon Command Menu" },
--     { "<leader>1",  function() require("harpoon.ui").nav_file(1) end,             desc = "Harpoon File 1" },
--     { "<leader>2",  function() require("harpoon.ui").nav_file(2) end,             desc = "Harpoon File 2" },
--     { "<leader>3",  function() require("harpoon.term").gotoTerminal(1) end,       desc = "Harpoon Terminal 1" },
--     { "<leader>4",  function() require("harpoon.term").gotoTerminal(2) end,       desc = "Harpoon Terminal 2" },
--     { "<leader>5",  function() require("harpoon.term").sendCommand(1, 1) end,     desc = "Harpoon Command 1" },
--     { "<leader>6",  function() require("harpoon.term").sendCommand(1, 2) end,     desc = "Harpoon Command 2" },
-- },
-- opts = {
--     global_settings = {
--         save_on_toggle = true,
--         enter_on_sendcmd = true,
--         excluded_filetypes = { "harpoon" },
--         -- set marks specific to each git branch inside git repository
--         -- Each branch will have it's own set of marked files
--         mark_branch = true,
--     },
-- },
