local M = {}
M.quick_log = function()
  local log_file = "/home/aabid/main_vault/Main/Log.md"
  -- Create floating window
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local buf = vim.api.nvim_create_buf(false, true)
  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    col = math.floor((vim.o.columns - width) / 2),
    row = math.floor((vim.o.lines - height) / 2),
    border = "rounded",
    style = "minimal",
  })

  -- Open the log file in the buffer
  vim.api.nvim_command("edit " .. log_file)
  -- Go to end of file and add timestamp
  vim.api.nvim_command("normal! Go")
  local timestamp = os.date("%H:%M:%S")
  vim.api.nvim_put({ timestamp .. " " }, "", false, true)
  -- Enter insert mode
  vim.api.nvim_command("startinsert!")

  -- Auto save on buffer leave
  vim.api.nvim_create_autocmd({ "BufLeave" }, {
    buffer = buf,
    callback = function()
      vim.cmd("silent write")
    end,
  })

  -- Map Escape in normal mode for this buffer
  vim.api.nvim_buf_set_keymap(buf, "n", "<Esc>", ":silent write | quit<CR>", { noremap = true, silent = true })
end

return M
