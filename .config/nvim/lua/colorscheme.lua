vim.cmd [[
  try
    colorscheme carbonfox
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme torte
    set background=dark
  endtry
]]
