set nocompatible
filetype off

set rtp+=~/.vim/bundle/.vundle/
call vundle#rc()

" Let Vundle manage Vundle
Bundle 'gmarik/vundle'

" My Bundles
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'nanotech/jellybeans.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'rking/ag.vim'
Bundle 'kana/vim-textobj-user'
Bundle 'slim-template/vim-slim'
Bundle 'markcornick/vim-vagrant'
Bundle 'fatih/vim-go'
Bundle 'shougo/deoplete.nvim'
Bundle 'ctrlp.vim'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'easymotion/vim-easymotion'
Bundle 'airblade/vim-gitgutter'
Bundle 'junegunn/goyo.vim'

" Bundle 'Valloric/YouCompleteMe'
" Bundle 'Shougo/vimproc.vim'
" Bundle 'Shougo/unite.vim'
" Bundle 'm2mdas/phpcomplete-extended'

let g:phpcomplete_index_composer_command = "composer"
" autocmd  FileType  php setlocal omnifunc=phpcomplete_extended#CompletePHP

filetype plugin indent on

" make spacebar leader key
let mapleader=" "
nnoremap <SPACE> <Nop>

color jellybeans

set cursorline
set expandtab
set modelines=0
set shiftwidth=2
set clipboard=unnamed
set synmaxcol=128
" set ttyscroll=10
set encoding=utf-8
set tabstop=2
set nowrap
set number
set expandtab
set nowritebackup
set noswapfile
set nobackup
set hlsearch
set ignorecase
set hidden
set smartcase
set fileformat=unix
set ff=unix
set splitright

" plugins configs
runtime conf/golang.vim
runtime conf/ctrlp.vim
runtime conf/nerdcommenter.vim

" Set files to be excluded from autocomplete
set wildignore+=*.jpg,*.gif,*.png,*.jpeg

autocmd FileType Vagrantfile setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Automatic formatting
autocmd BufWritePre *.rb :%s/\s\+$//e
autocmd BufWritePre *.go :%s/\s\+$//e
autocmd BufWritePre *.haml :%s/\s\+$//e
autocmd BufWritePre *.html :%s/\s\+$//e
autocmd BufWritePre *.scss :%s/\s\+$//e
autocmd BufWritePre *.slim :%s/\s\+$//e

au BufNewFile * set noeol
au BufRead,BufNewFile *.go set filetype=go

" No show command
autocmd VimEnter * set nosc

" Quick ESC
imap jj <ESC>

" Jump to the next row on long lines
map <Down> gj
map <Up>   gk
nnoremap j gj
nnoremap k gk

" move lines up and down
nnoremap <C-j> :m+<CR>
nnoremap <C-k> :m-2<CR>

" go to first non whitespace character
vmap ) ^
nmap ) ^

" format the entire file
nmap <leader>fef ggVG=

" Tab between buffers
noremap <tab> <c-w><c-w>

" Switch between last two buffers
nnoremap <leader><leader> <C-^>

" wrap with quotes
nnoremap <Leader>" ciw""<Esc>P
nnoremap <Leader>' ciw''<Esc>P
vmap <Leader>" c""<Esc>P
vmap <Leader>' c''<Esc>P

" Resize buffers
if bufwinnr(1)
  nmap Ä <C-W><<C-W><
  nmap Ö <C-W>><C-W>>
  nmap ö <C-W>-<C-W>-
  nmap ä <C-W>+<C-W>+
endif

" Search
nnoremap <silent> <CR> :noh<CR><CR>

" NERDTree
nmap <leader>n :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore = ['tmp', '.yardoc', 'pkg']
set mouse=a

" Syntastic
let g:syntastic_mode_map = { 'mode': 'passive' }
let g:syntastic_ruby_exec = '~/.rvm/rubies/ruby-2.0.0-p0/bin/ruby'


" Window management
function! WinMove(key) 
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if (t:curwin == winnr()) "we havent moved
    if (match(a:key,'[jk]')) "were we going up/down
      wincmd v
    else 
      wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfunction
 
map <leader>h :call WinMove('h')<cr>
map <leader>k :call WinMove('k')<cr>
map <leader>l :call WinMove('l')<cr>
map <leader>j :call WinMove('j')<cr>
map <leader>w :wincmd q<cr>
map <leader>H :wincmd H<cr>
map <leader>K :wincmd K<cr>
map <leader>L :wincmd L<cr>
map <leader>J :wincmd J<cr>

let g:EasyMotion_do_mapping = 0 " Disable default mappings

map <Plug>(easymotion-prefix) s
map ss <Plug>(easymotion-s)
map st <Plug>(easymotion-t2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

