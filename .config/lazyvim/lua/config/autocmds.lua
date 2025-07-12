-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Commands to enable/disable format on save
vim.api.nvim_create_user_command("FormatDisable", function(args)
  if args.bang then
    -- vim.b.disable_autoformat = true
    vim.b.autoformat = false
  else
    -- vim.g.disable_autoformat = true
    vim.g.autoformat = false
  end
end, {
  desc = "Disable autoformat-on-save",
  bang = true,
})

vim.api.nvim_create_user_command("FormatEnable", function()
  -- vim.b.disable_autoformat = false
  -- vim.g.disable_autoformat = false
  vim.b.autoformat = true
  vim.g.autoformat = true
end, {
  desc = "Re-enable autoformat-on-save",
})

-- Disable auto commenting on Enter or using o/O in normal mode
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "r", "o" })
  end,
})
