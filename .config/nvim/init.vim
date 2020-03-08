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

if has('nvim-0.4')
  Plug 'norcalli/nvim-colorizer.lua'
endif


""" Languages
Plug 'sheerun/vim-polyglot'
Plug 'pearofducks/ansible-vim', { 'for': 'ansible' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

""" Tools

""""" Snippets
Plug 'Shougo/neosnippet.vim' " Snippets!!!
Plug 'Shougo/neosnippet-snippets' " Snippets!!!
Plug 'noahfrederick/vim-skeleton'  " File skeletons

""""" Terminal
Plug 'kassio/neoterm'

""""" IDE?
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fugitive' " Git plugin for like, :Gstatus
Plug 'tpope/vim-rhubarb'  " Github additions to fugitive
Plug 'danro/rename.vim' " Rename file :rename[!] {newname}
Plug 'tpope/vim-sleuth'  " Auto figure out file settings
Plug 'airblade/vim-rooter'  " Use the root as the parent dir
Plug 'lotabout/skim', { 'dir': '~/.skim', 'do': './install' }
Plug 'lotabout/skim.vim'
Plug 'janko/vim-test'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Completion
Plug 'zchee/deoplete-zsh', { 'for': 'zsh' }
" Plug 'Shougo/neoinclude.vim'
" Plug 'Shougo/neopairs.vim'
Plug 'tpope/vim-projectionist' " project configs and alternates
" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }

if has('nvim-0.5')
  Plug 'neovim/nvim-lsp' " requires neovim-nightly
  Plug 'Shougo/deoplete-lsp'
endif

""" Motion
Plug 'justinmk/vim-sneak'  " s{char}{char}

""" Editing
Plug 'tpope/vim-commentary' " Comment stuff out
Plug 'tpope/vim-repeat' " Allow . to be used for plugins
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-surround'
Plug 'ervandew/supertab'

""" Misc
Plug 'Shougo/denite.nvim' " Better Unite
Plug 'junegunn/vim-easy-align'  " Easily align things
Plug 'tpope/vim-unimpaired' " Add lots of handy mappings using [ and ]
Plug 'ciaranm/securemodelines'
call plug#end()

for config_file in split(glob('~/.config/nvim/config/**/*.vim'), '\n')
    exe 'source' config_file
endfor

if has('nvim-0.5')
  for config_file in split(glob('~/.config/nvim/config/**/*.lua'), '\n')
      exe 'luafile' config_file
  endfor
endif
