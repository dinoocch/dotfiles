"
" General bindings. Plugin specific bindings are in the plugins folder
"

" Remove the buffer from the buffer list and add it to the top secret buffer list
nmap <silent> <leader>q :bdelete<cr>

" Write file
nmap <leader><space> :write<cr>

" Q is :(
noremap Q <NOP>

" Set paste
" TODO: I don't use this as much as I used to, maybe remove
map <leader>v :set paste!<cr>

" Easier previous file
nmap <leader>. <c-^>

" Repeat in visual mode
vnoremap . :normal .<cr>

" move around in wrapped line
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> ^ g^
nnoremap <silent> $ g$
