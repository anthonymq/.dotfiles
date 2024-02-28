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
    config = function()
        require("conform").setup({
            formatters = {
                hclfmt = {
                    -- Change where to find the command
                    command = vim.env.HOME .. "/go/bin/bin/hclfmt",
                },
            },
            formatters_by_ft = {
                -- first use isort and then black
                python = { "isort", "black" },
                -- "inject" is a special formatter from conform.nvim, which
                -- formats treesitter-injected code. Basically, this makes
                -- conform.nvim format python codeblocks inside a markdown file.
                markdown = { "inject" },
                terraform = { "terraform_fmt" },
                tf = { "terraform_fmt" },
                ["terraform-vars"] = { "terraform_fmt" },
                hcl = { "hclfmt" },
                nomad = { "hclfmt" },
                -- templ = { "templ_fmt" },
            },
            -- enable format-on-save
            format_on_save = {
                -- when no formatter is setup for a filetype, fallback to formatting
                -- via the LSP. This is relevant e.g. for taplo (toml LSP), where the
                -- LSP can handle the formatting for us
                lsp_fallback = true,
            },
        })
    end
}
