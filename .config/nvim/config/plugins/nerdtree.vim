"""
" Plugin Config: scrooloose/nerdtree
"

map <leader>nt :NERDTreeToggle<CR>

augroup nt_config
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END

" """ FROM Nerdtree#433 - Hightlight files based on filetype
" function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
"   exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
"   exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
" endfunction

" call NERDTreeHighlightFile('jade', '#98971a', 'none', '#98971a', '#282828')
" call NERDTreeHighlightFile('ini', '#d79921', 'none', '#d79921', '#282828')
" call NERDTreeHighlightFile('md', '#458588', 'none', '#458588', '#282828')
" call NERDTreeHighlightFile('yml', '#d79921', 'none', '#d79921', '#282828')
" call NERDTreeHighlightFile('config', '#d79921', 'none', '#d79921', '#282828')
" call NERDTreeHighlightFile('conf', '#d79921', 'none', '#d79921', '#282828')
" call NERDTreeHighlightFile('json', '#d79921', 'none', '#d79921', '#282828')
" call NERDTreeHighlightFile('html', '#d79921', 'none', '#d79921', '#282828')
" call NERDTreeHighlightFile('styl', '#689d6a', 'none', '#689d6a', '#282828')
" call NERDTreeHighlightFile('css', '#689d6a', 'none', '#689d6a', '#282828')
" call NERDTreeHighlightFile('coffee', '#cc241d', 'none', '#cc241d', '#282828')
" call NERDTreeHighlightFile('js', '#cc241d', 'none', '#ffa500', '#282828')
" call NERDTreeHighlightFile('py', '#b16286', 'none', '#b16286', '#282828')
" """ END FROM
