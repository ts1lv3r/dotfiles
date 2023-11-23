-- https://github.com/jackMort/ChatGPT.nvim

local status_ok, chatgpt = pcall(require, "chatgpt")
if not status_ok then
  return
end

vim.api.nvim_set_keymap("n", "<leader>cg", ":ChatGPT<CR>", { noremap = true })

vim.api.nvim_set_keymap("n", "<leader>cc", ":ChatGPTCompleteCode<CR>", { noremap = true })

vim.api.nvim_set_keymap("n", "<leader>cr", ":ChatGPTRun ", { noremap = true })
vim.api.nvim_set_keymap("v", "<leader>cr", ":ChatGPTRun ", { noremap = true })

vim.api.nvim_set_keymap("n", "<leader>ca", ":ChatGPTActAs<CR>", { noremap = true, silent=true })

vim.api.nvim_set_keymap("n", "<leader>ci", ":ChatGPTEditWithInstructions<CR>", { noremap = true })
vim.api.nvim_set_keymap("v", "<leader>ci", ":ChatGPTEditWithInstructions<CR>", { noremap = true })

chatgpt.setup({
  api_key_cmd = nil,
  yank_register = "+",
  edit_with_instructions = {
    diff = false,
    keymaps = {
      close = "<C-c>",
      accept = "<C-y>",
      toggle_diff = "<C-d>",
      toggle_settings = "<C-o>",
      cycle_windows = "<Tab>",
      use_output_as_input = "<C-i>",
    },
  },
  chat = {
    -- welcome_message = WELCOME_MESSAGE,
    loading_text = "Loading, please wait ...",
    question_sign = "", -- 🙂
    answer_sign = "ﮧ", -- 🤖
    max_line_length = 120,
    sessions_window = {
      border = {
        style = "rounded",
        text = {
          top = " Sessions ",
        },
      },
      win_options = {
        winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
      },
    },
    keymaps = {
      close = { "<C-c>" },
      yank_last = "<C-y>",
      yank_last_code = "<C-k>",
      scroll_up = "<C-u>",
      scroll_down = "<C-d>",
      new_session = "<C-n>",
      cycle_windows = "<Tab>",
      cycle_modes = "<C-f>",
      next_message = "<C-j>",
      prev_message = "<C-k>",
      select_session = "<Space>",
      rename_session = "r",
      delete_session = "d",
      draft_message = "<C-d>",
      edit_message = "e",
      delete_message = "d",
      toggle_settings = "<C-o>",
      toggle_message_role = "<C-r>",
      toggle_system_role_open = "<C-s>",
      stop_generating = "<C-x>",
    },
  },
  popup_layout = {
    default = "center",
    center = {
      width = "80%",
      height = "80%",
    },
    right = {
      width = "30%",
      width_settings_open = "50%",
    },
  },
  popup_window = {
    border = {
      highlight = "FloatBorder",
      style = "rounded",
      text = {
        top = " ChatGPT ",
      },
    },
    win_options = {
      wrap = true,
      linebreak = true,
      foldcolumn = "1",
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
    },
    buf_options = {
      filetype = "markdown",
    },
  },
  system_window = {
    border = {
      highlight = "FloatBorder",
      style = "rounded",
      text = {
        top = " SYSTEM ",
      },
    },
    win_options = {
      wrap = true,
      linebreak = true,
      foldcolumn = "2",
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
    },
  },
  popup_input = {
    prompt = "  ",
    border = {
      highlight = "FloatBorder",
      style = "rounded",
      text = {
        top_align = "center",
        top = " Prompt ",
      },
    },
    win_options = {
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
    },
    submit = "<C-Enter>",
    submit_n = "<Enter>",
    max_visible_lines = 20,
  },
  settings_window = {
    border = {
      style = "rounded",
      text = {
        top = " Settings ",
      },
    },
    win_options = {
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
    },
  },
  openai_params = {
    model = "gpt-3.5-turbo-16k",
    -- -2.0 ~ 2.0
    -- 生成された文章が同じ単語やフレーズを繰り返すことが少なくなり、より多様な文章を生成することができる
    -- frequency_penaltry = 0,
    -- -2.0 ~ 2.0
    -- この値が大きくなるほど新しいトピックについて話すようになる
    -- presence_penaltry = 0,
    -- 生成されるレスポンスのトークンの最大数
    max_tokens = 10000,
    -- 0 ~ 1
    -- 高いサンプリング温度では、出現確率が均一化され、より多様な文章が生成される傾向
    -- temperature = 0,
    -- 0 ~ 1
    -- 低いほど正確性、高いほど曖昧性
    -- top_p = 1,
    -- 回答の数
    n = 1
  },
  openai_edit_params = {
    model = "gpt-3.5-turbo-16k",
    frequency_penalty = 0,
    presence_penalty = 0,
    temperature = 0,
    top_p = 1,
    n = 1,
  },
  use_openai_functions_for_edits = false,
  actions_paths = {},
  show_quickfixes_cmd = "Trouble quickfix",
  predefined_chat_gpt_prompts = "https://raw.githubusercontent.com/f/awesome-chatgpt-prompts/main/prompts.csv",
})
