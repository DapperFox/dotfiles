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
nnoremap <silent> <leader>fj :%!jq '.'<CR>
