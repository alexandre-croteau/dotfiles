-- if true then return {} end

return {
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    -- enabled = false,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    -- enabled = false,
  },
  {
    "LazyVim/LazyVim",
    -- enabled = false,
    opts = {
      colorscheme = "kanagawa-dragon", --"catppuccin-mocha",
    },
  },
}
