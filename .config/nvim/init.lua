vim.o.termguicolors = true

require('packages')

-- TODO Migrate from vim for these
vim.api.nvim_command('source ~/.config/nvim/config/abbreviations.vim')
vim.api.nvim_command('source ~/.config/nvim/config/appearance.vim')
vim.api.nvim_command('source ~/.config/nvim/config/bindings.vim')
vim.api.nvim_command('source ~/.config/nvim/config/coc.vim')
vim.api.nvim_command('source ~/.config/nvim/config/filetypes.vim')
vim.api.nvim_command('source ~/.config/nvim/config/general.vim')
vim.api.nvim_command('source ~/.config/nvim/config/nvim.vim')

