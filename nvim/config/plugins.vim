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
    Plug 'ervandew/supertab'
    Plug 'airblade/vim-gitgutter'
    Plug 'jeetsukumaran/vim-buffergator'
    Plug 'tpope/vim-fugitive'
    Plug 'easymotion/vim-easymotion'
    Plug 'ervandew/supertab'
    Plug 'tpope/vim-unimpaired'
        let g:SuperTabDefaultCompletionType = "<c-n>"
    Plug 'terryma/vim-multiple-cursors'
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'andrewradev/linediff.vim'
" Syntax
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'sheerun/vim-polyglot'
        let g:jsx_ext_required = 0
    Plug 'jremmen/vim-ripgrep'
    Plug 'ryanoasis/vim-devicons'
        let g:WebDevIconsUnicodeDecorateFolderNodes = 1
        let g:DevIconsEnableFoldersOpenClose = 1
        let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
        let g:webdevicons_enable_nerdtree = 0
    Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
        " Automatically start language servers.
        let g:LanguageClient_autoStart = 1
        set hidden

        " Minimal LSP configuration for JavaScript
        let g:LanguageClient_serverCommands = {}
        if executable('javascript-typescript-stdio')
          let g:LanguageClient_serverCommands.javascript = ['javascript-typescript-stdio']
          " Use LanguageServer for omnifunc completion
          autocmd FileType javascript setlocal omnifunc=LanguageClient#complete
        else
          echo "javascript-typescript-stdio not installed!\n"
          :cq
        endif
    Plug 'junegunn/fzf'
    Plug 'roxma/nvim-completion-manager'
    Plug 'roxma/nvim-cm-tern',  {'do': 'npm install'}
    Plug 'mattn/emmet-vim'
    " Plug 'vim-syntastic/syntastic'
        " set statusline+=%#warningmsg#
        " set statusline+=%{SyntasticStatuslineFlag()}
        " set statusline+=%*
        " let g:syntastic_always_populate_loc_list = 1
        " let g:syntastic_auto_loc_list = 1
        " let g:syntastic_check_on_open = 1
        " let g:syntastic_check_on_wq = 0
        " let g:syntastic_javascript_checkers = ['eslint']
        " let g:syntastic_html_checkers = []
        " let g:syntastic_javascript_eslint_exec = 'npm run lint:js --'
    Plug 'kristijanhusak/vim-carbon-now-sh'
call plug#end()

" <leader>ld to go to definition
autocmd FileType javascript nnoremap <buffer>
  \ <leader>ld :call LanguageClient_textDocument_definition()<cr>
" <leader>lh for type info under cursor
autocmd FileType javascript nnoremap <buffer>
  \ <leader>lh :call LanguageClient_textDocument_hover()<cr>
" <leader>lr to rename variable under cursor
autocmd FileType javascript nnoremap <buffer>
  \ <leader>lr :call LanguageClient_textDocument_rename()<cr>
" <leader>lf to fuzzy find the symbols in the current document
autocmd FileType javascript nnoremap <buffer>
  \ <leader>lf :call LanguageClient_textDocument_documentSymbol()<cr>
