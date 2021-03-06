local packerDir = os.getenv("HOME") .. "/.local/share/nvim/site/pack/packer/opt/packer.nvim"

vim.o.termguicolors = true

-- Helper function from https://oroques.dev/notes/neovim-init/#set-options
local function map(mode, lhs, rhs, opts)
	local options = {noremap = true}
	if opts then options = vim.tbl_extend('force', options, opts) end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

if vim.fn.isdirectory(packerDir) == 0 then
	vim.fn.mkdir(packerDir, 'p')
	os.execute("git clone https://github.com/wbthomason/packer.nvim \"" .. packerDir .. "\"")
end

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
	-- Manage packer updates
	use {'wbthomason/packer.nvim', opt = true }

	-- Gruvbox Theme
	use {
		"npxbr/gruvbox.nvim",
		requires = { "rktjmp/lush.nvim" },
		config = function()
			vim.o.background = "dark"
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
		run = function() require'nvim-treesitter'.update('all') end,
		config = function()
			require('nvim-treesitter.configs').setup({
				highlight = { enable = true },
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "gnn",
						node_incremental = "grn",
						scope_incremental = "grc",
						node_decremental = "grm",
					},
				},
				indent = { enable = true }
			})
		end
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
			vim.g.nvim_tree_auto_open = 1
			vim.g.nvim_tree_auto_close = 1
			vim.g.nvim_tree_indent_markers = 1
			vim.g.nvim_tree_git_hl = 1
			-- map('n', '<leader>nt', '<cmd>NvimTreeToggle<CR>')
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

	-- chdir to a "root" directory when editing
	use 'airblade/vim-rooter'

	-- Pretty fuzzy finder
	use {
		'nvim-telescope/telescope.nvim',
		requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
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


end)
