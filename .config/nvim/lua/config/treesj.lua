local status_ok, treesj = pcall(require, "treesj")
if not status_ok then
  return
end

-- For use default preset and it work with dot
vim.keymap.set('n', '<leader>m', require('treesj').toggle)
vim.keymap.set('n', '<leader>n', require('treesj').split)
vim.keymap.set('n', '<leader>l', require('treesj').join)
-- For extending default preset with `recursive = true`, but this doesn't work with dot
vim.keymap.set('n', '<leader>M', function()
    require('treesj').toggle({ split = { recursive = true } })
end)

treesj.setup{}
