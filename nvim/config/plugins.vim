call plug#begin('~/.config/nvim/plugged')
" Interface
    Plug 'joshdick/onedark.vim'
    Plug 'vim-airline/vim-airline'
        let g:airline#extensions#tabline#enabled = 1
        let g:airline#extensions#tabline#formatter = 'jsformatter'
        let g:airline_powerline_fonts = 1
        let g:airline#extensions#tabline#show_buffers = 0
    Plug 'vim-airline/vim-airline-themes'
" Functionality
    Plug 'romainl/vim-cool'
        let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
    Plug 'unblevable/quick-scope'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'scrooloose/nerdtree'
        let g:NERDTreeWinPos = 'right'
        let NERDTreeNodeDelimiter = "\u263a"
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
    Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'sheerun/vim-polyglot'
        let g:jsx_ext_required = 0
    Plug 'jremmen/vim-ripgrep'
    Plug 'ryanoasis/vim-devicons'
        let g:WebDevIconsUnicodeDecorateFolderNodes = 1
        let g:DevIconsEnableFoldersOpenClose = 1
        let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
        let g:webdevicons_enable_nerdtree = 1
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
    Plug 'othree/javascript-libraries-syntax.vim'
        let g:used_javascript_libs = 'react,ramda'
    Plug 'othree/yajs'
" NCM2
    Plug 'roxma/nvim-yarp'
    Plug 'ncm2/ncm2'
        autocmd BufEnter * call ncm2#enable_for_buffer()
        set completeopt=noinsert,menuone,noselect
    Plug 'ncm2/ncm2-bufword'
    Plug 'ncm2/ncm2-tmux'
    Plug 'ncm2/ncm2-path'
    Plug 'ncm2/ncm2-tern',  {'do': 'npm install'}
    Plug 'ncm2/ncm2-cssomni'

    Plug 'ncm2/ncm2-ultisnips'
    Plug 'SirVer/ultisnips'
      inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')

      " c-j c-k for moving in snippet
      let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
      let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
      let g:UltiSnipsRemoveSelectModeMappings = 0

    Plug 'jsfaint/ncm2-syntax'
    Plug 'Shougo/neco-syntax'

    Plug 'mattn/emmet-vim'
    Plug 'kristijanhusak/vim-carbon-now-sh'
    Plug 'w0rp/ale'
        let g:ale_linters = {'javascript': ['standard']}
        au FileType javascript set formatprg=prettier-standard
    Plug 'jparise/vim-graphql'
    Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
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
