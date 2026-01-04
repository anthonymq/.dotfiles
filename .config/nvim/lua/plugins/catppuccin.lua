return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  enable = true,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      -- float = { transparent = false, solid = false },
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}
