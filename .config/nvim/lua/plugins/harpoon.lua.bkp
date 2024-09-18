return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require('telescope').load_extension('harpoon')
        -- local mark = require("harpoon.mark")
        -- local ui = require("harpoon.ui")
        local harpoon = require("harpoon")
        -- REQUIRED
        harpoon:setup()
        -- REQUIRED
        vim.keymap.set("n", "<leader>m", function() harpoon:list():append() end, { desc = "Harpoon Add File" })
        vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end, { desc = "Harpoon Add File" })
        vim.keymap.set("n", "²", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
        vim.keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
    end,
    -- loaded when called
    keys = {
        { "<leader>m", function() require("harpoon"):list():append() end,                                 desc = "Harpoon Add File" },
        { "<leader>a", function() require("harpoon"):list():append() end,                                 desc = "Harpoon Add File" },
        { "²",         function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = "Harpoon Menu" },
        { "<leader>h", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = "Harpoon Menu" },
    }
}
