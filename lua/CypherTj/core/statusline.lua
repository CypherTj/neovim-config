log = require 'CypherTj.log'

local vim_mode = require 'CypherTj.core.statusline-vim-mode'
local file_info = require 'CypherTj.core.statusline-file'
local buf_comps = require 'CypherTj.core.statusline-buffer-info'
local git_comps = require 'CypherTj.core.statusline-git-info'

local api = vim.api

local M = {}

--  disable components for neo-tree
local function is_neotree()
  local filename = vim.fn.expand '%:.'
  return filename:match 'neo%-tree'
end

-- Function to generate the complete statusline
function M.statusline()
  local parts = {}

  table.insert(parts, vim_mode.get_vim_mode())

  -- load only if not in neo-tree
  if not is_neotree() and vim.fn.empty(vim.fn.expand '%:.') ~= 1 then
    table.insert(parts, file_info.get_file_comp())

    -- lsp config
    local lsp_status = require 'CypherTj.core.statusline-lsp'
    table.insert(parts, lsp_status.get_lsp_comp())
  end

  -- add divider
  table.insert(parts, '%=')

  -- left side components
  -- git info
  table.insert(parts, git_comps.get_git_info())

  -- line info
  table.insert(parts, buf_comps.buffer_info())

  -- right side components
  -- LSP status
  -- table.insert(parts, lsp_status.get_lsp_status())

  return table.concat(parts, '')
end

return M
