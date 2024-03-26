--  diable components for neo-tree
local function disable_for_neotree()
  local filename = vim.fn.expand '%:.'
  return not filename:match 'neo%-tree'
end

local function config(_, opts)
  local palette = require('catppuccin.palettes').get_palette 'mocha'

  local feline = require 'feline'
  local vi_mode = require 'feline.providers.vi_mode'
  local file = require 'feline.providers.file'
  local lsp = require 'feline.providers.lsp'
  local separators = require('feline.defaults').statusline.separators.default_value

  local comps = {
    vim_mode = {
      -- provider = function() return modes[vim.api.nvim_get_mode().mode].. ' ' end,
      provider = function()
        return vi_mode.get_vim_mode()
      end,
      hl = function()
        return { fg = vi_mode.get_mode_color(), bg = palette.surface1 }
      end,
      icon = ' ',
      left_sep = {
        always_visible = true,
        str = separators.left_rounded,
      },
      right_sep = {
        always_visible = true,
        str = separators.right_rounded,
      },
    },
    full_file_path = {
      provider = function()
        return vim.fn.expand '%:.' .. ' '
      end,
      icon = function()
        local icon_str, icon_color = require('nvim-web-devicons').get_icon_color(
          vim.fn.expand '%:t',
          nil, -- extension is already computed by nvim-web-devicons
          { default = true }
        )
        return {
          str = ' ' .. icon_str .. ' ',
          hl = { fg = icon_color },
        }
      end,
      hl = { fg = palette.teal, bg = palette.surface2 },
      left_sep = {
        always_visible = true,
        str = separators.left_rounded,
      },
      right_sep = {
        always_visible = true,
        str = separators.right_rounded,
      },
      enabled = disable_for_neotree,
    },
    lsp = {
      provider = function()
        msg = msg or 'No Active Lsp'
        local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then
          return msg
        end

        for _, client in ipairs(clients) do
          local filetypes = client.config.filetypes
          if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return client.name
          end
        end
        return msg
      end,
      hl = function()
        local progress = vim.lsp.util.get_progress_messages()[1]
        return {
          fg = progress and 'yellow' or 'green',
          bg = 'gray',
          style = 'bold',
        }
      end,
      left_sep = {
        always_visible = true,
        str = separators.left_rounded,
      },
      right_sep = {
        always_visible = true,
        str = separators.right_rounded,
      },
      enabled = disable_for_neotree,
    },
  }

  local active = {
    { -- left
      comps.vim_mode,
      comps.full_file_path,
      comps.lsp,
      -- c.vim_status,
      -- c.file_name,
      -- c.git_branch,
      -- components.lsp,
    },
    { -- right
      -- c.vi_mode,
      -- c.macro,
      -- c.search_count,
      -- c.cursor_position,
      -- c.scroll_bar,
    },
  }

  local inactive = {
    { -- left
    },
    { -- right
      -- c.in_file_info,
    },
  }

  opts.components = { active = active, inactive = inactive }
  opts.force_inactive = { filetypes = { '^help$', '^neotest*', '.*Neotree.*', '^qf$' } }
  opts.disable = { bufnames = { '.*Neotree.*' } }

  -- make statusline transparent
  palette.bg = 'NONE'

  feline.setup(opts)
  feline.use_theme(palette)
end

return {
  'freddiehaddad/feline.nvim',
  config = config,
}
