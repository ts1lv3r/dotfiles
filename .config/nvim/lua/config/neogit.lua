vim.api.nvim_set_keymap(
  'n',
  '<leader>ng',
  '<Cmd>Neogit<CR>',
  { noremap = true }
)

local status_ok, neogit = pcall(require, "neogit")
if not status_ok then
  return
end

neogit.setup{}
