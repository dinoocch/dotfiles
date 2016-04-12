""""""""""
" Plugins
call plug#begin()
    Plug 'Shougo/deoplete.nvim' " Completion
    Plug 'Shougo/neoinclude.vim'
    Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }
    Plug 'racer-rust/vim-racer', { 'for': 'rust' }
    Plug 'zchee/deoplete-jedi', { 'for': 'python' }
    Plug 'landaire/deoplete-swift', { 'for': 'swift' }
    Plug 'zchee/deoplete-zsh', { 'for': 'zsh' }
    Plug 'Shougo/neopairs.vim'
    Plug 'AndrewRadev/splitjoin.vim'
    Plug 'Konfekt/FastFold'
    Plug 'amirh/HTML-AutoCloseTag', { 'for': 'html' } " Auto close html tags
    Plug 'ap/vim-css-color' " #ff0000
    Plug 'benekastah/neomake' " Make for all kinds of things.
    Plug 'danro/rename.vim' " Rename file :rename[!] {newname}
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'tpope/vim-fugitive' " Git plugin for like, :Gstatus
    Plug 'tpope/vim-unimpaired' " Add lots of handy mappings
    Plug 'tpope/vim-commentary' " Comment stuff out
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-ragtag'
    Plug 'tpope/vim-sleuth'
    Plug 'sheerun/vim-polyglot' " All the language support
    Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }
    Plug 'w0ng/vim-hybrid'              " Colors!
    Plug 'bling/vim-bufferline'
    Plug 'vim-airline/vim-airline'      " Pretty Status Bar
    Plug 'vim-airline/vim-airline-themes'
call plug#end()
"""""""""

"""""""""""""""
" Abbreviations
abbr funciton function
abbr teh the
abbr thier their
abbr tempalte template
"""""""""""""""

""""""""""""""""""
" General Settings

" Read the file if it has changed
set autoread

" Backspace over lines
set backspace=indent,eol,start

" Colors
colorscheme hybrid
set background=dark
syntax enable

" Make tabs more pallatable
set shiftround
set noexpandtab
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround

filetype indent on
filetype plugin on
set autoindent
set smartindent

" Tweak complete menu
set completeopt+=longest

" Use the system clipboard
set clipboard=unnamed

" show line numbers
set number
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

let mapleader=","

set showcmd " show the last command used
set cursorline " show the current line

set wildmenu " better command completion
set wildmode=list:longest
set so=7
set scrolloff=3
set shell=$SHELL
set nolazyredraw " less redrawing = less flashes
set title

" Configure searches
set ignorecase
set smartcase
set showmatch
set incsearch
set hlsearch
set wrapscan
nnoremap <leader><space> :nohlsearch<CR>

" Configure folding
set foldenable
set foldlevelstart=10
nnoremap <space> za
set foldmethod=syntax

nnoremap gV `[v`]

set dir=~/.vim/swaps//
set backupdir=~/.vim/backups//
set undodir=~/.vim/undo//
set undofile

" I like mice sometimes...
set mouse=a

cmap w!! w !sudo tee > /dev/null %

"""

let g:deoplete#enable_at_startup = 1

set hidden  " Make buffers quieter

""" Vim Airline Configuration
let g:airline_theme='raven'
let g:bufferline_echo = 0

" Auto configuration - mostly tab stuff
augroup configgroup
    autocmd!
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
    autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
augroup END

augroup buffergroup
    autocmd!
    autocmd BufWritePost * Neomake
    autocmd BufWritePre * StripWhitespace
    autocmd BufReadPost fugitive://* set bufhidden=delete
augroup END

nmap <silent> <leader>b :bw<cr>
nmap <leader>, :w<cr>
noremap Q <NOP>
map <leader>v :set paste!<cr>
nmap ;s :set invspell spelllang=en<cr>

nmap <leader>. <c-^>
vnoremap . :normal .<cr>

" Window commands
map <silent> <C-h> :call WinMove('h')<cr>
map <silent> <C-j> :call WinMove('j')<cr>
map <silent> <C-k> :call WinMove('k')<cr>
map <silent> <C-l> :call WinMove('l')<cr>
map <leader>wc :wincmd q<cr>

" WinMove function from http://www.agillo.net/simple-vim-window-management/
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

" move around in wrapped line
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> ^ g^
nnoremap <silent> $ g$

" Fugitive
nmap <silent> <leader>gs :Gstatus<cr>
nmap <silent> <leader>gb :Gblame<cr>
nmap <silent> <leader>gr :Gread
nmap <silent> <leader>ge :Gedit<cr>

""""
" Neomake runners...

" ansible-lint
let g:neomake_ansible_ansiblelint_maker = {
  \ 'exe': 'ansible-lint',
  \ 'args': ['-p'],
  \ 'errorformat': '%f:%l: %m'
  \ }
let g:neomake_ansible_enabled_makers = ['ansiblelint']
