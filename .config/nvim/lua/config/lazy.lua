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
    -- require 'plugins.catppuccin',
    {
        -- Theme inspired by Atom
        'folke/tokyonight.nvim',
        priority = 1000,
        config = function()
            vim.cmd.colorscheme 'tokyonight-night'
        end,
    },
    {
        -- Set lualine as statusline
        'nvim-lualine/lualine.nvim',
        -- See `:help lualine.txt`
        opts = {
            options = {
                icons_enabled = false,
                theme = 'tokyonight',
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
        config = function ()
            -- If you want icons for diagnostic errors, you'll need to define them somewhere:
            vim.fn.sign_define("DiagnosticSignError",
            {text = " ", texthl = "DiagnosticSignError"})
            vim.fn.sign_define("DiagnosticSignWarn",
            {text = " ", texthl = "DiagnosticSignWarn"})
            vim.fn.sign_define("DiagnosticSignInfo",
            {text = " ", texthl = "DiagnosticSignInfo"})
            vim.fn.sign_define("DiagnosticSignHint",
            {text = "󰌵", texthl = "DiagnosticSignHint"})

            require("neo-tree").setup({
                close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab

                hijack_netrw_behavior = "open_default",
            })
        end,
    }
}, {})
