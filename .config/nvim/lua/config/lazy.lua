--    Package Manager
--    https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup(
    {
        -- To automatically import any new plugin from 'lua/custom/plugins/*.lua' :
        -- { import = 'custom.plugins' },
        -- But manually requiring them feels more convenient to me
        -- Theme
        require 'plugins.catppuccin',
        -- {
        --     -- Theme inspired by Atom
        --     'folke/tokyonight.nvim',
        --     priority = 1000,
        --     config = function()
        --         vim.cmd.colorscheme 'tokyonight-night'
        --     end,
        -- },
        {
            -- Set lualine as statusline
            'nvim-lualine/lualine.nvim',
            -- See `:help lualine.txt`
            opts = {
                options = {
                    icons_enabled = false,
                    theme = 'catppuccin',
                    component_separators = '|',
                    section_separators = '',
                },
            },
        },

        {
            -- Add indentation guides even on blank lines
            'lukas-reineke/indent-blankline.nvim',
            -- Enable `lukas-reineke/indent-blankline.nvim`
            -- See `:help indent_blankline.txt`
            opts = {
                char = '┊',
                show_trailing_blankline_indent = false,
            },
        },

        {
            "ThePrimeagen/vim-be-good"
        },
        require 'plugins.telescope',
        require 'plugins.treesitter',
        require 'plugins.undotree',
        require 'plugins.cmp',
        require 'plugins.lsp',
        {
            "folke/which-key.nvim",
            event = "VeryLazy",
            init = function()
                vim.o.timeout = true
                vim.o.timeoutlen = 300
            end,
            opts = {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        },
        { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
        {
            "nvim-neo-tree/neo-tree.nvim",
            branch = "v3.x",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
                "MunifTanjim/nui.nvim",
            },
            config = function()
                -- If you want icons for diagnostic errors, you'll need to define them somewhere:
                vim.fn.sign_define("DiagnosticSignError",
                    { text = " ", texthl = "DiagnosticSignError" })
                vim.fn.sign_define("DiagnosticSignWarn",
                    { text = " ", texthl = "DiagnosticSignWarn" })
                vim.fn.sign_define("DiagnosticSignInfo",
                    { text = " ", texthl = "DiagnosticSignInfo" })
                vim.fn.sign_define("DiagnosticSignHint",
                    { text = "󰌵", texthl = "DiagnosticSignHint" })

                require("neo-tree").setup({
                    close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab

                    hijack_netrw_behavior = "open_default",
                    enable_git_status = true,
                    filesystem = {
                        filtered_items = {
                            visible = true,
                            hide_dotfiles = false,
                        --     hide_gitignored = false,
                        },
                        follow_current_file = {
                            enabled = true
                        },
                    },
                })
            end,
        },
        {
            "folke/noice.nvim",
            event = "VeryLazy",
            opts = {
                -- add any options here
            },
            dependencies = {
                -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
                "MunifTanjim/nui.nvim",
                -- OPTIONAL:
                --   `nvim-notify` is only needed, if you want to use the notification view.
                --   If not available, we use `mini` as the fallback
                "rcarriga/nvim-notify",
            },
            config = function()
                require("noice").setup({
                    lsp = {
                        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                        override = {
                            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                            ["vim.lsp.util.stylize_markdown"] = true,
                            ["cmp.entry.get_documentation"] = true,
                        },
                    },
                    -- you can enable a preset for easier configuration
                    presets = {
                        bottom_search = true, -- use a classic bottom cmdline for search
                        command_palette = true, -- position the cmdline and popupmenu together
                        long_message_to_split = true, -- long messages will be sent to a split
                        inc_rename = false, -- enables an input dialog for inc-rename.nvim
                        lsp_doc_border = false, -- add a border to hover docs and signature help
                    },
                })
            end,

        },
        {
            "kdheepak/lazygit.nvim",
            -- optional for floating window border decoration
            dependencies = {
                "nvim-lua/plenary.nvim",
            },
        },
        {"christoomey/vim-tmux-navigator"}
    }, {})
