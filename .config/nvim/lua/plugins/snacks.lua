local snacks = require("snacks")

return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    notifier = {
      style = "compact",
    },
    picker = {
      sources = {
        explorer = {
          hidden = true,
          ignored = true,

          jump = { close = true },
          layout = { layout = {
            position = "right",
          } },
        },
      },
    },
  },
}
