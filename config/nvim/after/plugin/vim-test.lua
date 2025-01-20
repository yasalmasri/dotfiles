MiniDeps.add({ source = 'vim-test/vim-test' })

MiniDeps.later(function()
  local keymap = vim.keymap.set
  local opts = { noremap = true, silent = true }

  local keymaps = {
    ['<leader>tf'] = { '<cmd>TestFile<CR>', { desc = 'Test File' } },
    ['<leader>tl'] = { '<cmd>TestLast<CR>', { desc = 'Test Last' } },
    ['<leader>tn'] = { '<cmd>TestNearest<CR>', { desc = 'Test Nearest' } },
    ['<leader>ts'] = { '<cmd>TestSuite<CR>', { desc = 'Test Suite' } },
    ['<leader>tv'] = { '<cmd>TestVisit<CR>', { desc = 'Visit Test File' } },
  }

  for key, val in pairs(keymaps) do
    keymap('n', key, val[1], vim.tbl_extend('keep', opts, val[2]))
  end

  vim.g["test#preserve_screen"] = true
  vim.g['test#neovim#start_normal'] = true
end)
