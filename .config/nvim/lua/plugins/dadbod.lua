return {
    {
        "kristijanhusak/vim-dadbod-ui",
        enabled = false,
        event = "VeryLazy",
        dependencies = {
            { "tpope/vim-dadbod",                     lazy = true },
            { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
        },
        cmd = {
            "DBUI",
            "DBUIToggle",
            "DBUIAddConnection",
            "DBUIFindBuffer",
        },
        init = function()
            -- Your DBUI configuration
            vim.g.db_ui_use_nerd_fonts = 1
        end,
        config = function()
            require("config.dadbod").setup()
        end,
    },
    -- Database
    -- {
    --     "tpope/vim-dadbod",
    --     opt = true,
    --     requires = {
    --         "kristijanhusak/vim-dadbod-ui",
    --         "kristijanhusak/vim-dadbod-completion",
    --     },
    --     config = function()
    --         -- require("config.dadbod").setup()
    --     end,
    -- },
}
-- local M = {}
--
-- local function db_completion()
-- 	require("cmp").setup.buffer({
-- 		sources = {
-- 			{ name = "vim-dadbod-completion" },
-- 			{ name = "buffer" },
-- 			{ name = "luasnip" },
-- 		},
-- 	})
-- 	require("cmp")
-- end
--
-- function M.setup()
-- 	-- vim.g.db_ui_save_location = vim.fn.stdpath("config") .. require("plenary.path").path.sep .. "db_ui"
--
-- 	vim.api.nvim_create_autocmd("FileType", {
-- 		pattern = {
-- 			"sql",
-- 		},
-- 		command = [[setlocal omnifunc=vim_dadbod_completion#omni]],
-- 	})
--
-- 	vim.api.nvim_create_autocmd("FileType", {
-- 		pattern = {
-- 			"sql",
-- 			"mysql",
-- 			"plsql",
-- 		},
-- 		callback = function()
-- 			vim.schedule(db_completion)
-- 		end,
-- 	})
-- end
--
-- return M
