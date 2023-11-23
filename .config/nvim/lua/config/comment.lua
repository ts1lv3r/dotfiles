local status_ok, nvim_comment = pcall(require, "nvim_comment")
if not status_ok then
  return
end

nvim_comment.setup({
  -- Linters prefer comment and line to have a space in between markers
  marker_padding = true,
  -- should comment out empty or whitespace only lines
  comment_empty = true,
  -- trim empty comment whitespace
  comment_empty_trim_whitespace = true,
  -- Should key mappings be created
  create_mappings = true,
  -- Normal mode mapping left hand side
  line_mapping = "gcc",
  -- Visual/Operator mapping left hand side
  operator_mapping = "gc",
  -- text object mapping, comment chunk,,
  comment_chunk_text_object = "ic",
  -- Hook function to call before commenting takes place
  hook = function()
    if vim.api.nvim_buf_get_option(0, "filetype") == "c" then
      vim.api.nvim_buf_set_option(0, "commentstring", "// %s")
    end
  end
})
