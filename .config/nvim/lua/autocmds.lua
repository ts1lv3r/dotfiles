local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- Enable spell checker
autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.md", "*.txt", ".tex" },
  command = "setlocal spell",
})

-- Disable japanese input method
autocmd({ "InsertLeave", "CmdlineLeave" }, {
  group = augroup("Fcitx" ,{ clear = false }),
  pattern = "*",
  command = "call system('fcitx-remote -c')",
})

-- Source .zshrc
autocmd( "BufWritePost", {
  pattern = ".zshrc",
  command = "!source <afile>",
})

-- For YARA Rules
autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.yar", "*.yara" },
  command = "setlocal filetype=yara",
})
