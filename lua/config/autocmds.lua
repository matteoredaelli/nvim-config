-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- OpenTofu: riconosci i file .tofu come terraform (stessa sintassi HCL)
vim.filetype.add({
  extension = {
    tofu = "terraform",
  },
})

-- Registra il parser HCL per il filetype terraform (per treesitter highlighting)
vim.treesitter.language.register("hcl", "terraform")
