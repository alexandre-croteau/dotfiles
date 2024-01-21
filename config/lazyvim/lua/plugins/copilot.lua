return {
  {
    "github/copilot.vim",
    name = "copilot.vim",
    lazy = false,
    enabled = false,
    --     keys = {
    --       {
    --         "<Tab>",
    --         "copilot#Accept()",
    --         mode = "i",
    --         desc = "Accept current copilot suggestion",
    --         script = true,
    --         silent = true,
    --         nowait = true,
    --         expr = true,
    --       },
    --     },
  },
  {
    "zbirenbaum/copilot.lua",
    name = "copilot.lua",
    lazy = false,
    -- enabled = true,
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      panel = {
        enabled = true,
        -- auto_refresh = false,
        -- keymap = {
        --   jump_prev = "[[",
        --   jump_next = "]]",
        --   accept = "<CR>",
        --   refresh = "gr",
        --   open = "<M-CR>",
        -- },
        layout = {
          position = "right", -- | top | left | right
          --   ratio = 0.4,
        },
      },
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<Tab>",
          accept_word = "<S-Tab>",
          accept_line = "<Tab>",
          next = "<M-Right>",
          prev = "<M-Left>",
          dismiss = "<M-Down>",
        },
      },
      filetypes = {
        ["*"] = true,
        plaintext = false,
      },
    },
  },
}
