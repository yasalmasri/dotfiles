MiniDeps.add({
  source = 'kopecmaciej/vi-sql.nvim',
})

MiniDeps.now(function()
  require('vi-sql').setup({
    hide_key = "<C-q>",
    width = 0.9,
    height = 0.9,
  })

  vim.keymap.set('n', '<leader>vs', '<cmd>ViSQL<cr>', { desc = 'Open vi-sql' })
end)
