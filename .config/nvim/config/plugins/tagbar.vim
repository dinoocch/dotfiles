"""
" Plugin Config: majutsushi/tagbar

map <leader>tb :TagbarToggle<CR>

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
