"""""""""""""""
" Typos

" words easy to mispell
abbr funciton function
abbr teh the
abbr thier their
abbr tempalte template

" capitalization is hard
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

" Write current file with sudo
cmap w!! w !sudo tee > /dev/null %
