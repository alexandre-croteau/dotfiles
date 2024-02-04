return {
  {
    "uloco/bluloco.nvim",
    name = "bluloco",
    --enabled = false,
    dependencies = {
      "rktjmp/lush.nvim",
    },
  },
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    enabled = false,
  },
  {
    "olimorris/onedarkpro.nvim",
    name = "onedarkpro",
    enabled = false,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    enabled = false,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "bluloco",
    },
  },
}
