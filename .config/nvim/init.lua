require("config.set")
require("config.remap")
require("config.lazy")
require("config.ft")
require("features.telescope")
print("hello from MQ")

local augroup = vim.api.nvim_create_augroup
local AnthonyMQGroup = augroup('AnthonyMQ', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        -- vim.highlight.on_yank({
        --     higroup = 'IncSearch',
        --     timeout = 40,
        -- })
        vim.highlight.on_yank()
    end,
})

autocmd({ "BufWritePre" }, {
    group = AnthonyMQGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

autocmd('LspAttach', {
    group = AnthonyMQGroup,
    callback = function(e)
        local bufnr = e.buf
        -- display lsp code action with lightbulb @TODO charger à un meilleurs moments
        require("nvim-lightbulb").setup({
            autocmd = { enabled = true }
        })
        local client = vim.lsp.get_client_by_id(e.data.client_id)
        local opts = { buffer = e.buf }
        local keymap = vim.keymap -- for conciseness

        local nmap = function(keys, func, desc)
            if desc then
                desc = "LSP: " .. desc
            end

            vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
        end
        local vmap = function(keys, func, desc)
            if desc then
                desc = "LSP: " .. desc
            end

            vim.keymap.set("v", keys, func, { buffer = bufnr, desc = desc })
        end
        vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
        vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)
        nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
        vmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
        nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
        nmap("gd", vim.lsp.buf.definition, "[G]oto [d]efinition")
        nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
        nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
        nmap("gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
        nmap("<leader>gt", vim.lsp.buf.type_definition, "Type [D]efinition")
        nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
        nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) --
        keymap.set("n", "<leader>lr", ":LspRestart<CR>", opts) --
        -- Create a command `:Format` local to the LSP buffer
        vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
            if vim.lsp.buf.format then
                vim.lsp.buf.format()
            elseif vim.lsp.buf.formatting then
                vim.lsp.buf.formatting()
            end
        end, { desc = "Format current buffer with LSP" })

        if client == "ruff_lsp" then
            -- Disable hover in favor of Pyright
            client.server_capabilities.hoverProvider = false
        end
    end
})
