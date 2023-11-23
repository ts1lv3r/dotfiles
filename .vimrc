" ----------
"  key bind
" ----------

" Default nop
vnoremap <Up> <nop>
vnoremap <Down> <nop>
vnoremap <Right> <nop>
vnoremap <Left> <nop>
vnoremap <BS> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Right> <nop>
inoremap <Left> <nop>
inoremap <BS> <nop>
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Right> <nop>
noremap <Left> <nop>
noremap <BS> <nop>
noremap <Space> <nop>

" Leader setting
let mapleader=" "

" Split View movekey bind
noremap <silent><C-h> <C-w>h
noremap <silent><C-j> <C-w>j
noremap <silent><C-k> <C-w>k
noremap <silent><C-l> <C-w>l

" Increasing movekey bind
nnoremap <S-h> 10<Left>
nnoremap <S-j> 10<Down>
nnoremap <S-k> 10<UP>
nnoremap <S-l> 10<Right>
vnoremap <S-h> 10<Left>
vnoremap <S-j> 10<Down>
vnoremap <S-k> 10<UP>
vnoremap <S-l> 10<Right>

" Home / End movekey bind
nnoremap <C-e> <End>

" Insert Mode movekey bind
inoremap <C-d> <BS>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-k> <Up>
inoremap <C-j> <Down>

" Other
noremap <S-y> y$
noremap <C-w>i [I
noremap <C-w>r :set relativenumber!<CR>
noremap <C-w>n :set nohlsearch!<CR>
noremap <C-w>w :set wrap!<CR>
noremap ss :split<CR><C-w>j
noremap sv :vsplit<CR><C-w>l

" Encode setting
set encoding=utf-8

" Editer setting
set number
set splitbelow
set splitright
set noequalalways
set wildmenu
set visualbell

" Cursorl setting
set ruler
set cursorline
set nocursorcolumn

" Tab setting
set tabstop=2
set shiftwidth=2
set lcs=tab:>.
set expandtab
set autoindent
set smartindent

" Search setting
set incsearch
set smartcase
set hlsearch

" Other setting
set list
set showmatch
set clipboard=unnamed
set noswapfile
set nobackup
set autoread
set hidden
set showcmd
set nowrap

" Resize window bind
nnoremap <C-w>h <C-w>5<
nnoremap <C-w>l <C-w>5>
nnoremap <C-w>k <C-w>5+
nnoremap <C-w>j <C-w>5-

" Terminal setting
noremap <Leader>t :terminal ++curwin<CR>
tnoremap <Esc> <C-\><C-n>

" Binary editor bind
nnoremap <C-w>b :set binary<CR>:%!xxd<CR>
nnoremap <C-w>bb :%!xxd -r<CR>

" Folding setting
set foldmethod=indent
set foldlevel=2
set foldcolumn=3

" Coding setting
inoremap [ []<LEFT>
inoremap { {}<LEFT>
inoremap {<Enter> {}<LEFT><CR><ESC><S-o>
inoremap ( ()<LEFT>
inoremap (<Enter> ()<LEFT><CR><ESC><S-o>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>

" Colorscheme setting
syntax enable
colorscheme torte
highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE
highlight LineNr ctermbg=NONE guibg=NONE
highlight Folded ctermbg=NONE guibg=NONE
highlight EndOfBuffer ctermbg=NONE guibg=NONE

" Filer setting
filetype plugin on
set nocp
let g:netrw_liststyle=3
let g:netrw_hide=0
let g:netrw_winsize=20
nnoremap sf :Ex<CR>

" Setup vim8 ----------
" $ yum install -y curl git make gcc ncurses-devel
" $ [ ! -d "/usr/local/src" ] && mkdir -p "/usr/local/src"
" $ cd /usr/local/src
" $ git clone https://github.com/vim/vim.git
" $ cd vim
" $ ./configure --disable-selinux --enable-cscope --enable-fontset --enable-gpm --enable-multibyte --enable-rubyinterp --enable-xim
" $ make
" $ make install
" done ----------------
