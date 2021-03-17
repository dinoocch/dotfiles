local M = {}
local map = vim.api.nvim_set_keymap

local function t(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function M.setup()
	vim.cmd [[autocmd BufEnter * lua require'completion'.on_attach()]]
	vim.o.shortmess = vim.o.shortmess..'c'
	vim.o.completeopt = 'menuone,noinsert,noselect'

	vim.g.completion_enable_snippet = 'vim-vsnip'
	vim.g.completion_chain_complete_list = {
		default = {
			{ complete_items = { 'lsp', 'ts', 'snippet', 'path', 'buffers' } },
			{ mode = { '<c-p>' } },
			{ mode = { '<c-n>' } }
		},
	}

	-- vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.smart_tab()', {expr = true, noremap = true})
	-- vim.api.nvim_set_keymap('s', '<Tab>', 'v:lua.smart_tab()', {expr = true, noremap = true})
	-- vim.api.nvim_set_keymap('i', '<S-Tab>', 'v:lua.smart_s_tab()', {expr = true, noremap = true})
	-- vim.api.nvim_set_keymap('s', '<S-Tab>', 'v:lua.smart_s_tab()', {expr = true, noremap = true})
	--
	vim.cmd[[imap <expr><TAB> v:lua.smart_tab()]]
	vim.cmd[[smap <expr><TAB> v:lua.smart_tab()]]
	vim.cmd[[imap <expr><S-TAB> v:lua.smart_s_tab()]]
	vim.cmd[[smap <expr><S-TAB> v:lua.smart_s_tab()]]
end

function _G.smart_tab()
	if vim.fn.pumvisible() == 1 then
		return t'<C-n>'
	elseif vim.api.nvim_call_function('vsnip#available', {1}) == 1 then
		return t'<Plug>(vsnip-expand-or-jump)'
	else
		return t'<Tab>'
	end
end

function _G.smart_s_tab()
	if vim.fn.pumvisible() == 1 then
		return t'<C-p>'
	elseif vim.api.nvim_call_function('vsnip#jumpable', {-1}) == 1 then
		return t'<Plug>(vsnip-jump-prev)'
	else
		return t'<S-Tab>'
	end
end

return M
