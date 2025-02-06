MiniDeps.add({ source = 'farfanoide/inflector.vim' })

MiniDeps.later(function()
  vim.g.inflector_mapping = "gI"
end)
