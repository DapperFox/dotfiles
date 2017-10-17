call plug#begin('~/.config/nvim/plugged')
" Interface
  Plug 'https://github.com/joshdick/onedark.vim.git'
  Plug 'https://github.com/ntpeters/vim-better-whitespace.git'
  Plug 'https://github.com/Yggdroot/indentLine.git'
  Plug 'https://github.com/vim-airline/vim-airline.git'
  Plug 'https://github.com/vim-airline/vim-airline-themes.git'
  Plug 'https://github.com/yuttie/comfortable-motion.vim.git'
  Plug 'https://github.com/mhinz/vim-startify.git'
" Functionality
  Plug 'https://github.com/scrooloose/nerdtree.git'
  Plug 'https://github.com/easymotion/vim-easymotion.git'
  Plug 'https://github.com/tpope/vim-fugitive.git'
  Plug 'https://github.com/tpope/vim-surround.git'
  Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
  Plug 'https://github.com/scrooloose/nerdcommenter.git'
  Plug 'https://github.com/jistr/vim-nerdtree-tabs.git'
  Plug 'https://github.com/tpope/vim-unimpaired.git'
  Plug 'https://github.com/terryma/vim-multiple-cursors.git'
  Plug 'https://github.com/mileszs/ack.vim.git'
  Plug 'https://github.com/ervandew/supertab.git'
  Plug 'https://github.com/airblade/vim-gitgutter.git'
  Plug 'https://github.com/christoomey/vim-tmux-navigator.git'
  Plug 'https://github.com/tpope/vim-repeat.git'
  Plug 'https://github.com/jeetsukumaran/vim-buffergator.git'
  Plug 'https://github.com/ryanoasis/vim-devicons.git'
" Syntax Checking
  Plug 'neomake/neomake'
  Plug 'benjie/neomake-local-eslint.vim'
" Syntax
  Plug 'https://github.com/cakebaker/scss-syntax.vim.git'
  Plug 'https://github.com/sheerun/vim-polyglot.git'
" Autocomplete
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'https://github.com/ternjs/tern_for_vim.git', { 'do': 'npm install' }
  Plug 'https://github.com/carlitux/deoplete-ternjs.git'
  Plug 'MarcWeber/vim-addon-mw-utils'
  Plug 'tomtom/tlib_vim'
  Plug 'garbas/vim-snipmate'
  Plug 'grvcoelho/vim-javascript-snippets'
call plug#end()

let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
let g:tern_show_argument_hints = 'on_hold'
let g:tern_show_signature_in_pum = 1
let g:deoplete#sources#ternjs#tern_bin = '/Users/blake.bishop/.nvm/versions/node/v8.1.4/bin/tern'

autocmd FileType javascript setlocal omnifunc=tern#Complete
