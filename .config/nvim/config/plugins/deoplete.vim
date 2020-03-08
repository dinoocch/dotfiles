"""
" Plugin Config: Shougo/deoplete.nvim
"
" Swithed to coc.vim for now
"
let g:deoplete#enable_at_startup = 1
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources.ocaml = ['buffer', 'around']
let g:deoplete#auto_complete_delay = 0

let g:deoplete#sources = {'_': ['lsp', 'file', 'ultisnips', 'around', 'buffer', 'member', 'neosnippet']}
call g:deoplete#custom#source('lsp', 'rank', 600)
