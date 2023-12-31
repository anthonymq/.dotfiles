return {
	{
		-- Autocompletion
		"hrsh7th/nvim-cmp",
		dependencies = {
			-- Snippet Engine & its associated nvim-cmp source
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",

			-- Adds LSP completion capabilities
			"hrsh7th/cmp-nvim-lsp",

			-- More sources
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-cmdline",

			-- Adds a number of user-friendly snippets
			"rafamadriz/friendly-snippets",

			"onsails/lspkind.nvim", -- vs-code like pictograms
		},
		-- config = function()
		--     local cmp = require 'cmp'
		--     local luasnip = require 'luasnip'
		--     require('luasnip.loaders.from_vscode').lazy_load()
		--     luasnip.config.setup {}
		--
		--     cmp.setup {
		--         snippet = {
		--             expand = function(args)
		--                 luasnip.lsp_expand(args.body)
		--             end,
		--         },
		--         mapping = cmp.mapping.preset.insert {
		--             ['<C-j>'] = cmp.mapping.select_next_item(),
		--             ['<C-k>'] = cmp.mapping.select_prev_item(),
		--             ['<C-d>'] = cmp.mapping.scroll_docs(-4),
		--             ['<C-f>'] = cmp.mapping.scroll_docs(4),
		--             ['<C-Space>'] = cmp.mapping.complete {},
		--             ['<CR>'] = cmp.mapping.confirm {
		--                 behavior = cmp.ConfirmBehavior.Replace,
		--                 select = true,
		--             },
		--             ['<Tab>'] = cmp.mapping(function(fallback)
		--                 if cmp.visible() then
		--                     cmp.select_next_item()
		--                 elseif luasnip.expand_or_locally_jumpable() then
		--                     luasnip.expand_or_jump()
		--                 else
		--                     fallback()
		--                 end
		--             end, { 'i', 's' }),
		--             ['<S-Tab>'] = cmp.mapping(function(fallback)
		--                 if cmp.visible() then
		--                     cmp.select_prev_item()
		--                 elseif luasnip.locally_jumpable(-1) then
		--                     luasnip.jump(-1)
		--                 else
		--                     fallback()
		--                 end
		--             end, { 'i', 's' }),
		--         },
		--         sources = {
		--             { name = 'nvim_lsp' },
		--             { name = 'luasnip' },
		--             { name = 'path' },
		--             { name = 'buffer' },
		--         },
		--         window = {
		--             completion = cmp.config.window.bordered(),
		--             documentation = cmp.config.window.bordered(),
		--         },
		--         formatting = {
		--             format = require("lspkind").cmp_format({
		--                 maxwidth = 50,
		--                 ellipsis_char = "...",
		--             }),
		--         },
		--     }
		--     -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
		--     cmp.setup.cmdline({ '/', '?' }, {
		--         mapping = cmp.mapping.preset.cmdline(),
		--         sources = {
		--             { name = 'buffer' }
		--         }
		--     })
		--
		--     -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
		--     cmp.setup.cmdline(':', {
		--         mapping = cmp.mapping.preset.cmdline(),
		--         sources = cmp.config.sources({
		--             { name = 'path' }
		--         }, {
		--                 { name = 'cmdline' }
		--             })
		--     })
		--
		-- end,
	},
}
