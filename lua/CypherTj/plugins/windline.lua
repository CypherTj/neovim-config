-- local function get_highlight_group(group_name)
--   -- Convert the group name to lowercase for case-insensitive comparison
--   local lower_group_name = group_name:lower()

--   -- Get information about all highlight groups
--   local hl_groups = vim.api.nvim_get_hl_by_name('', true)

--   -- Iterate through each highlight group and check if the lowercased name matches
--   for name, _ in pairs(hl_groups) do
--     if name:lower() == lower_group_name then
--       -- Highlight group with the same name found, return true
--       return name
--     end
--   end

--   -- No highlight group with the same name found, return false
--   return 'Default'
-- end

-- local function config()
--   local windline = require 'windline'
--   local helper = require 'windline.helpers'
--   local sep = helper.separators
--   local vim_components = require 'windline.components.vim'

--   local b_components = require 'windline.components.basic'
--   local state = _G.WindLine.state

--   local lsp_comps = require 'windline.components.lsp'
--   local lsp_progress = require 'windline.components.lsp_progress'
--   local git_comps = require 'windline.components.git'

--   -- animation
--   local animation = require 'wlanimation'
--   local efffects = require 'wlanimation.effects'
--   local tbl_loading = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' }
--   local loading = ''

--   local components = {}

--   --  disable components for neo-tree
--   local function disable_for_neotree()
--     local filename = vim.fn.expand '%:.'
--     return not filename:match 'neo%-tree'
--   end

--   components.vi_mode = {
--     name = 'vi_mode',
--     hl_colors = {
--       Normal = { 'blue', 'black_light', 'bold' },
--       Insert = { 'green', 'black_light', 'bold' },
--       Visual = { 'yellow', 'black_light', 'bold' },
--       Replace = { 'blue_light', 'black_light', 'bold' },
--       Command = { 'magenta', 'black_light', 'bold' },
--       NormalBefore = { 'black_light', 'black' },
--       InsertBefore = { 'black_light', 'black' },
--       VisualBefore = { 'black_light', 'black' },
--       ReplaceBefore = { 'black_light', 'black' },
--       CommandBefore = { 'black_light', 'black' },
--       NormalAfter = { 'white', 'red' },
--       InsertAfter = { 'white', 'green' },
--       VisualAfter = { 'white', 'yellow' },
--       ReplaceAfter = { 'white', 'blue_light' },
--       CommandAfter = { 'white', 'magenta' },
--     },
--     text = function()
--       return {
--         { sep.left_rounded, state.mode[2] .. 'Before' },
--         { ' ' .. state.mode[1], state.mode[2] },
--         { sep.right_rounded, state.mode[2] .. 'Before' },
--       }
--     end,
--   }

--   local icon_comp = b_components.cache_file_icon { default = '', hl_colors = { 'white', 'dark' } }
--   components.file = {
--     name = 'file',
--     text = function(bufnr)
--       if disable_for_neotree() == false then
--         return {}
--       end
--       local filepath = vim.fn.expand '%:.'
--       local icon_str, icon_color = require('nvim-web-devicons').get_icon_color(
--         vim.fn.expand '%:t',
--         nil, -- extension is already computed by nvim-web-devicons
--         { default = true }
--       )

--       return {
--         { sep.left_rounded, { 'dark', 'black' } },
--         icon_comp(bufnr),
--         { ' ', '' },
--         { ' ' .. filepath, { 'black_light', 'white' } },
--         { b_components.file_modified '[+]' },
--         { '[', '' },
--         { b_components.cache_file_size() },
--         { ']', '' },
--         { sep.right_rounded, { 'white', 'black' } },
--       }
--     end,
--   }

--   components.lsp_diagnos = {
--     name = 'lsp_diagnostics',
--     hl_colors = {
--       red = { 'red', 'black' },
--       yellow = { 'yellow', 'black' },
--       blue = { 'blue', 'black' },
--     },

--     text = function(bufnr)
--       if lsp_comps.check_lsp(bufnr) then
--         return {
--           -- { lsp_comps.lsp_name(bufnr) },
--           { loading, 'red'},
--           { lsp_comps.lsp_error { format = '  %s', show_zero = true }, 'red' },
--           { lsp_comps.lsp_warning { format = '  %s', show_zero = true }, 'yellow' },
--           { lsp_comps.lsp_hint { format = '  %s', show_zero = true }, 'blue' },
--         }
--       end
--       return {
--         { loading, 'red'}
--       }
--     end,
--   }

