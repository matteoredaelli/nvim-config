-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Disabilita il format-on-save globalmente (per tutti i filetype).
-- Formatta manualmente con :LazyFormat oppure toggle con <leader>uf.
vim.g.autoformat = false

--
--vim.g.clipboard = {
--  name = "OSC 52",
--  copy = {
--    ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
--    ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
--  },
--  paste = {
--    ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
--    ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
--  },
--}

-- Opzionale: per usare sempre la clipboard di Windows senza digitare ogni volta "+

--vim.opt.clipboard = "unnamedplus"
