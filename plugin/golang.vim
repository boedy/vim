" Go programming
"set rtp+=/usr/local/Cellar/go/1.0.3/misc/vim
" use goimports for formatting
let g:go_fmt_command = "goimports"

au Filetype go nmap <C-i> <C-]>
au Filetype go nnoremap <C-p> <C-o>

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

" turn highlighting on
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:syntastic_go_checkers = ['go', 'golint', 'errcheck']
let g:ale_linters = {'go': ['golint', 'errcheck']}

" Open go doc in vertical window, horizontal, or tab
au Filetype go nnoremap <leader>v :vsp <CR>:exe "GoDef" <CR>
au Filetype go nnoremap <leader>s :sp <CR>:exe "GoDef"<CR>
au Filetype go nnoremap <leader>t :tab split <CR>:exe "GoDef"<CR>

" deoplete-go settings
let g:deoplete#sources#go#gocode_binary = '~/projects/go/3rdparty/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#use_cache = 0
let g:deoplete#sources#go#json_directory = '~/.cache/deoplete/go/$GOOS_$GOARCH'
set noshowmode
let g:echodoc_enable_at_startup = 1
set completeopt+=noinsert
set completeopt+=
autocmd CompleteDone * pclose!

" [Tags] Command to generate tags file
let g:fzf_tags_command = '/usr/local/bin/gotags -R -f="tags" .'
