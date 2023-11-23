local status_ok, registers = pcall(require, "registers")
if not status_ok then
  return
end

vim.api.nvim_set_keymap("n", "<leader>r", ":Registers<CR>", { noremap = true, silent = true })

registers.setup{
  register_user_command = true,
  -- Don't show whitespace at the begin and end of the register's content
  trim_whitespace = false,
  -- Don't show registers which are exclusively filled with whitespace
  hide_only_whitespace = true,
  bind_keys = {
    show = "*+\"-/_=%0123456789abcdefghijklmnopqrstuvwxyz",
    -- Show the window when pressing " in normal mode, applying the selected register as part of a motion, which is the default behavior of Neovim
    normal    = registers.show_window({ mode = "motion" }),
    -- Show the window when pressing " in visual mode, applying the selected register as part of a motion, which is the default behavior of Neovim
    visual    = registers.show_window({ mode = "motion" }),
    -- Show the window when pressing <C-R> in insert mode, inserting the selected register, which is the default behavior of Neovim
    insert    = registers.show_window({ mode = "insert" }),

    -- When pressing the key of a register, apply it with a very small delay, which will also highlight the selected register
    registers = registers.apply_register({ delay = 0.1 }),
    -- Immediately apply the selected register line when pressing the return key
    ["<CR>"]  = registers.apply_register(),
    -- Close the registers window when pressing the Esc key
    ["<Esc>"] = registers.close_window(),

    -- Move the cursor in the registers window down when pressing <C-n>
    ["<C-n>"] = registers.move_cursor_down(),
    -- Move the cursor in the registers window up when pressing <C-p>
    ["<C-p>"] = registers.move_cursor_up(),
    -- Move the cursor in the registers window down when pressing <C-j>
    ["<C-j>"] = registers.move_cursor_down(),
    -- Move the cursor in the registers window up when pressing <C-k>
    ["<C-k>"] = registers.move_cursor_up(),
    -- Clear the register of the highlighted line when pressing <DeL>
    ["<Del>"] = registers.clear_highlighted_register(),
    -- Clear the register of the highlighted line when pressing <BS>
    ["<BS>"]  = registers.clear_highlighted_register(),
},
  symbols = {
    -- Show a special character for line breaks
    newline = "⏎",
    -- Show space characters without changes
    space = " ",
    -- Show a special character for tabs
    tab = "·",
    -- The character to show when a register will be applied in a char-wise fashion
    register_type_charwise = "ᶜ",
    -- The character to show when a register will be applied in a line-wise fashion
    register_type_linewise = "ˡ",
    -- The character to show when a register will be applied in a block-wise fashion
    register_type_blockwise = "ᵇ",
  },
  window = {
    -- The window can't be wider than 100 characters
    max_width = 100,
    -- Show a small highlight in the sign column for the line the cursor is on
    highlight_cursorline = true,
    -- Don't draw a border around the registers window
    border = "none",
    -- Apply a tiny bit of transparency to the the window, letting some characters behind it bleed through
    transparency = 10,
  },
}
