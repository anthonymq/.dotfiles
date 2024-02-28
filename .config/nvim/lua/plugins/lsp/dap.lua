return {
    {
        'mfussenegger/nvim-dap',
        ft = { "go", "python", "java" },
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "williamboman/mason.nvim",
            "jay-babu/mason-nvim-dap.nvim",
            "theHamsta/nvim-dap-virtual-text",
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            -- Debugger Adapter
            require("mason").setup()
            require("mason-nvim-dap").setup({
                -- Makes a best effort to setup the various debuggers with
                -- reasonable debug configurations
                automatic_setup = true,

                -- You can provide additional configuration to the handlers,
                -- see mason-nvim-dap README for more information
                handlers = {},
                ensure_installed = { "jdtls", "delve", "python" },
            })

            -- Basic debugging keymaps, feel free to change to your liking!
            vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue" })
            vim.keymap.set("n", "<F1>", dap.step_into, { desc = "Debug: Step Into" })
            vim.keymap.set("n", "<F2>", dap.step_over, { desc = "Debug: Step Over" })
            vim.keymap.set("n", "<F3>", dap.step_out, { desc = "Debug: Step Out" })
            vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
            vim.keymap.set("n", "<leader>B", function()
                dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
            end, { desc = "Debug: Set Breakpoint" })
            -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
            vim.keymap.set("n", "<F7>", dapui.toggle, { desc = "Debug: See last session result." })

            dap.listeners.after.event_initialized["dapui_config"] = dapui.open
            dap.listeners.before.event_terminated["dapui_config"] = dapui.close
            dap.listeners.before.event_exited["dapui_config"] = dapui.close

            require("dapui").setup()
            require("nvim-dap-virtual-text").setup({})

            vim.fn.sign_define(
                "DapBreakpoint",
                { text = "🔴", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
            )
            vim.api.nvim_set_hl(0, "DapStoppedLinehl", { bg = "#555530" })
            vim.fn.sign_define("DapStopped", { text = "▶️", texthl = "Error", linehl = "DapStoppedLinehl", numhl = "" })


            dap.configurations.java = {
                {
                    type = "java",
                    request = "attach",
                    name = "Debug (Attach) - Remote",
                    hostName = "127.0.0.1",
                    port = 5005,
                },
            }

            dap.set_log_level("DEBUG")
        end
    },
    {
        "leoluz/nvim-dap-go",
        ft = "go"
    },
    {
        "mfussenegger/nvim-dap-python",
        ft = "python",
        dependencies = { "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui" },
        config = function(_, opts)
            local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
            require("dap-python").setup(path)
        end,
    },
}
