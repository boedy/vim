set nocompatible
filetype off

" Install plug plugin manager if not exists
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" My Plugins
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'tomtom/tcomment_vim'
Plug 'rking/ag.vim'
Plug 'kana/vim-textobj-user'
Plug 'slim-template/vim-slim'
Plug 'markcornick/vim-vagrant'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/goyo.vim'
Plug 'terryma/vim-expand-region'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'Shougo/echodoc', { 'do': 'make'}
Plug 'cohama/lexima.vim'
Plug 'matze/vim-move'
Plug 'w0rp/ale'
Plug 'auwsmit/vim-active-numbers'

" Themes
Plug 'nanotech/jellybeans.vim'
Plug 'YorickPeterse/happy_hacking.vim'
Plug 'rainglow/vim'
call plug#end()

let g:phpcomplete_index_composer_command = "composer"

filetype plugin indent on

" make spacebar leader key
let mapleader=" "
nnoremap <SPACE> <Nop>

" Set theme
set termguicolors
color happy_hacking
" color peel
" hi Normal         guifg=#d6e1c7 guibg=#151311 gui=NONE
" hi NonText        guifg=#988c6f guibg=#151311 gui=NONE

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

" No ehow command
autocmd VimEnter * set nosc

" Quick ESC
imap jj <ESC>

" Jump to the next row on long lines
map <Down> gj
map <Up>   gk
nnoremap j gj
nnoremap k gk

" move lines up and down
let g:move_key_modifier = 'C'

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

" Gutter line number settings
" set number relativenumber
nmap <C-N><C-N> :set invrelativenumber<CR>

" Close help screen with q
autocmd FileType help noremap <buffer> q :q<cr>

" Search
nnoremap <silent> <CR> :noh<CR><CR>
" Clear search highlighting
nnoremap <esc> :noh<return><esc>

" Gitgutter
let g:gitgutter_map_keys = 0

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

