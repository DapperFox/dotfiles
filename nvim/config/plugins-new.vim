call plug#begin('~/.config/nvim/plugged')
" INTERFACE
" ----------------------------------------------------------
  Plug 'navarasu/onedark.nvim'
  Plug 'scrooloose/nerdtree'
      let g:NERDTreeWinPos = 'right'
      let NERDTreeNodeDelimiter = "\u263a"
  Plug 'scrooloose/nerdcommenter'
      let g:NERDSpaceDelims = 1
  Plug 'jistr/vim-nerdtree-tabs'
      map <Leader>r :NERDTreeFind<cr>
       " ^Find current file in tree
      map <C-t> :NERDTreeTabsToggle<Enter>
      let NERDTreeMinimalUI = 1
      let NERDTreeDirArrows = 1
      let NERDTreeAutoDeleteBuffer = 1
  Plug 'ryanoasis/vim-devicons'
      let g:WebDevIconsUnicodeDecorateFolderNodes = 1
      let g:DevIconsEnableFoldersOpenClose = 1
      let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
      let g:webdevicons_enable_nerdtree = 1
" FUNCTIONALITY
" ----------------------------------------------------------
  Plug 'romainl/vim-cool'
      let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
  Plug 'unblevable/quick-scope' " character highlight on f
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  Plug 'easymotion/vim-easymotion' " \\s for character search
  Plug 'terryma/vim-multiple-cursors'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'psliwka/vim-smoothie'
  Plug 'SirVer/ultisnips'
    let g:UltiSnipsExpandTrigger="<c-a>"
  Plug 'honza/vim-snippets'
" 0.5.0 FEATURES
" ----------------------------------------------------------
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
    nnoremap <C-p> <cmd>Telescope find_files<cr>
    nnoremap <leader>a <cmd>Telescope live_grep<cr>
    nnoremap <leader>b <cmd>Telescope buffers<cr>
  Plug 'neovim/nvim-lspconfig'
    hi LspDiagnosticsFloatingError guifg=#FF7663
    hi LspDiagnosticsVirtualTextError guifg=#FF63BE
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'hoob3rt/lualine.nvim'
  Plug 'hrsh7th/nvim-compe'
    set completeopt=menuone,noselect
call plug#end()
colorscheme onedark

luafile ~/.config/nvim/config/lua-config.lua
luafile ~/.config/nvim/config/lsp.lua
luafile ~/.config/nvim/config/completion.lua
