return {
    "cbochs/grapple.nvim",
    opts = {
        scope = "git", -- also try out "git_branch"
        icons = false, -- setting to "true" requires "nvim-web-devicons"
        status = false,
    },
    keys = {
        { "²",         "<cmd>Grapple toggle_tags<cr>", desc = "Toggle tags menu" },
        { "<F2>",      "<cmd>Grapple toggle_tags<cr>", desc = "Toggle tags menu" },
        { "<leader>m", "<cmd>Grapple toggle<cr>",      desc = "Tag a file" },

        -- { "<c-h>",     "<cmd>Grapple select index=1<cr>", desc = "Select first tag" },
        -- { "<c-t>",     "<cmd>Grapple select index=2<cr>", desc = "Select second tag" },
        -- { "<c-n>",     "<cmd>Grapple select index=3<cr>", desc = "Select third tag" },
        -- { "<c-s>",     "<cmd>Grapple select index=4<cr>", desc = "Select fourth tag" },
        --
        -- { "<c-s-p>",   "<cmd>Grapple cycle backward<cr>", desc = "Go to previous tag" },
        -- { "<c-s-n>",   "<cmd>Grapple cycle forward<cr>",  desc = "Go to next tag" },
    },
}
