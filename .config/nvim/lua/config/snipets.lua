local status_ok, luasnip = pcall(require, "luasnip")
if not status_ok then
  return
end

local snip = luasnip.snippet
-- local node = luasnip.snippet_node
local text = luasnip.text_node
local insert = luasnip.insert_node
local func = luasnip.function_node
local choice = luasnip.choice_node
-- local dynamicn = luasnip.dynamic_node

local function get_today()
  return { os.date('%Y-%m-%d') }
end

local function get_only_filename()
  local filename = vim.fn.expand('%:t:r')
  return { filename:upper() }
end

luasnip.add_snippets(nil, {
  all = {
    snip(
      {
        trig = "#date",
        namr = "Date",
        dscr = "Date in the form of YYYY-MM-DD",
      }, {
        func(get_today, {}),
      }
    ),
    snip(
      {
        trig = "#choice_sample",
        dscr = "Choice between stuffs",
      }, {
        choice(1, {
          text({"First"}),
          text({"Second"}),
          text({"Third"}),
          -- insert(nil, {"Second"}),
          -- func(function(args) return {"Third"} end, {}),
        }),
        insert(0)
      }
    ),
  },
  python = {
    snip(
      {
        trig = "#py_main",
      }, {
        text({
          "if __name__ == '__main__':",
          "    main()",
        })
      }
    ),
    snip(
      {
        trig = "#py_time",
      }, {
        text({
          "import time",
          "def time_performance(func):",
          "    def wrapper():",
          "        start = time.perf_counter()",
          "        func()",
          "        print('>> {}[s]'.format(time.perf_counter()-start))",
          "    return wrapper",
        })
      }
    ),
  },
  c = {
    snip(
      {
        trig = "#c_initialize",
        namr = "C Initialize",
        dscr = "C Program Initialization",
      }, {
        text({
          "#include <stdio.h>",
          "",
          "int main(int argc, char* argv[])",
          "{",
          "  printf(\"Hello World!\\n\");",
          "  return 0;",
          "}",
        })
      }
    ),
  },
  cpp = {
    snip(
      {
        trig = "#c_header_file",
        dscr = "Initialization header file in C",
      }, {
        text("#ifndef "), func(get_only_filename, {}), text("_H_"),
        text({"", "#define "}), func(get_only_filename, {}), text("_H_"),
        text({"", "", ""}), insert(0),
        text({"", "", "#endif"})
      }
    ),
  },
  html = {
    snip(
      {
        trig = "#html_initialize",
        namr = "Html Initialize",
        dscr = "Initialization for HTML",
      }, {
        text({
          "<!DOCTYPE html>",
          "<html>",
          "  <head>",
          "    <meta charset='utf-8'>",
          "    <meta name='' content=''>",
          "    <title>TAB_TITLE</title>",
          "    <link rel='stylesheet' href=''>",
          "    <script src='' crossorigin='anonymous'></script>",
          "    <link rel='icon' type='image/x-icon' href=''>",
          "  </head>",
          "  <body>",
          "    <h1 id='title'>TITLE</h1>",
          "    <hr>",
          "    <div>",
          "      <a href=''>LINK</a>",
          "    </div>",
          "    <script src='js/style.js'></script>",
          "  </body>",
          "</html>",
        })
      }
    )
  },
  markdown = {
    snip(
      {
        trig = "#link",
        dscr = "Create markdown link",
      }, {
        text('['), insert(1), text(']('), insert(2), text(')'), insert(0),
      }
    ),
    snip(
      {
        trig = "#check_list",
        dscr = "Create check lists",
      }, {
        text('- [x] '), insert(1),
        text({'', '- [ ] '}), insert(2),
        text({'', '- [ ] '}), insert(0),
      }
    ),
  },
  make = {
    snip(
      {
        trig = "#makefile",
        dscr = "Standart makefile for c project"
      }, {
        text('TARGET = '), insert(1),
        text({'', '', 'CC = gcc'}),
        text({'', 'LD = ld'}),
        text({'', 'AS = nasm'}),
        text({'', 'CFLAGS += '}),
        text({'', 'LDFAGS += '}),
        text({'', '', '.PHONY: all'}),
        text({'', 'all :'}),
        text({'', '  make $(TARGET)'}),
        text({'', '', '%.o : %.c Makefile'}),
        text({'', '  $(CC) $(CFLAGS) -c $<'}),
        text({'', '', '%.bin : %.o Makefile'}),
        text({'', '  $(LD) $(LDFLAGS) -o $@ $<'}),
      }
    )
  },
  yar, yara = {
    snip(
      {
        trig = "#yara_init",
        dscr = "Initialization YARA"
      }, {
        text('rule '), insert(1, "RULE_NAME"),
        text({'', '{'}),
        text({'', '  meta:'}),
        text({'', '    author = "'}), insert(2), text('"'),
        text({'', '    create_date = "'}), func(get_today, {}), text('"'),
        text({'', '    modified_date = "'}), func(get_today, {}), text('"'),
        text({'', '    hash1 = "'}), insert(3), text('"'),
        text({'', '    description = "'}), insert(4), text('"'),
        text(''),
        text({'', '  strings:'}),
        text({'', '    $keyword = '}), insert(0),
        text(''),
        text({'', '  condition:'}),
        text({'', '    $keyword'}),
        text({'', '}'}),
      }
    )
  },
})
