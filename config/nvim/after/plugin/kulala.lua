MiniDeps.add({ source = 'mistweaverco/kulala.nvim', })
require('kulala').setup()

MiniDeps.later(function()
  vim.keymap.set(
    'n',
    "<leader><CR>",
    "<cmd>lua require('kulala').run()<cr>",
    { noremap = true, silent = true, desc = "Execute the request" }
  )

  vim.keymap.set(
    'n',
    "[",
    "<cmd>lua require('kulala').jump_prev()<cr>",
    { noremap = true, silent = true, desc = "Jump to the previous request" }
  )

  vim.keymap.set(
    "n",
    "]",
    "<cmd>lua require('kulala').jump_next()<cr>",
    { noremap = true, silent = true, desc = "Jump to the next request" }
  )

  vim.keymap.set(
    "n",
    "<leader>t",
    "<cmd>lua require('kulala').toggle_view()<cr>",
    { noremap = true, silent = true, desc = "Toggle between body and headers" }
  )

  vim.keymap.set(
    "n",
    "<leader>co",
    "<cmd>lua require('kulala').copy()<cr>",
    { noremap = true, silent = true, desc = "Copy the current request as a curl command" }
  )
end)
