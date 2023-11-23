local status_ok, trouble = pcall(require, "trouble")
if not status_ok then
  return
end

vim.keymap.set("n", "<leader>xx", function() require("trouble").open() end)
vim.keymap.set("n", "<leader>xw", function() require("trouble").open("workspace_diagnostics") end)
vim.keymap.set("n", "<leader>xd", function() require("trouble").open("document_diagnostics") end)
vim.keymap.set("n", "<leader>xq", function() require("trouble").open("quickfix") end)
vim.keymap.set("n", "<leader>xl", function() require("trouble").open("loclist") end)
vim.keymap.set("n", "gR", function() require("trouble").open("lsp_references") end)

-- jump to the next item, skipping the groups
require("trouble").next({skip_groups = true, jump = true});
-- jump to the previous item, skipping the groups
require("trouble").previous({skip_groups = true, jump = true});
-- jump to the first item, skipping the groups
require("trouble").first({skip_groups = true, jump = true});
-- jump to the last item, skipping the groups
require("trouble").last({skip_groups = true, jump = true});

trouble.setup{}
