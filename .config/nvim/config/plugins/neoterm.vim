"""
" Plugin Config: kassio/neoterm
"
let g:neoterm_autoscroll=1
let g:neoterm_default_mod='belowright'
let g:neoterm_size=16

nmap gx <Plug>(neoterm-repl-send)
" Send selected contents in visual mode.
xmap gx <Plug>(neoterm-repl-send)
