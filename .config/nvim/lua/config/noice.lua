local status_ok, noice = pcall(require, "noice")
if not status_ok then
  return
end

require("notify").setup({
  background_colour = "#000000",
})

vim.keymap.set(
  "n",
  "<leader>un",
  function()
    require("notify").dismiss({ silent = true, pending = true })
  end
)

noice.setup({
  cmdline = {
    enabled = true,
    view = "cmdline_popup", -- cmdline_popup, 
    opts = {},
    format = {},
  },
  
  -- messages = {},
  -- popupmenu = {},
  -- redirect = {},
  -- commands = {},
  -- notify = {},
  --
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
    -- bugfix/https[:]//github.com/folke/noice.nvim/issues/173
    signature = {
      enabled = false,
      auto_open = {
        enabled = true,
        trigger = true,
        luasnip = true,
        throttle = 50,
      },
      view = nil,
      opts = {},
    },
  },
  --
  -- markdown = {},
  -- health = {},
  -- smart_move = {},
  --
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = false, -- use a classic bottom cmdline for search
    command_palette = false, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
  --
  -- throttle = {},
  -- views = {},
  routes = {
    {
      filter = {
        event = "notify",
        find = "No information available",
      },
      opts = { skip = true },
    },
  },
  -- status = {},
  -- format = {},
  --
})
