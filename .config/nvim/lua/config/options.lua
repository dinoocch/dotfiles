local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end

-- Appearance
opt('w', 'colorcolumn', '80')
opt('w', 'cursorline', true)
opt('o', 'scrolloff', 4)
opt('o', 'splitbelow', true)
opt('o', 'splitright', true)
opt('w', 'wrap', false)

if vim.fn.has('conceal') then
  opt('w', 'conceallevel', 0)
  opt('w', 'concealcursor', "")
end

opt('o', 'mouse', 'a')

-- Spacing
opt('b', 'expandtab', true)
opt('b', 'autoindent', true)
opt('b', 'smartindent', true)
opt('o', 'smarttab', true)
opt('b', 'tabstop',  4)
opt('b', 'shiftwidth', 4)
opt('o', 'shiftround', true)
opt('o', 'joinspaces', false)


-- Modified buffers okay
opt('o', 'hidden', true)

-- Search settings
opt('o', 'ignorecase', true)
opt('o', 'smartcase', true)
opt('o', 'showmatch', true)
opt('o', 'incsearch', true)
opt('o', 'hlsearch', true)
opt('o', 'wrapscan', true)
opt('o', 'inccommand', 'split')

-- Read the file if it's changed
opt('o', 'autoread',  true)

-- Backspace over lines
opt('o', 'backspace', 'indent,eol,start')

-- Menu
opt('o', 'wildmenu', true)
opt('o', 'wildmode', 'list:longest')

-- Clipboard
opt('o', 'clipboard', 'unnamed')

-- Line numbering
opt('w', 'number', true)
opt('w', 'relativenumber', true)


-- Directory setup

local swapDir = vim.fn.stdpath('data') .. '/swaps'
local backupDir = vim.fn.stdpath('data') .. '/swaps'
local undoDir = vim.fn.stdpath('data') .. '/undo'
local dirs = {swapDir, backupDir, undoDir}

for i, dir in ipairs(dirs) do
  if vim.fn.isdirectory(dir) == 0 then
    vim.fn.mkdir(dir, 'p')
  end
end

vim.o.dir = swapDir .. '//'
vim.o.backupdir = backupDir .. '//'
vim.o.undodir = undoDir .. '//'
vim.o.undofile = true
