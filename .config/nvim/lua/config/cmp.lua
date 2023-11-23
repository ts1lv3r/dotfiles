local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
  return
end

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },

  -- mapping = cmp.mapping.preset.insert({
  -- }),
  mapping = {
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-e>'] = cmp.mapping.close(),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-j>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ['<C-k>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
    ['<CR>'] = function(fallback)
      if cmp.visible() then
        cmp.confirm({ select = true })
      else
        fallback()
      end
    end,
    ['<C-p>'] = cmp.mapping(function (fallback)
      if require('luasnip').expand_or_jumpable() then
        require('luasnip').expand_or_jump()
      else
        fallback()
      end
    end, {"i", "s"}),
    ['<C-n>'] = cmp.mapping(function (fallback)
      if require('luasnip').choice_active() then
        require('luasnip').change_choice(1)
      else
        fallback()
      end
    end, {"i", "s"}),
  },

  formatting = {
    format = require("lspkind").cmp_format({
      mode = 'symbol', -- show only symbol annotations
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      before = function(entry, vim_item)
        vim_item.menu = ({
          nvim_lsp = "[lsp]",
          path = "[path]",
          luasnip = "[snip]",
          buffer = "[buf]",
        })[entry.source.name]
        return vim_item
      end,
    }),
  },

  -- sources = cmp.config.sources({
  -- }, {
  --   { name = 'spell' },
  -- }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'luasnip',
      option = { use_show_condition = false }
    },
    { name = 'buffer',
      option = {
        get_bufnrs = function ()
          return vim.api.nvim_list_bufs()
        end
      },
    },
  },

  completion = {
    keyword_length = 1,
    completeopt = "menu,noselect"
  }
})

-- Set configuration for specific filetype.
-- cmp.setup.filetype('gitcommit', {
--   sources = cmp.config.sources({
--     { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
--   }, {
--     { name = 'buffer' },
--   })
-- })

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
