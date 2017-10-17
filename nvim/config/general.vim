if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif

syntax on
colorscheme onedark
filetype plugin on

set guifont=FuraCode\ Nerd\ Font\ Mono:h12
set clipboard=unnamed
set number

set ttyfast
set ignorecase
set smartcase
set smartindent
set expandtab
set nowrap
set autoread
set display=lastline
set backspace=indent,eol,start
set encoding=utf-8
set hlsearch
set incsearch
set langnoremap
set listchars=tab:>-,trail:-,nbsp:+
set wildmenu
set visualbell
set noerrorbells
set tabstop=4
set shiftwidth=4
set cursorline
" set lazyredraw

ca tn tabnew
ca th tabp
ca tl tabn
ca td tabclose

" Blink Cursor
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
  \,sm:block-blinkwait175-blinkoff150-blinkon175
