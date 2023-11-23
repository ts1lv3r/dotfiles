-- open and close
vim.api.nvim_set_keymap(
  'n',
  '<C-b>',
  '<Cmd>Fern . -reveal=% -drawer -toggle -width=40<CR>',
  { noremap = true, silent = true }
)
-- open and move
-- vim.api.nvim_set_keymap(
--   'n',
--   '<C-b>',
--   '',
--   {
--     callback = function()
--       if vim.bo.filetype == "fern" then
--         vim.cmd.wincmd "p"
--       else
--         vim.cmd.Fern(".", "-reveal=%", "-drawer", "-width=40")
--       end
--     end,
--     noremap = true,
--     silent = true,
--   }
-- )

vim.api.nvim_set_keymap(
  'n',
  'sf',
  '<Cmd>Fern %:h<CR>',
  { noremap = true }
)

vim.api.nvim_set_var('fern#default_hidden', 1)
vim.api.nvim_set_var('fern#disable_default_mappings', 1)
vim.api.nvim_set_var('fern#renderer', 'nerdfont')

vim.api.nvim_create_augroup("fern-custom", {})
vim.api.nvim_create_autocmd("FileType", {
  group = "fern-custom",
  pattern = "fern",
  callback = function()
    -- custom command for fern.nvim
    vim.cmd [[
      nmap <buffer><expr>
        \ <Plug>(fern-my-expand-or-collapse)
        \ fern#smart#leaf(
        \   "\<Plug>(fern-action-collapse)",
        \   "\<Plug>(fern-action-expand)",
        \   "\<Plug>(fern-action-collapse)",
        \ )
    ]]

    for k, v in pairs({
      -- ['go'] = '<Plug>(fern-action-open:edit)',
      ['O'] = '<Plug>(fern-action-open:edit)<C-w>p',
      ['o'] = '<Plug>(fern-action-open:drop)',
      ['s'] = '<Plug>(fern-action-open:split)',
      ['v'] = '<Plug>(fern-action-open:vsplit)',
      ['N'] = '<Plug>(fern-action-new-file)',
      ['M'] = '<Plug>(fern-action-new-dir)',
      ['h'] = '<Plug>(fern-action-leave)',
      ['l'] = '<Plug>(fern-action-enter)',
      ['m'] = '<Plug>(fern-action-move)',
      ['r'] = '<Plug>(fern-action-rename)',
      ['d'] = '<Plug>(fern-action-remove)',
      -- ['D'] = '<Plug>(fern-action-diff:vsplit)',
      ['R'] = '<Plug>(fern-action-reload)',
      -- ['gg'] = '<Plug>(fern-action-grep)',
      ['c'] = '<Plug>(fern-action-clipboard-copy)',
      ['p'] = '<Plug>(fern-action-clipboard-paste)',
      ['q'] = '<Cmd>quit<CR>',
      -- ['<C-b>'] = '<Cmd>quit<CR>',
      ['z'] = '<Plug>(fern-action-hidden:toggle)',
      ['<CR>'] = '<Plug>(fern-my-expand-or-collapse)',
    }) do
      vim.api.nvim_buf_set_keymap(0, 'n', k, v, {})
    end
  end
})
