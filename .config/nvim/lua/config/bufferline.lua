local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

vim.api.nvim_set_keymap("n", "<leader>bn", ":bnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>bb", ":bNext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>bd", ":bdelete<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>br", ":BufferLineCloseRight<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>bl", ":BufferLineCloseLeft<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>bo", ":BufferLineCloseOthers<CR>", { noremap = true, silent = true })

bufferline.setup{
  options = {
    style_preset = bufferline.style_preset.default,
    numbers = 'ordinal',
    diagnostics = 'nvim_lsp',
    diagnostics_update_in_insert = false,
    seperator_style = 'thin',
    show_tab_indicators = true,
    show_buffer_close_icons = false,
    -- buffer_close_icon = "",
    show_close_icon = false,
    -- close_icon = "",
    -- normal_formatter = function(buf)
    --   name                | str        | the basename of the active file
    --   path                | str        | the full path of the active file
    --   bufnr (buffer only) | int        | the number of the active buffer
    --   buffers (tabs only) | table(int) | the numbers of the buffers in the tab
    --   tabnr (tabs only)   | int        | the "handle" of the tab, can be converted to
    --                                      its ordinal number using: `vim.api.nvim_tabpage_get_number(buf.tabnr)`
    -- end,
    diagnostics_indicator = function(count, level)
      local icon = level:match("error") and " " or " "
      return icon .. count
    end,
    -- color_icons = false, -- whether or not to add the filetype icon highlights
  },
}
