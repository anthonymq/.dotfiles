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
            "diff",
            "diagnostics",
            -- color = { fg = "#ff9e64" },
        },
        lualine_c = {
            {
                "buffers",
            },
        },
    },
})
