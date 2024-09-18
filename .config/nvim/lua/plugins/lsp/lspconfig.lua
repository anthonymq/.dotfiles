return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            { "antosha417/nvim-lsp-file-operations", config = true },
            -- Automatically install LSPs to stdpath for neovim
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",

            -- Useful status updates for LSP
            -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
            { "j-hui/fidget.nvim",                   tag = "legacy", opts = {} },
            -- Additional lua configuration, makes nvim stuff amazing!
            "folke/neodev.nvim",
            "folke/trouble.nvim"
        },
        config = function()
            -- mason-lspconfig requires that these setup functions are called in this order
            -- before setting up the servers.
            require("mason").setup()
            require("mason-lspconfig").setup()
            local nvim_lsp = require("lspconfig")

            -- Enable the following language servers
            -- Feel free to add/remove any LSPs that you want here. They will automatically be installed
            local servers = {
                rust_analyzer = {},
                gopls = {},
                html = {
                    filetypes = {
                        "html",
                        -- "templ"
                    }
                },
                htmx = {
                    filetypes = {
                        "html",
                        -- "templ"
                    }
                },
                lua_ls = {
                    Lua = {
                        workspace = { checkThirdParty = false },
                        telemetry = { enable = false },
                    },
                },
                jdtls = {},
                terraformls = {},
                bashls = {},
                sqlls = {
                    filetypes = {
                        "sql",
                        "postgresql",
                    },
                },
                jedi_language_server = {},
                -- autotools_ls = {}
                astro = {},
                templ = {},
            }

            -- Setup neovim lua configuration
            require("neodev").setup()

            -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

            -- Ensure the servers above are installed
            local mason_lspconfig = require("mason-lspconfig")

            mason_lspconfig.setup({
                ensure_installed = vim.tbl_keys(servers),
            })

            mason_lspconfig.setup_handlers({
                function(server_name)
                    if server_name == "jdtls" then
                        return true
                    end
                    require("lspconfig")[server_name].setup({
                        capabilities = capabilities,
                        -- on_attach = on_attach,
                        settings = servers[server_name],
                        filetypes = (servers[server_name] or {}).filetypes,
                    })
                end,
            })

            -- -- Turn on lsp status information
            --
            -- Turn on lsp status information
            require("fidget").setup()

            -- require("lspconfig").jdtls.setup({ nil })
            -- Example custom configuration for lua
            --
            -- Make runtime files discoverable to the server
            local runtime_path = vim.split(package.path, ";")
            table.insert(runtime_path, "lua/?.lua")
            table.insert(runtime_path, "lua/?/init.lua")

            require("lspconfig").nomad_lsp.setup({
                capabilities = capabilities,
                -- filetypes = { "nomad" },
                -- cmd = { "nomad-lsp" },
                -- root_dir = nvim_lsp.util.root_pattern("nomad"),

            })
            require("lspconfig").luau_lsp.setup({
                -- on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    Lua = {
                        runtime = {
                            -- Tell the language server which version of Lua you're using (most likely LuaJIT)
                            version = "LuaJIT",
                            -- Setup your lua path
                            path = runtime_path,
                        },
                        diagnostics = {
                            globals = { "vim" },
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                            checkThirdParty = false,
                        },
                        -- Do not send telemetry data containing a randomized but unique identifier
                        telemetry = { enable = false },
                    },
                },
            })
            --
            -- nvim-cmp setup
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            require("luasnip.loaders.from_vscode").lazy_load()
            -- luasnip.config.setup({})

            cmp.setup {
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert {
                    ["<c-a>"] = cmp.mapping.complete {
                        config = {
                            sources = {
                                { name = "cody" },
                            },
                        },
                    },
                    ['<C-n>'] = cmp.mapping.select_next_item(),
                    ['<C-p>'] = cmp.mapping.select_prev_item(),
                    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete {},
                    -- ['<CR>'] = cmp.mapping.confirm {
                    --     behavior = cmp.ConfirmBehavior.Replace,
                    --     select = true,
                    -- },
                    ['<C-y>'] = cmp.mapping.confirm { select = true },
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_locally_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                    ['<S-Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.locally_jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                },
                sources = {
                    { name = "cody" },
                    { name = "nvim_lsp_signature_help" },
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    -- { name = "vim-dadbod-completion" },
                    { name = "path" },
                    { name = "buffer",                 keyword_length = 5 },
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                experimental = {
                    ghost_text = true,
                },
            }

            vim.api.nvim_create_autocmd("FileType", {
                pattern = "sh",
                callback = function()
                    vim.lsp.start({
                        name = "bash-language-server",
                        cmd = { "bash-language-server", "start" },
                    })
                end,
            })
        end
    },
    {
        "folke/trouble.nvim",
        opts = {}, -- for default options, refer to the configuration section for custom setup.
        cmd = "Trouble",
        keys = {
            {
                "<leader>d",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>dd",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>cl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            -- {
            --     "<leader>xL",
            --     "<cmd>Trouble loclist toggle<cr>",
            --     desc = "Location List (Trouble)",
            -- },
            -- {
            --     "<leader>xQ",
            --     "<cmd>Trouble qflist toggle<cr>",
            --     desc = "Quickfix List (Trouble)",
            -- },
        },
    },
}
