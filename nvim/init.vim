set nocompatible

silent !mkdir -p ~/.local/share/nvim/
if !filereadable(expand('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

""""""""""
" Plugins
call plug#begin()
""" Colors
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'      " Pretty Status Bar
Plug 'vim-airline/vim-airline-themes'

""" Deps
Plug 'Shougo/neocomplcache'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-rhubarb'  " Github additions to fugitive

""" Languages
Plug 'dense-analysis/ale'  " Async linting and language server integration
Plug 'sheerun/vim-polyglot'
Plug 'pearofducks/ansible-vim', { 'for': 'ansible' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'heavenshell/vim-pydocstring', { 'for': 'python'}

""" Tools

""""" Snippets
Plug 'Shougo/neosnippet.vim' " Snippets!!!
Plug 'Shougo/neosnippet-snippets' " Snippets!!!
Plug 'noahfrederick/vim-skeleton'  " File skeletons

""""" Terminal
Plug 'kassio/neoterm'

""""" IDE?
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fugitive' " Git plugin for like, :Gstatus
Plug 'danro/rename.vim' " Rename file :rename[!] {newname}
Plug 'tpope/vim-sleuth'  " Auto figure out file settings
Plug 'airblade/vim-rooter'  " Use the root as the parent dir
Plug 'lotabout/skim', { 'dir': '~/.skim', 'do': './install' }
Plug 'lotabout/skim.vim'
Plug 'janko/vim-test'
Plug 'neoclide/coc.nvim', {'branch': 'release'}  " Intellisense engine
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Completion
" Plug 'zchee/deoplete-zsh', { 'for': 'zsh' }
" Plug 'Shougo/neoinclude.vim'
" Plug 'Shougo/neopairs.vim'


""" Motion
" Plug 'easymotion/vim-easymotion'
Plug 'justinmk/vim-sneak'  " s{char}{char}

""" Editing
Plug 'tpope/vim-commentary' " Comment stuff out
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-repeat' " Allow . to be used for plugins
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-surround'

""" Misc
Plug 'Shougo/denite.nvim' " Better Unite
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/vim-easy-align'  " Easily align things?
Plug 'tpope/vim-unimpaired' " Add lots of handy mappings
Plug 'ciaranm/securemodelines'
call plug#end()

for config_file in split(glob('~/.config/nvim/config/**/*.vim'), '\n')
    exe 'source' config_file
endfor
