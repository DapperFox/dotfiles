call plug#begin('~/.config/nvim/plugged')
" INTERFACE
" ----------------------------------------------------------
  Plug 'navarasu/onedark.nvim'
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
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
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
  Plug 'pantharshit00/vim-prisma'
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
  Plug 'hrsh7th/nvim-compe'
    set completeopt=menuone,noselect
  Plug 'hoob3rt/lualine.nvim'
  Plug 'tami5/lspsaga.nvim'
call plug#end()
colorscheme onedark

luafile ~/.config/nvim/config/lua-config.lua
luafile ~/.config/nvim/config/lsp.lua
luafile ~/.config/nvim/config/completion.lua

lua << EOF
  local saga = require 'lspsaga'
  saga.init_lsp_saga({
    code_action_icon = ''
  })
EOF

nnoremap <silent><leader>cf :Lspsaga lsp_finder<CR>
nnoremap <silent><leader>ca :Lspsaga code_action<CR>
vnoremap <silent><leader>cc :<C-U>Lspsaga range_code_action<CR>
nnoremap <silent><leader>ch :Lspsaga hover_doc<CR>
nnoremap <silent><C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
nnoremap <silent><C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
nnoremap <silent><leader>cs :Lspsaga signature_help<CR>
nnoremap <silent><leader>cr :Lspsaga rename<CR>
nnoremap <silent><leader>cp:Lspsaga preview_definition<CR>
nnoremap <silent> <leader>cd :Lspsaga show_line_diagnostics<CR>
nnoremap <silent> [e :Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> ]e :Lspsaga diagnostic_jump_prev<CR>
nnoremap <silent> <leader>cot :Lspsaga open_floaterm<CR>
tnoremap <silent> <leader>cct <C-\><C-n>:Lspsaga close_floaterm<CR>
