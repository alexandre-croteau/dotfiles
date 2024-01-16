-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps hereby
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

--Delete with x does not copy to clipboard
keymap.set("n", "x", '"_x')
-- Save file using leader w
keymap.set("n", "<leader>w", ":w<cr>", opts)
-- Open neo tree (sidepart files)
keymap.set("n", "<C-n>", ":Neotree<cr>", opts)
-- Keep just current buffer opened
keymap.set("n", "<leader>to", ":BufferLineCloseOthers<cr>", opts)
-- Adding a new tab (file)
keymap.set("n", "<leader>tn", ":tabnew<cr>", opts)
-- Select all file
keymap.set("n", "va", "<esc>ggVG", opts)

-- Add a line bellow without put cursor down
keymap.set("n", "<leader>o", "printf('m`%so<ESC>``', v:count2)", opts)

-- Github Copilot
--keymap.set("i", "<Tab>", function()
--  local cmp = require("cmp")
--  if cmp.visible() then
--    cmp.select_next_item()
--  else
--    local copilot_keys = vim.fn["copilot#Accept"]()
--    if copilot_keys ~= "" then
--      vim.api.nvim_feedkeys(copilot_keys, "i", true)
--    else
--      --fallback()
--    end
--  end
--end, { desc = "Copilot tab completion", noremap = true, silent = true })
