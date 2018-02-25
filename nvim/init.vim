""""""""""
" Plugins
call plug#begin()
Plug 'AlessandroYorba/Alduin'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'Konfekt/FastFold'
Plug 'Shougo/denite.nvim' " Better Unite
Plug 'Shougo/deoplete.nvim' " Completion
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/neopairs.vim'
Plug 'Shougo/neosnippet-snippets' " Snippets!!!
Plug 'Shougo/neosnippet.vim' " Snippets!!!
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter' " Git gutter
" Plug 'benekastah/neomake' " Make for all kinds of things.
Plug 'bling/vim-bufferline'
Plug 'cazador481/fakeclip.neovim' " Better clipboard
Plug 'danro/rename.vim' " Rename file :rename[!] {newname}
Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }
Plug 'easymotion/vim-easymotion'
Plug 'heavenshell/vim-pydocstring', { 'for': 'python'}
Plug 'honza/vim-snippets'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }
Plug 'junegunn/vim-easy-align'
Plug 'landaire/deoplete-swift', { 'for': 'swift' }
Plug 'majutsushi/tagbar'
Plug 'noahfrederick/vim-skeleton'
Plug 'ntpeters/vim-better-whitespace'
Plug 'pearofducks/ansible-vim', { 'for': 'ansible' }
Plug 'posva/vim-vue', { 'for': 'vue' }
Plug 'rhysd/clever-f.vim'
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'sbdchd/neoformat'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'terryma/vim-multiple-cursors'
Plug 'tmhedberg/SimpylFold'
Plug 'tpope/vim-commentary' " Comment stuff out
Plug 'tpope/vim-fugitive' " Git plugin for like, :Gstatus
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired' " Add lots of handy mappings
Plug 'vim-airline/vim-airline'      " Pretty Status Bar
Plug 'vim-airline/vim-airline-themes'
" Plug 'vim-latex/vim-latex', { 'for': 'latex' }
Plug 'vimwiki/vimwiki'
Plug 'w0rp/ale'
Plug 'zchee/deoplete-go', { 'for': 'go' }
Plug 'zchee/deoplete-jedi', { 'for': 'python' }
Plug 'zchee/deoplete-zsh', { 'for': 'zsh' }
Plug 'copy/deoplete-ocaml', { 'for': 'ocaml' }
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
set nocompatible

" Backspace over lines
set backspace=indent,eol,start

" Colors
colorscheme alduin
set background=dark

syntax enable
set colorcolumn=80

let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_guifg = 'DarkGray'


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
set notitle

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

"""

" let g:deoplete#enable_at_startup = 1

set hidden  " Make buffers quieter

""" Vim Airline Configuration
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

" Auto configuration - mostly tab stuff
augroup configgroup
  autocmd!
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
  autocmd BufNewFile,BufRead *.pdsc set filetype=json
augroup END

augroup buffergroup
  autocmd!
  " autocmd BufWritePost * Neomake
  autocmd BufWritePre * Autoformat
  autocmd BufWritePre * StripWhitespace
  autocmd BufReadPost fugitive://* set bufhidden=delete
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END

cmap w!! w !sudo tee > /dev/null %

map <leader>nt :NERDTreeToggle<CR>
map <leader>tb :TagbarToggle<CR>

"""

let g:deoplete#enable_at_startup = 1

set hidden  " Make buffers quieter


nmap <silent> <leader>q :bd<cr>
nmap <leader>, :w<cr>
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

" Fugitive
nmap <silent> <leader>gs :Gstatus<cr>
nmap <silent> <leader>gb :Gblame<cr>
nmap <silent> <leader>gr :Gread
nmap <silent> <leader>ge :Gedit<cr>

""""
" Neomake runners...

" ansible-lint
" " let g:neomake_ansible_ansiblelint_maker = {
"       \ 'exe': 'ansible-lint',
"       \ 'args': ['-p'],
"       \ 'errorformat': '%f:%l: %m'
"       \ }

" if (executable('ansible-lint'))
"   let g:neomake_ansible_enabled_makers = ['ansiblelint']
" endif

" " chef-lint
" let g:neomake_chef_cheflint_maker = {
"       \ 'errorformat': 'FC%n: %m: %f:%l'
"       \ }

" if (executable('cheflint'))
"   let g:neomake_chef_enabled_makers = ['cheflint']
" endif


" " PyLint is a bit...over the top sometimes
" let g:neomake_python_enabled_makers = []
" if (executable('pylama'))
"   let g:neomake_python_enabled_makers = ['pylama']
" else
"   if (executable('flake8'))
"     let g:neomake_python_enabled_makers = ['flake8']
"   else
"     if (executable('pyflakes'))
"       let g:neomake_python_enabled_makers = ['pyflakes']
"     endif
"   endif
" endif

" let g:neomake_javascript_enabled_makers = ['jshint']

""""
" Misc Plugins

" Polyglot ansible is old
let g:polyglot_disabled = ['ansible']
let g:polyglot_disabled = ['latex']

""""
" Vim ultisnips configuration
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

""" Splitjoin
let g:splitjoin_split_mapping = ''
let g:splitjoin_join_mapping = ''

nmap <Leader>j :SplitjoinJoin<cr>
nmap <Leader>s :SplitjoinSplit<cr>

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

""" Tagbar configuration
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

" Cargo/rustup zombie processes are an issue :( disabling for now
let g:neomake_rust_enabled_makers = []
" let g:neomake_verbose = 3
"

let g:autoformat_retab = 0
let g:autoformat_autoindent = 0

" Substitution
set inccommand=split

" vim-go
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

" neocomplete key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=0 concealcursor=
endif
let g:tex_conceal = ""


let g:ale_sign_column_always = 1

let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources.ocaml = ['buffer', 'around']
let g:deoplete#auto_complete_delay = 0

let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))

for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
