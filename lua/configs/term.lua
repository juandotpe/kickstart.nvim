local group = vim.api.nvim_create_augroup("TerminalAutogroup", { clear = true })

vim.api.nvim_create_autocmd("TermOpen", {
  group = group,
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.cmd.startinsert()

    -- Window navigation in terminal mode
    vim.keymap.set("t", "<C-w>h", "<C-\\><C-n><C-w>h")
    vim.keymap.set("t", "<C-w>l", "<C-\\><C-n><C-w>l")
    vim.keymap.set("t", "<C-w>j", "<C-\\><C-n><C-w>j")
    vim.keymap.set("t", "<C-w>k", "<C-\\><C-n><C-w>k")
  end
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "term://*",
  group = group,
  callback = function()
    vim.cmd.startinsert()
  end
})
