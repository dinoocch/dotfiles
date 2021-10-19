local packerDir = os.getenv('HOME') .. '/.local/share/nvim/site/pack/packer/opt/packer.nvim'


vim.o.termguicolors = true

if vim.fn.isdirectory(packerDir) == 0 then
	vim.fn.mkdir(packerDir, 'p')
	os.execute('git clone https://github.com/wbthomason/packer.nvim \'' .. packerDir .. '\'')
end

local function t(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
	-- Manage packer updates
	use {'wbthomason/packer.nvim', opt = true }

	-- Gruvbox Theme
	use {
		'npxbr/gruvbox.nvim',
		requires = { 'rktjmp/lush.nvim' },
		config = function()
			vim.o.background = 'dark'
			vim.cmd([[colorscheme gruvbox]])
		end
	}

	-- Lua Statusline
	use {
		'glepnir/galaxyline.nvim',
		branch = 'main',
		-- TODO
		config = function() require'config.galaxyline' end,
		requires = {
			{'kyazdani42/nvim-web-devicons'},
			{'Iron-E/nvim-highlite'}
		}
	}

	-- Colorize hexcolors like #faf000 everywhere
	use {
		'norcalli/nvim-colorizer.lua',
		config = function() require'colorizer'.setup() end
	}

	-- Use treesitter for colors
	use {
		'nvim-treesitter/nvim-treesitter',
		config = function()
			require('nvim-treesitter.configs').setup({
				highlight = { enable = true },
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = 'gnn',
						node_incremental = 'grn',
						scope_incremental = 'grc',
						node_decremental = 'grm',
					},
				},
				indent = { enable = true }
			})
		end
	}

	use {
		'p00f/nvim-ts-rainbow',
		requires = 'nvim-treesitter/nvim-treesitter',
		config = function() require('nvim-treesitter.configs').setup {
			rainbow = {
				enable = true
			}
		} end
	}

	-- Improved terminal support
	-- TODO: Consider akinsho/nvim-toggleterm.lua
	use {
		'kassio/neoterm',
		config = function()
			vim.g.neoterm_autoscroll = 1
			vim.g.neoterm_default_mod = 'belowright'
			vim.g.neoterm_size = 16
		end
	}

	-- File explorer
	use {
		'kyazdani42/nvim-tree.lua',
		requires = {'kyazdani42/nvim-web-devicons'},
		config = function()
			vim.g.nvim_tree_ignore = {'.git', 'node_modules', '.cache'}
			vim.g.nvim_tree_gitignore = 1
			vim.g.nvim_tree_git_hl = 1
			require('nvim-tree').setup {
				open_on_setup = false,
				auto_close = true,
			}
			vim.api.nvim_set_keymap('n', '<leader>nt', '<cmd>NvimTreeToggle<CR>', {noremap = true, silent = true})
		end
	}

	-- Git extensions
	use {
		'tpope/vim-fugitive',
		config = function()
			vim.api.nvim_exec([[augroup fugitive
			autocmd!
			autocmd BufReadPost fugitive://* set bufhidden=delete
				augroup END]], false)
		end
	}
	use {
		'tpope/vim-rhubarb',
		requires = {'tpop/vim-fugitive'}

	}

	use {
		'lewis6991/gitsigns.nvim',
		requires = {
			'nvim-lua/plenary.nvim'
		},
		config = function() require('gitsigns').setup() end
	}

	-- Allow renaming files with :rename <newname>
	use 'danro/rename.vim'

	-- chdir to a 'root' directory when editing
	use 'airblade/vim-rooter'

	-- Pretty fuzzy finder
	use {
		'nvim-telescope/telescope.nvim',
		requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
		config = function()
			if vim.fn.executable('fd') then
				vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>Telescope fd<CR>', {noremap = true, silent = true})
			else
				vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>Telescope find_files<CR>', {noremap = true, silent = true})
			end

			vim.api.nvim_set_keymap('n', '<leader>s', '<cmd>Telescope live_grep<CR>', {noremap = true, silent = true})
			vim.api.nvim_set_keymap('n', '<leader>b', '<cmd>Telescope buffers<CR>', {noremap = true, silent = true})


		end
	}

	use {
		'akinsho/nvim-bufferline.lua',
		requires = {'kyazdani42/nvim-web-devicons'},
		config = function() require'bufferline'.setup() end
	}

	-- Guess at indentation settings from the file
	-- TODO: Figure out treesitter indent
	use 'tpope/vim-sleuth'

	-- Comment stuff out
	use {
		'terrortylor/nvim-comment',
		config = function() require'nvim_comment'.setup() end
	}

	-- Operators for surrounding text
	use 'tpope/vim-surround'

	-- Sneak operator s{char}{char}
	use 'justinmk/vim-sneak'

	-- Useful bracket bindings
	use 'tpope/vim-unimpaired'

	-- Easily align things (most of this is probably done with a fixer though?)
	use {
		'junegunn/vim-easy-align',
		config = function()
			-- map('x', 'ga', '<Plug>(EasyAlign)', {noremap = false})
			-- map('n', 'ga', '<Plug>(EasyAlign)', {noremap = false})
		end
	}

	-- Secure modelines
	use 'ciaranm/securemodelines'

	-- lsp
	use {
		'neovim/nvim-lspconfig',
		config = function() require'config.lsp' end
	}

	-- completion
	use {
		'nvim-lua/completion-nvim',
		config = function() require'config.completion'.setup() end
	}

	use 'steelsojka/completion-buffers'
	use 'nvim-treesitter/completion-treesitter'

	-- dap
	use {
		'mfussenegger/nvim-dap',
		config = function()
			-- Toggle breakpoints
			vim.api.nvim_set_keymap('n', '<leader>db', [[<Cmd>lua require('dap').toggle_breakpoint()<CR>]], {noremap = true, silent = true})
			-- Continue
			vim.api.nvim_set_keymap('n', '<leader>dc', [[<Cmd>lua require('dap').continue()<CR>]], {noremap = true, silent = true})
			-- Step over
			vim.api.nvim_set_keymap('n', '<leader>do', [[<Cmd>lua require('dap').step_over()<CR>]], {noremap = true, silent = true})
			-- Step into
			vim.api.nvim_set_keymap('n', '<leader>di', [[<Cmd>lua require('dap').step_into()<CR>]], {noremap = true, silent = true})
			-- Open repl
			vim.api.nvim_set_keymap('n', '<leader>dr', [[<Cmd>lua require('dap').repls.open()<CR>]], {noremap = true, silent = true})
		end
	}

	use {
		'theHamsta/nvim-dap-virtual-text',
		config = function()
			vim.g.dap_virtual_text = true
		end
	}

	-- snippets
	use {
		'hrsh7th/vim-vsnip',
		config = function()
			vim.g.vsnip_snippet_dir = vim.fn.stdpath('config') .. '/snippets'
		end
	}

	use {
		'hrsh7th/vim-vsnip-integ'
	}

	-- More syntaxes
	use 'sheerun/vim-polyglot'
end)
