vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = {"*conf*"},
  command = "setf asterisk",
})
