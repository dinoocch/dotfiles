local map = vim.api.nvim_set_keymap

-- Toggle breakpoints
nvim_set_keymap('n', '<leader>db', [[<Cmd>lua require('dap').toggle_breakpoint()<CR>]], {noremap = true, silent = true})
-- Continue
nvim_set_keymap('n', '<leader>dc', [[<Cmd>lua require('dap').continue()<CR>]], {noremap = true, silent = true})
-- Step over
nvim_set_keymap('n', '<leader>do', [[<Cmd>lua require('dap').step_over()<CR>]], {noremap = true, silent = true})
-- Step into
nvim_set_keymap('n', '<leader>di', [[<Cmd>lua require('dap').step_into()<CR>]], {noremap = true, silent = true})
-- Open repl
nvim_set_keymap('n', '<leader>dr', [[<Cmd>lua require('dap').repls.open()<CR>]], {noremap = true, silent = true})
