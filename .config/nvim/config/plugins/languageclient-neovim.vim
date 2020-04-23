" https://github.com/autozimu/LanguageClient-neovim
"

" For rust
" hub clone rust-analyzer/rust-analyzer && cd rust-analyzer
" cargo xtask install --server

" For python:
" Requires: dotnet
" unzip https://pvsc.azureedge.net/python-language-server-stable/Python-Language-Server-linux-x64.0.5.30.nupkg -> ~/opt/pyls_ms/

" For java:
" Requires: java-13 (?!?!)
" https://github.com/georgewfraser/java-language-server

" let g:LanguageClient_serverCommands = {
"     \ 'rust': ["ra_lsp_server"],
"     \ 'python': ["pyls"],
"     \ 'java': [expand("~/dev/java-language-server/dist/lang_server_linux.sh")]
"     \ }

" nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" " Or map each action separately
" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" if has_key(g:plugs, "deoplete")
"   call deoplete#custom#source('LanguageClient',
"               \ 'min_pattern_length',
"               \ 2)
" endif
