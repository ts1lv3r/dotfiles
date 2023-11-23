local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.api.nvim_set_keymap("n", "<leader>la", ":w<CR>:luafile %<CR>", {noremap=true, silent=true})

-- Modes
--   normal_mode = 'n',
--   insert_mode = 'i',
--   visual_mode = 'v',
--   visual_block_mode = 'x',
--   term_mode = 't',
--   command_mode = 'c',

-- Normal
for k, v in pairs({
  ['<C-h>'] = '<C-w>h',
  ['<C-j>'] = '<C-w>j',
  ['<C-k>'] = '<C-w>k',
  ['<C-l>'] = '<C-w>l',
  ['<C-e>'] = '<End>',
  ['<C-w>h'] = '<C-w>5<',
  ['<C-w>j'] = '<C-w>5-',
  ['<C-w>k'] = '<C-w>5+',
  ['<C-w>l'] = '<C-w>5>',
  ['<C-[>'] = '<Esc>',
  ['<S-h>'] = '10<Left>',
  ['<S-j>'] = '10<Down>',
  ['<S-k>'] = '10<Up>',
  ['<S-l>'] = '10<Right>',
  ['<S-y>'] = 'y$',
  ['ss'] = '<Cmd>split<CR>',
  ['sv'] = '<Cmd>vsplit<CR>',
  ['st'] = ':terminal<CR>',
  ['<Leader>ev'] = '<Cmd>edit $MYVIMRC<CR>',
  ['<Leader>sv'] = '<Cmd>luafile $MYVIMRC<CR>',
  ['<Leader>w'] = '<Cmd>w!<CR>',
  ['<Leader>wa'] = '<Cmd>wa!<CR>',
  ['<Leader>wq'] = '<Cmd>wq!<CR>',
  -- ['<Leader>q'] = '<Cmd>q<CR>',
  -- ['<Leader>qa'] = '<Cmd>qa!<CR>',
  ['<Leader>wqa'] = '<Cmd>wqa!<CR>',
  -- ['<Leader>t'] = ':terminal<CR>',
  ['<C-w>r'] = ':set relativenumber!<CR>',
  ['<C-w>w'] = ':set wrap!<CR>',
  ['<C-w>n'] = ':set nohlsearch!<CR>',
  ['<Up>'] = '<nop>',
  ['<Down>'] = '<nop>',
  ['<Right>'] = '<nop>',
  ['<Left>'] = '<nop>',
  ['<BS>'] = '<nop>',
}) do
	vim.api.nvim_set_keymap('n', k, v, opts)
end

-- Insert
for k, v in pairs({
  ['<C-h>'] = '<Left>',
  ['<C-j>'] = '<Down>',
  ['<C-k>'] = '<Up>',
  ['<C-l>'] = '<Right>',
  ['<C-d>'] = '<BS>',
  ['<Up>'] = '<nop>',
  ['<Down>'] = '<nop>',
  ['<Right>'] = '<nop>',
  ['<Left>'] = '<nop>',
  ['<BS>'] = '<nop>',
}) do
	vim.api.nvim_set_keymap('i', k, v, opts)
end

-- Visual
for k, v in pairs({
  ['<S-h>'] = '10<Left>',
  ['<S-j>'] = '10<Down>',
  ['<S-k>'] = '10<Up>',
  ['<S-l>'] = '10<Right>',
  ['<Up>'] = '<nop>',
  ['<Down>'] = '<nop>',
  ['<Right>'] = '<nop>',
  ['<Left>'] = '<nop>',
  ['<BS>'] = '<nop>',
}) do
	vim.api.nvim_set_keymap('v', k, v, opts)
end

-- Term
for k, v in pairs({
  ['<Esc>'] = [[<C-\><C-n>]],
}) do
  vim.api.nvim_set_keymap('t', k, v, {})
end
