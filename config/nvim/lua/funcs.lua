vim.api.nvim_create_user_command('ParseJSON',function()
  vim.cmd([[:%s/\\n/\r/ge]])
  vim.cmd([[:%s/\\"/"/ge]])
end,{})

vim.api.nvim_create_user_command('HashToJSON',function()
  vim.cmd([[:%s/"=>"/":"/ge]])
  vim.cmd([[:%s/" => "/":"/ge]])
  vim.cmd([[:%s/"=> "/":"/ge]])
  vim.cmd([[:%s/" =>"/":"/ge]])
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
