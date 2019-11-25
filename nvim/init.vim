set nocompatible

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

""" Deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Completion
Plug 'zchee/deoplete-zsh', { 'for': 'zsh' }
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/neopairs.vim'

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

"""""""""""""""
" Typos
abbr funciton function
abbr teh the
abbr thier their
abbr tempalte template

cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall


"""""""""""""""
" Theme

colorscheme gruvbox
set background=dark

syntax enable
set colorcolumn=80

let g:airline_theme='raven'
let g:bufferline_echo = 0

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '¤'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

let g:airline#extensions#ale#enabled = 1


""""""""""""""""""
" General Settings

let mapleader="\<Space>"

" Read the file if it has changed
set autoread

" Backspace over lines
set backspace=indent,eol,start

" Make tabs more pallatable
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

" Tweak complete menu
set completeopt+=longest

" Use the system clipboard
set clipboard=unnamed

" show line numbers
set number
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber
autocmd CompleteDone * pclose!


set showcmd " show the last command used
set cursorline " show the current line
set wildmenu " better command completion
set wildmode=list:longest
set so=7
set scrolloff=3
set shell=$SHELL
set nolazyredraw " less redrawing = less flashes
set notitle

" Configure searches
set ignorecase
set smartcase
set showmatch
set incsearch
set hlsearch
set wrapscan
nnoremap <leader>h :nohlsearch<CR>

nnoremap gV `[v`]

set dir=~/.vim/swaps//
set backupdir=~/.vim/backups//
set undodir=~/.vim/undo//
set undofile

set hidden  " Let you move between buffers without saving

" Write with sudo
cmap w!! w !sudo tee > /dev/null %

nmap <silent> <leader>q :bd<cr>
nmap <leader><space> :w<cr>
noremap Q <NOP>
map <leader>v :set paste!<cr>
nmap ;s :set invspell spelllang=en<cr>

nmap <leader>. <c-^>
vnoremap . :normal .<cr>

" move around in wrapped line
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> ^ g^
nnoremap <silent> $ g$

" Use venv build by setup.py
if  has('nvim')
  let g:python3_host_prog = expand("~/.editor-venv/bin/python")

  " Substitution
  set inccommand=split
end

" Remove conceal everywhere
if has('conceal')
  set conceallevel=0
  set concealcursor=
endif
let g:tex_conceal = ""

if has('mouse')
  set mouse=a
end

" Filetype fixes
augroup configgroup
  autocmd!
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
  autocmd BufNewFile,BufRead *.pdsc set filetype=json
  autocmd BufNewFile,BufRead *.template set filetype=yaml  " most templates I edit are yaml
augroup END

""""
" Plugin Config: tpope/fugitive

nmap <silent> <leader>gs :Gstatus<cr>
nmap <silent> <leader>gb :Gblame<cr>
nmap <silent> <leader>gr :Gread
nmap <silent> <leader>ge :Gedit<cr>

augroup buffergroup
  autocmd!
  autocmd BufReadPost fugitive://* set bufhidden=delete
augroup END

"""
" Plugin Config: scrooloose/nerdtree

map <leader>nt :NERDTreeToggle<CR>

augroup nt_config
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END

""" FROM Nerdtree#433 - Hightlight files based on filetype
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('py', 'Magenta', 'none', '#ff00ff', '#151515')
""" END FROM

"""
" Plugin Config: majutsushi/tagbar

map <leader>tb :TagbarToggle<CR>

let g:tagbar_type_ansible = {
      \ 'ctagstype' : 'ansible',
      \ 'kinds' : [
      \ 't:tasks'
      \ ],
      \ 'sort' : 0
      \ }

let g:tagbar_type_puppet = {
      \ 'ctagstype': 'puppet',
      \ 'kinds': [
      \'c:class',
      \'s:site',
      \'n:node',
      \'d:definition'
      \]
      \}

let g:tagbar_type_rust = {
      \ 'ctagstype' : 'rust',
      \ 'kinds' : [
      \'T:types,type definitions',
      \'f:functions,function definitions',
      \'g:enum,enumeration names',
      \'s:structure names',
      \'m:modules,module names',
      \'c:consts,static constants',
      \'t:traits,traits',
      \'i:impls,trait implementations',
      \]
      \}
let g:tagbar_compact = 1
let g:tagbar_autopreview = 1

"""
" Plugin Config: Shougo/deoplete.nvim
"
let g:deoplete#enable_at_startup = 1
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources.ocaml = ['buffer', 'around']
let g:deoplete#auto_complete_delay = 0

let g:deoplete#sources = {'_': ['ale', 'file', 'ultisnips', 'around', 'buffer', 'member', 'neosnippet']}
call g:deoplete#custom#source('ale', 'rank', 600)

"""
" Plugin Config: Shougo/neopairs.nvim
"
let g:neopairs#enable = 1

"""
" Plugin Config: Neosnippet

" neocomplete key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

"""
" Plugin Config: dense-analysis/ale
"
let g:ale_sign_column_always = 1

if has('balloon_show')
  let g:ale_set_balloons = 1
end

let g:ale_fix_on_save = 1

nnoremap <leader>d :ALEGoToDefinition<CR>
nnoremap gd :ALEGoToDefinition<CR>
nnoremap <leader>dv :ALEGoToDefinitionInVsplit<CR>
nnoremap <leader>dh :ALEGoToDefinitionInSplit<CR>
nnoremap <leader>r :ALEFindReferences<CR>
nnoremap gr :ALEFindReferences<CR>

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

let g:ale_linters = {
      \    'ansible': ['ansible-lint'],
      \    'go': ['gopls'],
      \    'web': ['eslint'],
      \    'python': ['flake8', 'pyls'],
      \    'rust': ['rls'],
      \    'qml': ['qmllint'],
      \    'shell': ['shellcheck'],
      \    'vim': ['vint'],
      \    'terraform': ['tflint'],
      \}

let g:ale_fixers = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'go': ['gofmt', 'goimports'],
      \   'json': ['prettier'],
      \   'html': ['prettier'],
      \   'markdown': ['prettier'],
      \   'web': ['prettier_eslint'],
      \   'kotlin': ['ktlint'],
      \   'python': ['yapf'],
      \   'rust': ['rustfmt'],
      \   'terraform': ['terraform'],
      \   'yaml': ['prettier']
      \}

let g:ale_rust_rls_config = {'rust': {'clippy_preference': 'on', 'all_features': v:true}}



"""
" Plugin Config: noahfrederick/vim-skeleton
"
let skeletons#autoRegister = 1
let skeletons#skeletonsDir = expand("~/.vim/skeletons")

"""
" Plugin Config: lotabout/skim.vim
"
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>s :Rg<CR>

"""
" Plugin Config: janko/vim-test
"

nnoremap <leader>tn :TestNearest<CR>
nnoremap <leader>tf :TestFile<CR>
nnoremap <leader>ts :TestSuite<CR>
nnoremap <leader>tl :TestLast<CR>
nnoremap <leader>tg :TestVisit<CR>

"""
" Lanuage: vim-go
"
let g:go_addtags_transform = "snakecase"
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 1
let g:go_auto_type_info = 1
let g:go_snippet_engine = "neosnippet"

au Filetype go nmap <leader>ga <Plug>(go-alternate-edit)
au Filetype go nmap <leader>gah <Plug>(go-alternate-split)
au Filetype go nmap <leader>gav <Plug>(go-alternate-vertical)
au FileType go nmap <F10> :GoTest -short<cr>
au FileType go nmap <F9> :GoCoverageToggle -short<cr>
au FileType go nmap <F12> <Plug>(go-def)
