"""
" Additional filetypes by extension
"

augroup filetype_extensions
  autocmd!
  autocmd BufNewFile,BufRead *.pdsc set filetype=json
  autocmd BufNewFile,BufRead *.template set filetype=yaml
augroup END
