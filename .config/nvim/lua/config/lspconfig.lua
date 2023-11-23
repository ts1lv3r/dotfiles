local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

local _, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return
end

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

-- For document highlight
vim.opt.updatetime=300

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Document highlight
  if client.server_capabilities.documentHighlightProvider then
    vim.cmd [[
      hi! LspReferenceRead cterm=bold ctermbg=8 gui=bold guibg=#434343
      hi! LspReferenceText cterm=bold ctermbg=8 gui=bold guibg=#434343
      hi! LspReferenceWrite cterm=bold ctermbg=8 gui=bold guibg=#434343
    ]]
    vim.api.nvim_create_augroup('lsp_document_highlight', {})
    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
      group = 'lsp_document_highlight',
      buffer = 0,
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd('CursorMoved', {
      group = 'lsp_document_highlight',
      buffer = 0,
      callback = vim.lsp.buf.clear_references,
    })
  end

  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'I', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-i>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<leader>f', vim.lsp.buf.formatting, bufopts)
end

local lsp_flags = {
  debounce_text_changes = 150,
}

local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

local lsp_servers = {
  "clangd",
  "pyright",
  "bashls",
  "marksman",
  "rust_analyzer",
  "lua_ls",
  "tsserver",
  "dockerls",
  "docker_compose_language_service",
  "terraformls",
  "yamlls",
  "jsonls",
}

local util = require('lspconfig.util').path

for _, lsp_server in ipairs(lsp_servers) do
  if lsp_server == 'pyright' then
    lspconfig[lsp_server].setup {
      on_attach = on_attach,
      flags = lsp_flags,
      capabilities = capabilities,
      on_new_config = function(config, _)

        -- Use activated virtualenv.
        if vim.env.VIRTUAL_ENV then
          config.settings.python.pythonPath = util.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
        end

        -- Fallback to system Python.
        config.settings.python.pythonPath = vim.fn.exepath('python3') or vim.fn.exepath('python') or 'python'
      end,
    }
  elseif lsp_server == 'rust_analyzer' then
    lspconfig[lsp_server].setup {
      on_attach = on_attach,
      flags = lsp_flags,
      capabilities = capabilities,
      -- uti.root_pattern (a nil value)
      -- root_dir = util.root_pattern("Cargo.toml"),
      settings = {
        ['rust-analyzer'] = {
          cargo = {
              allFeatures = true,
              loadOutDirsFromCheck = true,
          },
          procMacro = {
            enable = true,
          }
        },
      },
    }
  elseif lsp_server == 'lua_ls' then
    lspconfig[lsp_server].setup {
      on_attach = on_attach,
      flags = lsp_flags,
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
              globals = { 'vim', 'use' }
          }
        }
      }
    }
  else
    lspconfig[lsp_server].setup {
      on_attach = on_attach,
      flags = lsp_flags,
      capabilities = capabilities
    }
  end
end
