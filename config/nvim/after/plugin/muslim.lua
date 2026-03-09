MiniDeps.add({
  source = 'tajirhas9/muslim.nvim',
  depends = {
     "nvim-lua/plenary.nvim",
     "nvim-lualine/lualine.nvim"
  },
})

MiniDeps.now(function()
  require('muslim').setup({
    latitude = 25.770938, 
    longitude = -100.441866,
    timezone = 'America/Monterrey',
    utc_offset = 6,
    refresh = 5
  })
end)
