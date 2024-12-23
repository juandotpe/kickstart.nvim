local group = vim.api.nvim_create_augroup("TerminalAutogroup", { clear = true })

vim.api.nvim_create_autocmd("TermOpen", {
  group = group,
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.cmd.startinsert()
  end
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "term://*",
  group = group,
  callback = function()
    vim.cmd.startinsert()
  end
})
