-- local function on_lsp_ready()
--   -- Update the LSP component
--   feline.force_redraw()
-- end

-- local function setup_lsp_listener()
--   vim.lsp.buf_notify(0, "workspace/didChangeConfiguration", {}, on_lsp_ready)
-- end

-- --  disable components for neo-tree
-- local function disable_for_neotree()
--   local filename = vim.fn.expand '%:.'
--   return not filename:match 'neo%-tree'
-- end

-- local function config(_, opts)
--   local palette = require('catppuccin.palettes').get_palette 'mocha'

--   local feline = require 'feline'
--   local vi_mode = require 'feline.providers.vi_mode'
--   local file = require 'feline.providers.file'
--   local lsp = require 'feline.providers.lsp'
--   local separators = require('feline.defaults').statusline.separators.default_value

--   local count = 0
--   local comps = {
--     vim_mode = {
--       -- provider = function() return modes[vim.api.nvim_get_mode().mode].. ' ' end,
--       provider = function()
--         return vi_mode.get_vim_mode()
--       end,
--       hl = function()
--         return { fg = vi_mode.get_mode_color(), bg = palette.surface1 }
--       end,
--       icon = ' ',
--       left_sep = {
--         always_visible = true,
--         str = separators.left_rounded,
--       },
--       right_sep = {
--         always_visible = true,
--         str = separators.right_rounded,
--       },
--     },
--     full_file_path = {
--       provider = function()
--         return vim.fn.expand '%:.'
--       end,
--       icon = function()
--         local icon_str, icon_color = require('nvim-web-devicons').get_icon_color(
--           vim.fn.expand '%:t',
--           nil, -- extension is already computed by nvim-web-devicons
--           { default = true }
--         )
--         return {
--           str = icon_str .. ' ',
--           hl = { fg = icon_color },
--         }
--       end,
--       hl = { fg = palette.teal, bg = palette.surface2 },
--       left_sep = {
--         always_visible = true,
--         str = separators.left_rounded,
--       },
--       right_sep = {
--         always_visible = true,
--         str = separators.right_rounded,
--       },
--       enabled = disable_for_neotree,
--     },
--     -- lsp = {
--     --   provider = function()
--     --     local msg = ' LSP:'
--     --     local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
--     --     local clients = vim.lsp.get_active_clients()
--     --     if next(clients) == nil then
--     --       return msg .. ''
--     --     end

--     --     for _, client in ipairs(clients) do
--     --       local filetypes = client.config.filetypes
--     --       if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
--     --         return msg .. client.name
--     --       end
--     --     end
--     --     return msg
--     --   end,
--     --   hl = function()
--     --     -- local progress = vim.lsp.util.get_progress_messages()[1]
--     --     return {
--     --       fg = 'green',
--     --       bg = 'gray',
--     --     }
--     --   end,
--     --   left_sep = {
--     --     always_visible = true,
--     --     str = separators.left_rounded,
--     --   },
--     --   right_sep = {
--     --     always_visible = true,
--     --     str = separators.right_rounded,
--     --   },
--     --   enabled = disable_for_neotree,
--     -- },
--     lsp = {
--       provider = function()
--         if not rawget(vim, 'lsp') then
--           return ''
--         end

--         local progress = vim.lsp.util.get_progress_messages()[1]
--         if vim.o.columns < 120 then
--           return ''
--         end

--         local clients = vim.lsp.get_active_clients { bufnr = 0 }
--         if #clients ~= 0 then
--           if progress then
--             local spinners = {
--               '◜ ',
--               '◠ ',
--               '◝ ',
--               '◞ ',
--               '◡ ',
--               '◟ ',
--             }
--             local ms = vim.loop.hrtime() / 1000000
--             local frame = math.floor(ms / 120) % #spinners
--             local content = string.format('%%<%s', spinners[frame + 1])
--             return content or ''
--           else
--             return 'לּ LSP'          end
--         end
--         return ''
--       end,
--       hl = function()
--         local progress = vim.lsp.util.get_progress_messages()[1]
--         return {
--           fg = progress and 'green',
--           bg = 'blue',
--           -- style = "bold",
--         }
--       end,
--       left_sep = {
--         always_visible = true,
--         str = separators.left_rounded,
--       },
--       right_sep = {
--         always_visible = true,
--         str = separators.right_rounded,
--       },
--       enabled = disable_for_neotree,
--     },
--   }



--    -- Set up the LSP listener
--    setup_lsp_listener()

--   local active = {
--     { -- left
--       comps.vim_mode,
--       comps.full_file_path,

--       -- c.vim_status,
--       -- c.file_name,
--       -- c.git_branch,
--       -- components.lsp,
--     },
--     {
--       comps.lsp,
--     },
--     { -- right
--       -- c.vi_mode,
--       -- c.macro,
--       -- c.search_count,
--       comps.cursor_position,
--       comps.scroll_bar,
--     },
--   }

--   local inactive = {
--     { -- left
--     },
--     { -- right
--       -- c.in_file_info,
--     },
--   }

--   opts.components = { active = active, inactive = inactive }
--   opts.force_inactive = { filetypes = { '^help$', '^neotest*', '.*Neotree.*', '^qf$' } }
--   opts.disable = { bufnames = { '.*Neotree.*' } }

