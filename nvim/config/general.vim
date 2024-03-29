let g:nvcode_termcolors=256
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
  hi LineNr ctermbg=NONE guibg=NONE
endif
" Legit have no idea what the `hi` command does
syntax on
filetype plugin on

set guifont=FiraCode\ Nerd\ Font\ Mono:h14
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
set tabstop=2
set shiftwidth=2
set iskeyword+=\-
set lazyredraw
" Disables mouse interaction
set mouse=

ca tn tabnew
ca th tabp
ca tl tabn
ca td tabclose

nnoremap <silent> <C-c> :nohl<CR><C-c>
nmap ,cs :let @*=expand("%")<CR>
nmap ,cl :let @*=expand("%:p")<CR>

" Hard versions here, probably will break any moment
let g:python_host_prog='/Users/dapperfox/.pyenv/versions/2.7.18/bin/python'
let g:python3_host_prog='/Users/dapperfox/.pyenv/versions/3.10.2/bin/python'
let g:ruby_host_prog = '/usr/local/bin/neovim-ruby-host'

" for gf file go to
set path=.,src
set suffixesadd=.js,.jsx

function! LoadMainNodeModule(fname)
    let nodeModules = "./node_modules/"
    let packageJsonPath = nodeModules . a:fname . "/package.json"

    if filereadable(packageJsonPath)
        return nodeModules . a:fname . "/" . json_decode(join(readfile(packageJsonPath))).main
    else
        return nodeModules . a:fname
    endif
endfunction

set includeexpr=LoadMainNodeModule(v:fname)
