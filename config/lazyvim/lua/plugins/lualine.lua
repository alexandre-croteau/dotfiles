local onedarkpro = require("lualine.themes.onedark_dark")

return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    enabled = true,
    opts = {
      options = {
        theme = onedarkpro,
      },
    },
  },
}
