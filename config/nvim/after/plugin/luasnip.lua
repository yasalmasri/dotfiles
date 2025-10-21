MiniDeps.add('L3MON4D3/LuaSnip')

local ls = require("luasnip")

vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})

vim.keymap.set({"i", "s"}, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("lua", {
  s("hello", {
    t('print("hello world")')
  })
})

-- Ruby Snippets
ls.add_snippets("ruby", {
  s("debug", {
    t("ap error.message"),
    t({"", "ap error.backtrace.first(10)"})
  })
})
