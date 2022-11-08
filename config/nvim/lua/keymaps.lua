local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

--Remap space as leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
keymap('', '<Space>', '<Nop>', opts)

local keymaps = {
  { { 'i', 'v' }, 'jk', '<ESC>', { desc = 'Return to normal mode' } },

  { { 'n' }, '<leader><space>', '<C-^>', { desc = 'Alternate Buffer' } },
  { { 'n' }, '<leader>d', ':NeoTreeFloatToggle<CR>', { desc = 'Toggle Float Neotree' } },

  { { 'n' }, '<leader>w', '<cmd>up<CR>', { desc = 'Write' } },
  { { 'n' }, '<leader>q', 'ZZ', { desc = 'Quit' } },

  { { 'n' }, '<leader>c', '<cmd>execute (v:count > 0 ? v:count : "") . "bd!"<CR>', { desc = 'Close Buffer' } },
  { { 'n' }, '<leader>C', '<cmd>%bd|e#|bd#<CR>', { desc = 'Close Other Buffers' } },

  { { 'n' }, 'J', 'mzJ`z', { desc = 'Join on same line' } },

  -- { { 'n' }, '<C-j>', ':m .+1<CR>==', { desc = 'Move line up' } },
  -- { { 'n' }, '<C-k>', ':m .-2<CR>==', { desc = 'Move line down' } },

  { { 'n' }, '<C-h>', '<C-W><C-H>', { desc = 'Move to left split' } },
  { { 'n' }, '<C-j>', '<C-W><C-J>', { desc = 'Move to up split' } },
  { { 'n' }, '<C-k>', '<C-W><C-K>', { desc = 'Move to down split' } },
  { { 'n' }, '<C-l>', '<C-W><C-L>', { desc = 'Move to right split' } },

  -- { { 'v' }, '<C-j>', ":m '>+1<CR>gv-gv", { desc = 'Move line up' } },
  -- { { 'v' }, '<C-k>', ":m '<-2<CR>gv-gv", { desc = 'Move line down' } },

  { { 'v' }, '<', '<gv', { desc = 'Keep visual selection on indent decrease' } },
  { { 'v' }, '>', '>gv', { desc = 'Keep visual selection on indent increase' } },

  { { 'v' }, 'p', '"_dP', { desc = 'Paste without replacing' } },

  { { 'n' }, '<A-q>', "<cmd>lua require('utils').quickfix_toggle()<CR>", { desc = 'QuickFix Toggle' } },
  { { 'n' }, ']q', '<cmd>cnext<CR>', { desc = 'QuickFix Next Item' } },
  { { 'n' }, '[q', '<cmd>cprevious<CR>', { desc = 'QuickFix Previous Item' } },

  { { 'i' }, '<C-l>', "<cmd>lua require('utils').escape_pair()<CR>", { desc = 'Escape pair' } },

  { { 'i' }, ',', ',<C-g>u', { desc = 'Undo Break Point' } },
  { { 'i' }, '.', '.<C-g>u', { desc = 'Undo Break Point' } },
  { { 'i' }, ';', ';<C-g>u', { desc = 'Undo Break Point' } },
}

for _, val in pairs(keymaps) do
  keymap(val[1], val[2], val[3], vim.tbl_extend('keep', opts, val[4]))
end
