-- Helpers around installing language servers

--- Requires: nvim-lua/plenary.nvim
local M = {}

local api = vim.api

local Job = require'plenary.job'
local utils = require'utils'

local yarn_path = os.getenv('VOLTA_HOME') .. '/bin/yarn'

local yarn_packages = {
  'bash-language-server',
  'vscode-css-languageserver-bin',
  'graphql-language-service-cli',
  'vscode-json-languageserver',
  'pyright',
  'vim-language-server',
  'yaml-language-server'
}

function M.create_status_window()
  -- create a window and buffer for showing text
  local install_buffer = api.nvim_create_buf(false, true)

  local width = api.nvim_get_option("columns")
  local height = api.nvim_get_option("lines")
  local win_height = math.ceil(height * 0.8 - 4)
  local win_width = math.ceil(width * 0.8)
  local row = math.ceil((height - win_height) / 2 - 1)
  local col = math.ceil((width - win_width) / 2)

  local opts = {
    style = "minimal",
    relative = "editor",
    width = win_width,
    height = win_height,
    row = row,
    col = col
  }
  local install_win = api.nvim_open_win(install_buffer, true, opts)

  return {
    window = install_win,
    buffer = install_buffer
  }
end

-- Install all language servers
function M.install()
  status_window = M.create_status_window()
  api.nvim_buf_set_lines(status_window.buffer, 0, 0, false, {'Starting to install packages'})

  -- Install yarn/js backed language servers
  Job:new({
    command = yarn_path,
    args = utils.concat({
      'global',
      'add'
    }, yarn_packages),
    on_stdout = function(_, data, _)
      print(data)
    end,
    on_stderr = function(_, data, _)
      print(data)
    end
  }):start()

  -- Install deno
  -- Job:new({
  --   command = 'cargo',
  --   args = {'install', 'deno'},
  --   on_exit = function(j, return_val)
  --     print(j:result())
  --   end,
  -- }):start()

  -- gopls
  -- local goplsDir = os.getenv('HOME') .. '/.local/share/gopls'
  -- vim.fn.mkdir(packerDir, 'p')
  -- Job:new({
  --   command = 'go',
  --   args = {'get', 'golang.org/x/tools/gopls@latest'},
  --   cwd = goplsDir,
  --   env = { GO111MODULE = 'on' },
  --   on_exit = function(j, return_val)
  --     print(j:result())
  --   end,
  -- }):start()

  -- rust analyzer, this is pretty hacky
  -- local os_name
  -- if vim.fn.has('macunix') == 1 then
  --   os_name = 'mac'
  -- else
  --   os_name = 'linux'
  -- end
  -- Job:new({
  --   command = 'curl',
  --   args = {
  --     '-L',
  --     'https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer' .. os_name,
  --     '-o',
  --     '~/bin/rust-analyzer'
  --   },
  --   on_exit = function(j, return_val)
  --     print(j:result())
  --     os.execute("chmod +x ~/bin/rust-analyzer")
  --   end
  -- }):start()

  -- -- lua
  -- if vim.fn.has('macunix') == 1 then
  --   os_name = 'macos'
  -- else
  --   os_name = 'linux'
  -- end
  -- Job:new({
  --   command = 'curl',
  --   args = {
  --     '-L',
  --     'https://github.com/josa42/coc-lua-binaries/releases/latest/download/lua-language-server-' .. os_name .. '.tar.gz',
  --     '-o',
  --     '~/.local/share/lua-language-server.tar.gz'
  --   },
  --   on_exit = function(j, return_val)
  --     print(j:result())
  --     Job:new({
  --       command = 'tar',
  --       cwd = os.getenv('HOME') .. '/.local/share',
  --       args = {
  --         '-xzvf',
  --         'lua-language-server.tar.gz'
  --       },
  --       on_exit = function(j, return_val)
  --         print(j:result())
  --         -- os.execute("rm ~/.local/share/lua-language-server.tar.gz")
  --       end
  --     }):start()
  --   end
  -- }):start()

  -- -- terraform-ls
  -- if vim.fn.has('macunix') == 1 then
  --   os_name = 'darwin'
  -- else
  --   os_name = 'linux'
  -- end
  -- Job:new({
  --   command = 'curl',
  --   args = {
  --     '-L',
  --     -- Assume amd64 for now
  --     'https://github.com/hashicorp/terraform-ls/releases/v0.14.0/download/terraform-ls_0.14.0_' .. os_name .. '_amd64.tar.gz',
  --     '-o',
  --     '~/.local/share/terraform-ls.zip'
  --   },
  --   on_exit = function(j, return_val)
  --     print(j:result())
  --     Job:new({
  --       command = 'unzip',
  --       cwd = os.getenv('HOME') .. '/.local/share',
  --       args = {
  --         'tarraform-ls.zip'
  --       },
  --       on_exit = function(j, return_val)
  --         print(j:result())
  --         os.execute("mv ~/.local/share/terraform-ls ~/bin")
  --         os.execute("rm ~/.local/share/terraform-ls.zip")
  --       end
  --     }):start()
  --   end
  -- }):start()

end

return M
