local utils = require 'CypherTj.core.utils'
local colors = require('CypherTj.core.colors').colors
local get_sep = require('CypherTj.core.separators').get_separator

local M = {}

local function get_line_percent_icon()
  local percent = vim.fn.line '.' / vim.fn.line '$' * 100
  local icon = ''

  if percent <= 13 then
    icon = '󰪞'
  elseif percent <= 25 then
    icon = '󰪟'
  elseif percent <= 38 then
    icon = '󰪠'
  elseif percent <= 50 then
    icon = '󰪡'
  elseif percent <= 63 then
    icon = '󰪢'
  elseif percent <= 75 then
    icon = '󰪣'
  elseif percent <= 88 then
    icon = '󰪤'
  elseif percent <= 100 then
    icon = '󰪥'
  end

  return icon
end

local function line_info()
  if vim.bo.filetype == 'alpha' then
    return ''
  end
  return get_line_percent_icon() .. ' %P %l:%c '
end

local function file_format()
  local format_icons = {
    unix = ' LF',
    dos = ' CRLF',
    mac = ' LF',
  }
  return format_icons[vim.bo.fileformat] or vim.bo.fileformat
end

local function spaces()
  return ' Sp:' .. vim.api.nvim_buf_get_option(0, 'shiftwidth') .. ' '
end

function M.buffer_info()
  local parts = {}

  -- line info
  table.insert(parts, get_sep('LineInfoSepBefore', { fg = colors.green, bg = colors.none }, 'left'))
  table.insert(parts, utils.create_component(line_info(), 'LineInfo', { fg = colors.dark, bg = colors.green }))
  table.insert(parts, utils.create_component(spaces(), 'LineSpaces', { fg = colors.dark, bg = colors.blue }))
  table.insert(parts, utils.create_component(file_format(), 'FileFormat', { fg = colors.dark, bg = colors.yellow }))
  table.insert(parts, get_sep('LineInfoSepAfter', { fg = colors.yellow, bg = colors.none }, 'right'))

  return table.concat(parts, '')
end

return M