--   local line_col = function()
--     local row, col = unpack(vim.api.nvim_win_get_cursor(0))
--     return string.format('%s:%s ', row, col + 1)
--   end

--   local spaces = function()
--     return ' Sp:' .. vim.api.nvim_buf_get_option(0, 'shiftwidth') .. ' '
--   end

--   local line_format = function()
--     local format_icons = {
--       unix = 'LF',
--       dos = 'CRLF',
--       mac = 'LF',
--     }
--     return function()
--       return format_icons[vim.bo.fileformat] or vim.bo.fileformat
--     end
--   end

--   components.bufferInfo = {
--     hl_colors = {
--       sep_before = { 'black_light', 'black' },
--       sep_after = { 'black_light', 'black' },
--       text = { 'white', 'black_light' },
--     },
--     text = function(_, _, width)
--       if disable_for_neotree() == false then
--         return {}
--       end
--       local format = line_format()()
--       return {
--         { sep.left_rounded, { 'green', 'black' } },
--         { line_col, { 'dark', 'green' } },
--         { spaces, { 'dark', 'blue' } },
--         { ' ' .. format, { 'dark', 'red' } },
--         { sep.right_rounded, { 'red', 'black' } },
--       }
--     end,
--   }

--   components.git = {
--     name = 'git',
--     hl_colors = {
--       green = { 'green', 'black_light' },
--       red = { 'red', 'black_light' },
--       blue = { 'blue', 'black_light' },
--     },
--     text = function(bufnr)
--       if git_comps.is_git(bufnr) then
--         return {
--           { sep.left_rounded, { 'black_light', 'black' } },
--           { git_comps.diff_added { format = '  %s', show_zero = true }, 'green' },
--           { git_comps.diff_removed { format = '  %s', show_zero = true }, 'red' },
--           { git_comps.diff_changed { format = '  %s', show_zero = true }, 'blue' },
--           { git_comps.git_branch(), { 'white', 'black_light' } },
--           { sep.right_rounded, { 'black_light', 'black' } },
--         }
--       end
--       return ''
--     end,
--   }

--   components.divider = { b_components.divider, '' }

--   local default = {
--     filetypes = { 'default' },
--     active = {
--       components.vi_mode,
--       components.file,
--       -- { vim_components.search_count(), { 'red', 'white' } },
--       -- { sep.right_rounded, hl_list.Black },
--       -- basic.lsp_diagnos,
--       -- basic.git,
--       components.lsp_diagnos,
--       components.divider,
--       -- { git_comps.git_branch({ icon = '  ' }), { 'green', 'black' }, 90 },
--       -- { ' ', hl_list.Black },
--       -- basic.right,
--       -- { ' ', hl_list.Black },
--       components.git,
--       components.bufferInfo,
--     },
--     inactive = {
--       -- basic.file_name_inactive,
--       -- basic.divider,
--       -- basic.divider,
--       -- basic.line_col_inactive,
--       -- { '', hl_list.Inactive },
--       -- basic.progress_inactive,
--     },
--   }

--   windline.setup {
--     colors_name = function(colors)
--       colors.black = 'NONE'

--       colors.dark = '#545c7e'
--       return colors
--     end,
--     statuslines = {
--       default,
--     },
--   }

--   animation.stop_all()
--   animation.basic_animation {
--     timeout = nil,
--     delay = 100,
--     interval = 100,
--     effect = efffects.list_text(tbl_loading),
--     on_tick = function(value)
--       loading = value
--       vim.cmd.redrawstatus()
--     end,
--   }
-- end

-- return {
--   'windwp/windline.nvim',
--   -- config = function()
--   --   require 'wlsample.evil_line'
--   -- end,
--   config = config,
-- }
return {}