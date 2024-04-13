local colors = require('CypherTj.core.colors').colors
local get_sep = require('CypherTj.core.separators').get_separator
local utils = require 'CypherTj.core.utils'
local M = {}
local api = vim.api


function get_lsp_status()
  local clients = vim.lsp.buf_get_clients(0)

  -- If there are LSP clients associated with the buffer, return their names
  if #clients > 0 then

    local status = ''
    for _, client in ipairs(clients) do
      local client_name = client.name or 'LSP'
      status = status .. client_name .. ' '
    end
    return status
  end

  return ' Loading LSP...'
end

function M.get_lsp_comp()
  local parts = {}

  table.insert(parts, get_sep('LspInfoSepBefore', { fg = colors.yellow, bg = colors.none }, 'left'))
  table.insert(parts, utils.create_component(' ' .. get_lsp_status(), 'LSPInfo', { fg = colors.black, bg = colors.yellow }))
  table.insert(parts, get_sep('LspInfoSepAfter', { fg = colors.yellow, bg = colors.none }, 'right'))
  return table.concat(parts, '')
end

return M
