" Run deoplete.nvim automatically
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_start_length=1

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
