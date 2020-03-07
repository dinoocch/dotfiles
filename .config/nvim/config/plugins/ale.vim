"""
" Plugin Config: dense-analysis/ale
"
let g:ale_sign_column_always = 1

if has('balloon_show')
  let g:ale_set_balloons = 1
end

let g:ale_fix_on_save = 1

" commented out for now in favor of coc.vim
" nnoremap <leader>d :ALEGoToDefinition<CR>
" nnoremap gd :ALEGoToDefinition<CR>
" nnoremap <leader>dv :ALEGoToDefinitionInVsplit<CR>
" nnoremap <leader>dh :ALEGoToDefinitionInSplit<CR>
" nnoremap <leader>r :ALEFindReferences<CR>
" nnoremap gr :ALEFindReferences<CR>

nmap <silent> [c <Plug>(ale_previous_wrap)
nmap <silent> ]c <Plug>(ale_next_wrap)


let g:ale_linters = {
      \    'ansible': ['ansible-lint'],
      \    'go': ['gopls'],
      \    'web': ['eslint'],
      \    'python': ['flake8', 'pylint', 'bandit'],
      \    'rust': ['rls'],
      \    'qml': ['qmllint'],
      \    'shell': ['shellcheck'],
      \    'vim': ['vint'],
      \    'terraform': ['tflint'],
      \}

let g:ale_fixers = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'go': ['gofmt', 'goimports'],
      \   'json': ['prettier'],
      \   'html': ['prettier'],
      \   'markdown': ['prettier'],
      \   'web': ['prettier_eslint'],
      \   'kotlin': ['ktlint'],
      \   'python': ['black'],
      \   'rust': ['rustfmt'],
      \   'terraform': ['terraform'],
      \   'yaml': ['prettier']
      \}

let g:ale_rust_rls_config = {'rust': {'clippy_preference': 'on', 'all_features': v:true}}
