# Noremap Memo

### Base
* `<C-w>n` :new
* `<C-w>s` :split
* `<C-w>v` :vsplit
* `<C-w>c` :close
* `<C-w>o` :close all
* \\`<C-w>w` :go next
* \\`<C-w>p` :go previous

### Extend
* `<C-w>j`  :move under pain
* `<C-w>k`  :move avobe pain
* `<C-w>h`  :move left pain
* `<C-w>l`  :move right pain
* `<C-w>t`  :terminal
* `<C-w>n`  :set nohlsearch!
* `<C-w>i`  :
* `<C-w>b`  :set binary && %!xxd
* `<C-w>bb` :%!xxd -r
* `<C-w>r`  :set relativenumber!

### Jump Definition with coc.vim
* `gd`   : jumpDefinition
* `<C-o>`: Back to source position

### Folding
* `zi`: valid/invalid

> fold under the cursol
* `zc`: close one
* `zo`: open one
* `zO`: open all

> fold in whole file
* `zm`: close one
* `zM`: close all
* `zr`: open one
* `zR`: open all

> jump with fold
* `zj`: move to the next fold
* `zk`: move to the previous fold

### V-mode
* `gc`: commentout in multilines

### FZF (on terminal)
* `<C-t>`: Find files
* `<C-r>`: Find commands
* `<A-c>`: ~~tmux keybindings overlap~~

### Other
* `:Mason`: mason.nvim
* `:LspInfo`: Lsp Information
* `:LspLog`: Lsp Error Log
* `:verbose [map] [keybindings]`: check keybindings to set
