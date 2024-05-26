local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
  return
end

-- recommended settings from nvim-tree documentation
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- change color for arrows in tree to light blue
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<C-o>', api.node.run.system,                   opts('Run System'))
  vim.keymap.set('n', 's',     api.node.open.vertical,                opts('Open: Vertical Split'))
end

-- configure nvim-tree
nvimtree.setup({
  on_attach = my_on_attach,

  -- change folder arrow icons
  renderer = {
    icons = {
      glyphs = {
        folder = {
          arrow_closed = "", -- arrow when folder is closed
          arrow_open = "", -- arrow when folder is open
        },
      },
    },
  },
  -- disable window_picker for
  -- explorer to work well with
  -- window splits
  actions = {
    open_file = {
      window_picker = {
        enable = false,
      },
    },
  },
  git = {
    enable = true,
    timeout = 1000
    -- ignore = false,
  },
  view = {
    adaptive_size = false,
    -- mappings = {
    --   list = {
    --     { key = "<C-o>", action = "system_open" },
    --     { key = "s", action = "vsplit" },
    --   },
    -- },
  },

  filters = {
    dotfiles = true,
  },
})
