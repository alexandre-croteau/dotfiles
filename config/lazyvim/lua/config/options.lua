-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.lazygit_config = false

-- Github Copilot
--vim.g.copilot_no_tab_map = true
--vim.g.copilot_assume_mapped = true
--vim.g.copilot_tab_fallback = ""

-- https://code.visualstudio.com/docs/languages/identifiers#_known-language-identifiers
vim.g.copilot_filetypes = {
  ["*"] = true,
  ["plaintext"] = false,
}
