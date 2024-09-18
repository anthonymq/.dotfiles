return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "meuter/lualine-so-fancy.nvim",
    },
    event = "VeryLazy",
    config = function()
        require("lualine").setup({
            options = {
                icons_enabled = true,
                component_separators = "|",
                section_separators = "",
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch' },
                lualine_x = {
                    { "fancy_macro" },
                    "diff",
                    "diagnostics",
                    -- color = { fg = "#ff9e64" },
                },
                lualine_c = {
                    {
                        "buffers",
                    },
                },
                lualine_z = {
                    { "fancy_lsp_servers" }
                },
            },
        })
    end
}
