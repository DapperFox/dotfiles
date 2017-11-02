call plug#begin('~/.config/nvim/plugged')
" Interface
    Plug 'joshdick/onedark.vim'
    Plug 'vim-airline/vim-airline'
        let g:airline#extensions#tabline#enabled = 1
    Plug 'vim-airline/vim-airline-themes'
    Plug 'Yggdroot/indentLine'
        let g:indentLine_color_term = 233
        let g:indentLine_leadingSpaceEnabled = 1
        let g:indentLine_leadingSpaceChar = '.'
" Functionality
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'scrooloose/nerdtree'
    Plug 'scrooloose/nerdcommenter'
        let g:NERDSpaceDelims = 1
    Plug 'jistr/vim-nerdtree-tabs'
        map <C-t> :NERDTreeTabsToggle<Enter>
        let NERDTreeMinimalUI = 1
        let NERDTreeDirArrows = 1
        let NERDTreeAutoDeleteBuffer = 1
    Plug 'ctrlpvim/ctrlp.vim'
        let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
        nnoremap <Leader>b :CtrlPBuffer<CR>
    Plug 'mileszs/ack.vim'
    Plug 'ervandew/supertab'
    Plug 'airblade/vim-gitgutter'
    Plug 'jeetsukumaran/vim-buffergator'
    Plug 'tpope/vim-fugitive'
    Plug 'easymotion/vim-easymotion'
    Plug 'ervandew/supertab'
    Plug 'tpope/vim-unimpaired'
        let g:SuperTabDefaultCompletionType = "<c-n>"
" Syntax
    Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'carlitux/deoplete-ternjs'
        let g:tern#command = ["tern"]
        let g:tern#arguments = ["--persistent"]
        let g:tern_show_argument_hints = 'on_hold'
        let g:tern_show_signature_in_pum = 1
        let g:deoplete#sources#ternjs#tern_bin = '/Users/blake.bishop/.nvm/versions/node/v8.1.4/bin/tern'
        let g:deoplete#enable_at_startup = 1
        autocmd FileType javascript setlocal omnifunc=tern#Complete
    Plug 'sheerun/vim-polyglot'
    Plug 'mileszs/ack.vim'
      if executable('ag')
        let g:ackprg = 'ag --vimgrep'
      endif
    Plug 'ryanoasis/vim-devicons'
        let g:WebDevIconsUnicodeDecorateFolderNodes = 1
        let g:DevIconsEnableFoldersOpenClose = 1
        let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
        let g:webdevicons_enable_nerdtree = 0
    Plug 'neomake/neomake'
        " call neomake#configure#automake('rw', 1000)
    Plug 'jaawerth/neomake-local-eslint-first'
call plug#end()
