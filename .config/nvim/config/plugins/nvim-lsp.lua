-- neovim/nvim-lsp

-- vim.cmd('packadd nvim-lsp')
require'nvim_lsp'.rust_analyzer.setup{}
require'nvim_lsp'.pyls_ms.setup{}

vim.api.nvim_set_keymap('n',
	'gd', ':lua vim.lsp.buf.definition()<CR>',
	{silent=true, noremap=true})

vim.api.nvim_set_keymap('n',
	'gD', '<cmd>lua vim.lsp.buf.implementation()<CR>', {silent=true, noremap=true})

vim.api.nvim_set_keymap('n',
	'K', ':lua vim.lsp.buf.hover()<CR>',
	{silent=true, noremap=true})

vim.api.nvim_set_keymap('n',
	'<c-k>', ':lua vim.lsp.buf.signature_help()<CR>',
	{silent=true, noremap=true})

vim.api.nvim_set_keymap('n',
	'gr',
	':lua vim.lsp.buf.references()<CR>',
	{silent=true, noremap=true})

vim.api.nvim_command [[augroup nvim_lsp]]
	vim.api.nvim_command [[autocmd!]]
	vim.api.nvim_command [[autocmd BufWritePre * :lua vim.lsp.buf.formatting()]]
vim.api.nvim_command [[augroup END]]
