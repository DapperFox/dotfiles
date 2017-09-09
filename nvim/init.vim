source $HOME/.config/nvim/config/plugins.vim
source $HOME/.config/nvim/config/vue.vim

if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
endif

syntax on
colorscheme onedark
set guifont=FuraCode\ Nerd\ Font\ Mono:h12
filetype plugin on

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1
let g:webdevicons_enable_nerdtree = 0

let g:NERDSpaceDelims = 1

let g:deoplete#enable_at_startup = 1

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

let g:indentLine_color_term = 233
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '.'
let g:SuperTabDefaultCompletionType = "<c-n>"
if executable('ag')
  let g:ackprg = 'ag --vimgrep --smart-case'
endif

cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack
vnoremap <C-s> y:Ack! <C-r>=fnameescape(@")<CR><CR>
nnoremap <C-s> y:Ack! 

ca tn tabnew
ca th tabp
ca tl tabn
ca td tabclose

set clipboard=unnamedplus
set number

set ignorecase
set smartcase
set smartindent
set expandtab
set nowrap

map <C-t> :NERDTreeToggle<Enter>
nnoremap <silent> <s-tab> :wincmd W<cr>
nnoremap <silent> <tab> :wincmd w<cr>
nnoremap <Leader>b :CtrlPBuffer<CR>

" Blink Cursor
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
  \,sm:block-blinkwait175-blinkoff150-blinkon175
