vim.scriptencoding = "utf-8"

-- Open memo file
vim.api.nvim_create_user_command("Memo", function()
	vim.cmd("e " .. "~/dotfiles/docs/memo.md")
end, {})

for k,v in  pairs({
  helplang = 'ja,en',
  encoding = 'utf-8',
  splitbelow = true,
  splitright = true,
  equalalways = false,
  wildmenu = true,
  visualbell = true,
  ruler = true,
  listchars = 'tab:>.',
  incsearch = true,
  smartcase = true,
  ignorecase = true,
  hlsearch = true,
  list = true,
  showmatch = true,
  clipboard = 'unnamedplus',
  hidden = true,
  showcmd = true,
  confirm = true,
  backup = false,
  writebackup = false,
  number = true,
  cursorcolumn = false,
  cursorline = true,
  foldmethod = 'indent',
  foldlevel = 0,
  foldcolumn = 'auto',
  foldenable = false,
  tabstop = 2,
  expandtab = true,
  smartindent = true,
  shiftwidth = 2,
  swapfile = false,
  autoread = true,
  autoindent = true,
  autochdir = true,
  mouse = "a",
  title = true,
  termguicolors = true,
  wrap = false,
}) do
	vim.opt[k] = v
end
