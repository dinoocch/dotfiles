" https://github.com/norcalli/nvim-colorizer.lua
"
" Faster colorizing

set termguicolors
if has_key(plugs, 'nvim-colorizer.lua')
  lua require'colorizer'.setup()
endif
