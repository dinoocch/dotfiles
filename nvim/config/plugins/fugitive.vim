""""
" Plugin Config: tpope/fugitive

nmap <silent> <leader>gs :Gstatus<cr>
nmap <silent> <leader>gb :Gblame<cr>
nmap <silent> <leader>ge :Gedit<cr>
nmap <silent> <leader>gr :Grebase -i<cr>
nmap <silent> <leader>gl :Gclog<cr>
nmap <silent> <leader>gw :Gwrite<cr>
nmap <silent> <leader>gR :Gread<cr>
nmap <silent> <leader>gp :Gpush<cr>
nmap <silent> <leader>gc :Gcommit<cr>

augroup buffergroup
  autocmd!
  autocmd BufReadPost fugitive://* set bufhidden=delete
augroup END