--   -- make statusline transparent
--   palette.bg = 'NONE'

--   feline.setup(opts)
--   feline.use_theme(palette)
-- end

-- return {
--   'freddiehaddad/feline.nvim',
--   dependencies = {
--     -- "chrisgrieser/nvim-dr-lsp",
--     'catppuccin/nvim'
--   },
--   config = config,
-- }


-- local function lsp_spinner()
--   local spinners = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' }
--   local frame = 1

--   -- Define a timer to cycle through spinner characters
--   local timer = vim.loop.new_timer()
--   timer:start(
--       100,
--       100,
--       vim.schedule_wrap(function()
--           frame = frame % #spinners + 1
--           vim.cmd 'redrawstatus'
--       end)
--   )

--   -- Return the current spinner character
--   return function()
--       return spinners[frame]
--   end, timer
-- end

-- local function lsp_server_name()
--   local msg = ' LSP:'
--   local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
--   local clients = vim.lsp.get_active_clients()
--   if next(clients) == nil then
--       return msg .. ''
--   end

--   for _, client in ipairs(clients) do
--       local filetypes = client.config.filetypes
--       if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
--           return msg .. client.name
--       end
--   end
--   return msg
-- end

-- -- Disable components for neo-tree
-- local function disable_for_neotree()
--   local filename = vim.fn.expand '%:.'
--   return not filename:match 'neo%-tree'
-- end

-- local function config(_, opts)
--   local palette = require('catppuccin.palettes').get_palette 'mocha'

--   local feline = require 'feline'
--   local vi_mode = require 'feline.providers.vi_mode'
--   local file = require 'feline.providers.file'
--   local lsp = require 'feline.providers.lsp'
--   local separators = require('feline.defaults').statusline.separators.default_value

--   local spinner_provider, spinner_timer = lsp_spinner()

--   local count = 0

--   local lsp_timer -- Declare lsp_timer as a local variable within the config function

--   local comps = {
--       vim_mode = {
--           provider = function()
--               local str = vi_mode.get_vim_mode() .. count
--               count = count + 1
--               return str
--           end,
--           hl = function()
--               return { fg = vi_mode.get_mode_color(), bg = palette.surface1 }
--           end,
--           icon = ' ',
--           left_sep = {
--               always_visible = true,
--               str = separators.left_rounded,
--           },
--           right_sep = {
--               always_visible = true,
--               str = separators.right_rounded,
--           },
--       },
--       full_file_path = {
--           provider = function()
--               return vim.fn.expand '%:.'
--           end,
--           icon = function()
--               local icon_str, icon_color = require('nvim-web-devicons').get_icon_color(
--                   vim.fn.expand '%:t',
--                   nil, -- extension is already computed by nvim-web-devicons
--                   { default = true }
--               )
--               return {
--                   str = icon_str .. ' ',
--                   hl = { fg = icon_color },
--               }
--           end,
--           hl = { fg = palette.teal, bg = palette.surface2 },
--           left_sep = {
--               always_visible = true,
--               str = separators.left_rounded,
--           },
--           right_sep = {
--               always_visible = true,
--               str = separators.right_rounded,
--           },
--           enabled = disable_for_neotree,
--       },
--       lsp = {
--           provider = spinner_provider,
--           hl = function()
--               return {
--                   fg = 'green',
--                   bg = 'gray',
--               }
--           end,
--           left_sep = {
--               always_visible = true,
--               str = separators.left_rounded,
--           },
--           right_sep = {
--               always_visible = true,
--               str = separators.right_rounded,
--           },
--           enabled = disable_for_neotree,
--       },
--   }

--   local function update_lsp_component()
--       local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
--       local clients = vim.lsp.get_active_clients()
--       if next(clients) then
--           for _, client in ipairs(clients) do
--               local filetypes = client.config.filetypes
--               if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
--                   comps.lsp.provider = function()
--                       return client.name
--                   end
--                   vim.cmd 'redrawstatus'
--                   spinner_timer:stop() -- Stop the spinner timer
--                   lsp_timer:stop() -- Stop the lsp_timer
--                   return
--               end
--           end
--       end
--   end

--   -- Set up a timer to periodically update the LSP component
--   lsp_timer = vim.loop.new_timer() -- Initialize lsp_timer
--   lsp_timer:start(1000, 5000, vim.schedule_wrap(function()
--       update_lsp_component()
--   end))

--   local active = {
--       {
--           comps.vim_mode,
--           comps.full_file_path,
--       },
--       {
--           comps.lsp,
--       },
--       {
--           comps.cursor_position,
--           comps.scroll_bar,
--       },
--   }

--   local inactive = {
--       {},
--       {},
--   }

--   opts.components = { active = active, inactive = inactive }
--   opts.force_inactive = { filetypes = { '^help$', '^neotest*', '.*Neotree.*', '^qf$' } }
--   opts.disable = { bufnames = { '.*Neotree.*' } }

--   -- Make statusline transparent
--   palette.bg = 'NONE'

--   feline.setup(opts)
--   feline.use_theme(palette)
-- end

-- return {
--   'freddiehaddad/feline.nvim',
--   dependencies = {
--     'catppuccin/nvim'
--   },
--   config = config,
-- }

return {}
