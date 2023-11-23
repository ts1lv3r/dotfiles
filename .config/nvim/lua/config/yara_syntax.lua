local src_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/vim-syntax-yara/syntax/yara.vim'

vim.api.nvim_create_autocmd({ "BufRead", "BufWritePost" }, {
  pattern = { "*.yar", "*.yara" },
  command = "source " .. src_path,
})
