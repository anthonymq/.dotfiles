-- Formatting client: conform.nvim
-- - configured to use black & isort in python
-- - use the taplo-LSP for formatting in toml
-- - Formatting is triggered via `<leader>f`, but also automatically on save
return {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- load the plugin before saving
    keys = {
        {
            "<leader>f",
            function()
                require("conform").format({ lsp_fallback = true })
            end,
            desc = "Format",
        },
    },
}
