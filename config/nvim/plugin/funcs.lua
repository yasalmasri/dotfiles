vim.api.nvim_create_user_command('ParseJSON',function()
  vim.cmd([[:%s/\\n/\r/ge]])
  vim.cmd([[:%s/\\"/"/ge]])
end,{})

vim.api.nvim_create_user_command('HashToJSON',function()
  -- symbol keys with rocket: :foo => or :foo=> -> "foo":
  vim.cmd([[:%s/:\(\w\+\)\s*=>\s*/"\1": /ge]])
  -- string keys with rocket: "foo" => or "foo"=> -> "foo":
  vim.cmd([[:%s/"\s*=>\s*/": /ge]])
  -- new-style symbol keys: foo: value -> "foo": value
  vim.cmd([[:%s/\(\s\+\)\(\w\+\):\s/\1"\2": /ge]])
  -- symbol values: :foo -> "foo" (only if starts with letter/underscore, not digits like :28 in "17:28")
  vim.cmd([[:%s/:\([a-zA-Z_]\w*\)/"\1"/ge]])
  -- nil -> null
  vim.cmd([[:%s/\<nil\>/null/ge]])
end,{})

vim.api.nvim_create_user_command('W',function()
  vim.cmd([[:w]])
end,{})

vim.api.nvim_create_user_command('Wq',function()
  vim.cmd([[:wq]])
end,{})

vim.api.nvim_create_user_command('Q',function()
  vim.cmd([[:q]])
end,{})
