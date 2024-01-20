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
    enabled = true,
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      filetypes = {
        ["*"] = true,
        plaintext = false,
      },
    },
  },
}
