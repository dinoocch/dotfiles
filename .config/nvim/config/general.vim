""""""""""""""""""
" General Settings

" Space for leader
let mapleader="\<Space>"

" Read the file if it has changed on disk automatically
set autoread
set hidden  " Let you move between buffers without saving

" Backspace over lines
set backspace=indent,eol,start

" Indent stuff
set shiftround
set noexpandtab
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4

filetype indent on
filetype plugin on

set autoindent
set smartindent

set wildmenu
set wildmode=list:longest

" Use the system clipboard
set clipboard=unnamed

" show line numbers by default
set number
augroup numbers
  autocmd!
  autocmd InsertEnter * :set norelativenumber
  autocmd InsertLeave * :set relativenumber
  autocmd CompleteDone * pclose!
augroup END

" Dont set window title
" TODO: figure out why I set this...
set notitle

" Configure searches
set ignorecase
set smartcase
set showmatch
set incsearch
set hlsearch
set wrapscan
nnoremap <ESC> :nohlsearch<CR>

" visual to the top of file
nnoremap gV `[v`]

" Some directories
silent !mkdir -p ~/.local/share/nvim/swaps
silent !mkdir -p ~/.local/share/nvim/backups
silent !mkdir -p ~/.local/share/nvim/undo

set dir=~/.local/share/nvim/swaps//
set backupdir=~/.local/share/nvim/backups//
set undodir=~/.local/share/nvim/undo//
set undofile

" Remove conceal everywhere
if has('conceal')
  set conceallevel=0
  set concealcursor=
endif
let g:tex_conceal = ""

if has('mouse')
  set mouse=a
end

" Some split stuff
set splitbelow
set splitright
