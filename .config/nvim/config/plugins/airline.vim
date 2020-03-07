"""
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
"

" Airline without powerline, since fonts are hard
let g:airline_theme='raven'

" Use more common airline symbols since fonts are hard
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

" Ale is nice
let g:airline#extensions#ale#enabled = 1
