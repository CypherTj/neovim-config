local M = {}

function M.get_separator(hlname, hlstyle, direct, character)
  -- Set default characters
  local left_character = ''
  local right_character = ''

  -- Choose character based on the 'direct' parameter
  if direct == 'left' then
    character = character or left_character
  elseif direct == 'right' then
    character = character or right_character
  else
    character = left_character
  end

  -- Define highlight group dynamically based on provided colorstyle
  local highlight_group = 'highlight ' .. hlname .. ' guifg=' .. hlstyle.fg .. ' guibg=' .. hlstyle.bg
  if hlstyle.style then
    highlight_group = highlight_group .. ' gui=' .. hlstyle.style
  end
  vim.cmd(highlight_group)

  -- Add highlight group
  local parts = {}
  table.insert(parts, '%#' .. hlname .. '#')
  table.insert(parts, "%{'" .. character .. "'}")
  return table.concat(parts, '')
end

return M
