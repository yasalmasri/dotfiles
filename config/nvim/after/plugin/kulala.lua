MiniDeps.add({
  source = 'mistweaverco/kulala.nvim',
  depends = { 'nvim-treesitter/nvim-treesitter' },
})

MiniDeps.now(function()
  require('kulala').setup({
    global_keymaps = false,
    global_keymaps_prefix = '<leader>k',
    kulala_keymaps_prefix = '',
  })

  local keymap = vim.keymap

  keymap.set('n', '<leader>ks', function()
    require('kulala').run()
  end, { desc = 'Send request' })

  keymap.set('n', '<leader>ka', function()
    require('kulala').run_all()
  end, { desc = 'Send all requests' })

  keymap.set('n', '<leader>kb', function()
    require('kulala').scratchpad()
  end, { desc = 'Open scratchpad' })
end)
