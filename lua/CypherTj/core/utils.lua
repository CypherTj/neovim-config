local M = {}

function M.create_component(text, hlname, hlstyle)
  text = text or ''
  -- Define highlight group dynamically based on provided colorstyle
  local highlight_group = 'highlight ' .. hlname .. ' guifg=' .. hlstyle.fg .. ' guibg=' .. hlstyle.bg
  if hlstyle.style then
    highlight_group = highlight_group .. ' gui=' .. hlstyle.style
  end
  vim.cmd(highlight_group)

  local parts = {}
  table.insert(parts, '%#' .. hlname .. '#')
  table.insert(parts, text)
  return table.concat(parts, '')
end

return M
