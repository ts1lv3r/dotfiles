-- Find files using Telescope command-line sugar.
for k, v in pairs({
  ['<Leader>ff'] = '<Cmd>Telescope find_files<CR>',
  ['<Leader>fg'] = '<Cmd>Telescope live_grep<CR>',
  ['<Leader>fb'] = '<Cmd>Telescope buffers<CR>',
  ['<Leader>fh'] = '<Cmd>Telescope help_tags<CR>',
  -- ['<Leader>fp'] = '<Cmd>Telescope projects<CR>',
  ['<Leader>gg'] = '<Cmd>Telescope git_status<CR>',
}) do
  vim.api.nvim_set_keymap('n', k, v, { noremap = true })
end

local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

-- telescope.load_extension('projects')
-- telescope.load_extension('media_files')

telescope.setup {
  defaults = {
    -- mappings = {
    --   i = {
    --     ["<C-h>"] = "which_key"
    --   },
    --   n = {
    --     ["<C-h>"] = "which_key"
    --   }
    -- },
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
    },
  },
  pickers = {
    find_files = {
      theme = "dropdown",
      hidden = true,
      search_dirs = { "." },
      prompt_prefix = "🔍 ",
    },
    live_grep = {
      theme = "dropdown",
      grep_open_files = false,
      search_dirs = { "." },
      prompt_prefix = "🔍 ",
    },
    git_status = {
      theme = "dropdown",
      prompt_prefix = "🔍 ",
    },
    buffers = {
      theme = "dropdown",
      prompt_prefix = "🔍 ",
    },
    help_tags = {
      theme = "dropdown",
      prompt_prefix = "🔍 ",
    },
  },
  extensions = {
    -- media_files = {
    --   -- filetypes whitelist
    --   -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
    --   filetypes = {"png", "webp", "jpg", "jpeg"},
    --   -- find command (defaults to `fd`)
    --   find_cmd = "fd"
    -- }
  }
}
