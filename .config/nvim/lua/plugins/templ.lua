return {
  {
    "neovim/nvim-lspconfig",
    event = "LazyFile",
    opts = {
      servers = {
        templ = {
          filetypes = { "templ" },
          settings = {
            templ = {
              enable_snippets = true,
            },
          },
        },
        html = {
          filetypes = { "templ", "html" },
        },
        htmx = {
          filetypes = { "html", "templ" },
        },
        tailwindcss = {
          filetypes = { "templ", "astro", "javascript", "typescript", "react" },
          init_options = { userLanguages = { templ = "html" } },
        },
      },
    },
  },
  {
    -- Autocompletion
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
  },
}
