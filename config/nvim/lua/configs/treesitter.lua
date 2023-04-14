-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

-- configure treesitter
treesitter.setup({
  -- enable syntax highlighting
  highlight = {
    enable = true,
    disable = { "ruby" }
  },
  -- enable indentation
  indent = {
    enable = true,
    disable = { "ruby" }
  },
  -- enable autotagging (w/ nvim-ts-autotag plugin)
  autotag = { enable = true },
  -- ensure these language parsers are installed
  -- ensure_installed = "all",
  ensure_installed = {
    "help",
    "c",
    "lua",
    "vim",
    "ruby",
    "python",
    "javascript"
  },
  -- auto install above language parsers
  auto_install = true,
})
