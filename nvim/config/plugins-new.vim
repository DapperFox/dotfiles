Call plug#begin('~/.config/nvim/plugged')
" INTERFACE
" ----------------------------------------------------------
  Plug 'navarasu/onedark.nvim'
  " Plug 'arcticicestudio/nord-vim'
  Plug 'scrooloose/nerdtree'
      let g:NERDTreeWinPos = 'right'
      let NERDTreeNodeDelimiter = "\u263a"
      augroup nerdtree_open
          autocmd!
          autocmd VimEnter * NERDTree | wincmd p
      augroup END
  Plug 'scrooloose/nerdcommenter'
      let g:NERDSpaceDelims = 1
  Plug 'jistr/vim-nerdtree-tabs'
      map <Leader>r :NERDTreeFind<cr>
       " ^Find current file in tree
      map <C-t> :NERDTreeTabsToggle<Enter>
      let NERDTreeMinimalUI = 1
      let NERDTreeDirArrows = 1
      let NERDTreeAutoDeleteBuffer = 1
      let g:NERDTreeDirArrowExpandable = ''
      let g:NERDTreeDirArrowCollapsible = ''
  Plug 'ryanoasis/vim-devicons'
      let g:WebDevIconsUnicodeDecorateFolderNodes = 1
      let g:DevIconsEnableFoldersOpenClose = 1
      let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
      let g:webdevicons_enable_nerdtree = 1
" FUNCTIONALITY
" ----------------------------------------------------------
  Plug 'williamboman/mason.nvim'
  Plug 'williamboman/mason-lspconfig.nvim'
  Plug 'romainl/vim-cool'
      let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
  Plug 'unblevable/quick-scope' " character highlight on f
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  " Support github open with GBrowse
  Plug 'tpope/vim-rhubarb'
  Plug 'easymotion/vim-easymotion' " \\s for character search
  Plug 'terryma/vim-multiple-cursors'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'psliwka/vim-smoothie'
  Plug 'SirVer/ultisnips'
    let g:UltiSnipsExpandTrigger="<c-a>"
  Plug 'pantharshit00/vim-prisma'
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
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
  Plug 'hrsh7th/nvim-compe'
    set completeopt=menuone,noselect
  Plug 'hoob3rt/lualine.nvim'
  Plug 'tami5/lspsaga.nvim'
  Plug 'jose-elias-alvarez/null-ls.nvim'
  Plug 'github/copilot.vim'
  Plug 'terror/chatgpt.nvim'
    imap <silent><script><expr> <C-C> copilot#Accept("\<CR>")
    let g:copilot_no_tab_map = v:true
" cmp
  " Plug 'hrsh7th/cmp-nvim-lsp'
  " Plug 'hrsh7th/cmp-buffer'
  " Plug 'hrsh7th/cmp-path'
  " Plug 'hrsh7th/cmp-cmdline'
  " Plug 'hrsh7th/nvim-cmp'
call plug#end()
colorscheme onedark

lua << EOF
  local saga = require('lspsaga')
  saga.init_lsp_saga({
    code_action_icon = ''
  })

  local onedark = require('onedark')
  onedark.setup({
    style = 'darker'
  })
  onedark.load()

  require('mason').setup()
  require('mason-lspconfig').setup()
EOF

luafile ~/.config/nvim/config/lua-config.lua
luafile ~/.config/nvim/config/lsp.lua
luafile ~/.config/nvim/config/completion.lua
