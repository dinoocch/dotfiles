-- Keybindings

local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local function t(str) return vim.api.nvim_replace_termcodes(str, true, true, true) end

vim.g.mapleader = " "

-- Remove search highlights
map('n', '<ESC>', '<cmd>nohlsearch<CR>')

-- Quickly close a buffer
map('n', '<leader>q', '<cmd>bdelete<CR>')

-- Write a file
map('n', '<leader><space>', '<cmd>write<CR>')

-- Repeat in visual mode
map('v', '<leader>.', '<cmd>normal .<CR')

-- Move between splits with Ctrl-<dir>
map('n', '<C-J>', '<C-W><C-J>')
map('n', '<C-K>', '<C-W><C-K>')
map('n', '<C-L>', '<C-W><C-L>')
map('n', '<C-H>', '<C-W><C-H>')
