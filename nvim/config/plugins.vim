call plug#begin('~/.config/nvim/plugged')
" Interface
    Plug 'joshdick/onedark.vim'
    Plug 'vim-airline/vim-airline'
        let g:airline#extensions#tabline#enabled = 1
        let g:airline#extensions#tabline#formatter = 'jsformatter'
        let g:airline_powerline_fonts = 1
        let g:airline#extensions#tabline#show_buffers = 0
        let g:airline#extensions#ale#enabled = 1
    Plug 'vim-airline/vim-airline-themes'
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
    Plug 'ryanoasis/vim-devicons'
        let g:WebDevIconsUnicodeDecorateFolderNodes = 1
        let g:DevIconsEnableFoldersOpenClose = 1
        let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
        let g:webdevicons_enable_nerdtree = 1
" Functionality
    Plug 'k0kubun/vim-open-github'
    Plug 'romainl/vim-cool'
        let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
    Plug 'unblevable/quick-scope'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'ctrlpvim/ctrlp.vim'
        let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
        let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
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
    Plug 'mileszs/ack.vim'
      let g:ackprg = 'rg --vimgrep --no-heading'
      cnoreabbrev Ack Ack!
      nnoremap <Leader>a :Ack!<Space>
    Plug 'mattn/emmet-vim'
    Plug 'kristijanhusak/vim-carbon-now-sh'
    Plug 'SirVer/ultisnips'
" Syntax
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
        call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })
        let g:go_highlight_extra_types = 1
        let g:go_highlight_operators = 1
        let g:go_highlight_functions = 1
        let g:go_highlight_function_parameters = 1
        let g:go_highlight_function_calls = 1
        let g:go_highlight_types = 1
        let g:go_highlight_fields = 1
        let g:go_highlight_build_constraints = 1
        let g:go_highlight_generate_tags = 1
        let g:go_highlight_variable_declarations = 1
        let g:go_highlight_variable_assignments = 1
    Plug 'sheerun/vim-polyglot'
        let g:vim_jsx_pretty_colorful_config = 1
        let g:jsx_ext_required = 0
    Plug 'junegunn/fzf'
    Plug 'othree/javascript-libraries-syntax.vim'
        let g:used_javascript_libs = 'react,ramda,underscore'
    Plug 'othree/yajs'
    Plug 'Shougo/neco-syntax'
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
      inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')

      " c-j c-k for moving in snippet
      let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
      let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
      let g:UltiSnipsRemoveSelectModeMappings = 0

    Plug 'jsfaint/ncm2-syntax'
" Linting
    Plug 'autozimu/LanguageClient-neovim', {
        \ 'branch': 'next',
        \ 'do': 'bash install.sh',
        \ }
        " Automatically start language servers.
        set hidden
        let g:LanguageClient_useVirtualText = "No"

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
        let g:LanguageClient_diagnosticsList = "Disabled"
        let g:LanguageClient_diagnosticsDisplay = {
          \1: {
            \"name": "Error",
            \"texthl": "ALEError",
            \"signText": "⍟",
            \"signTexthl": "ALEErrorSign",
            \"virtualTexthl": "Error",
          \},
          \2: {
            \"name": "Warning",
            \"texthl": "ALEWarning",
            \"signText": "⚠",
            \"signTexthl": "ALEWarningSign",
            \"virtualTexthl": "Todo",
          \},
          \3: {
            \"name": "Information",
            \"texthl": "ALEInfo",
            \"signText": "ℹ",
            \"signTexthl": "ALEInfoSign",
            \"virtualTexthl": "Todo",
          \},
          \4: {
            \"name": "Hint",
            \"texthl": "ALEInfo",
            \"signText": "➤",
            \"signTexthl": "ALEInfoSign",
            \"virtualTexthl": "Todo",
          \},
        \}
    Plug 'dense-analysis/ale'
      let g:ale_fixers = {'javascript': ['prettier_standard']}
      let g:ale_linters = {'javascript': ['']}
      let g:ale_fix_on_save = 1
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
