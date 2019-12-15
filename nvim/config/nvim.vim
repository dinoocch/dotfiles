"""
" Neovim specific stuff
"
if  has('nvim')
  " setup.sh creates this venv
  let g:python3_host_prog = expand("~/.editor-venv/bin/python")

  " Substitution
  set inccommand=split
end
