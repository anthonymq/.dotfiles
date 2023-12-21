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
    },
    -- enable format-on-save
    format_on_save = {
        -- when no formatter is setup for a filetype, fallback to formatting
        -- via the LSP. This is relevant e.g. for taplo (toml LSP), where the
        -- LSP can handle the formatting for us
        lsp_fallback = true,
    },
})
