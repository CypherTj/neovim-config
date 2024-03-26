return {
  -- 'folke/tokyonight.nvim',
  -- lazy = false,
  -- priority = 1000, -- make sure to load this before all the other start plugins
  -- config = function()
  --     require('tokyonight').setup({
  --         style = 'moon',
  --         transparent = true
  --     })
  --     -- Load the colorscheme here.
  --     -- Like many other themes, this one has different styles, and you could load
  --     -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
  --     vim.cmd.colorscheme 'tokyonight-moon'
  --     -- You can configure highlights by doing something like
  --     vim.cmd.hi 'Comment gui=none'
  -- end

  -- "savq/melange-nvim",
  -- lazy = false,
  -- priority = 1000,
  -- config = function()
  --     vim.opt.termguicolors = true
  --     vim.cmd.colorscheme 'melange'
  -- end

  -- "rebelot/kanagawa.nvim",
  -- lazy = false,
  -- priority = 1000,
  -- config = function()
  --     -- Default options:
  --     require('kanagawa').setup({
  --         compile = false, -- enable compiling the colorscheme
  --         undercurl = true, -- enable undercurls
  --         commentStyle = {
  --             italic = true
  --         },
  --         functionStyle = {},
  --         keywordStyle = {
  --             italic = true
  --         },
  --         statementStyle = {
  --             bold = true
  --         },
  --         typeStyle = {},
  --         transparent = true, -- do not set background color
  --         dimInactive = false, -- dim inactive window `:h hl-NormalNC`
  --         terminalColors = true, -- define vim.g.terminal_color_{0,17}
  --         colors = { -- add/modify theme and palette colors
  --             palette = {},
  --             theme = {
  --                 wave = {},
  --                 lotus = {},
  --                 dragon = {},
  --                 all = {}
  --             }
  --         },
  --         overrides = function(colors) -- add/modify highlights
  --             return {}
  --         end,
  --         theme = "wave", -- Load "wave" theme when 'background' option is not set
  --         background = { -- map the value of 'background' option to a theme
  --             dark = "dragon", -- try "dragon" !
  --             light = "lotus"
  --         }
  --     })

  --     -- setup must be called before loading
  --     vim.cmd("colorscheme kanagawa")
  -- end

  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function()
    require('catppuccin').setup {
      flavour = 'mocha', -- latte, frappe, macchiato, mocha
      -- flavour = "auto" -- will respect terminal's background
      background = { -- :h background
        light = 'latte',
        dark = 'mocha',
      },
      transparent_background = false, -- disables setting the background color.
      show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
      term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
      dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = 'dark',
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
      },
      no_italic = false, -- Force no italic
      no_bold = false, -- Force no bold
      no_underline = false, -- Force no underline
      styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { 'italic' }, -- Change the style of comments
        conditionals = { 'italic' },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
        -- miscs = {}, -- Uncomment to turn off hard-coded styles
      },
      color_overrides = {
        -- mocha = {
        -- 	rosewater = "#efc9c2",
        -- 	flamingo = "#ebb2b2",
        -- 	pink = "#f2a7de",
        -- 	mauve = "#b889f4",
        -- 	red = "#ea7183",
        -- 	maroon = "#ea838c",
        -- 	peach = "#f39967",
        -- 	yellow = "#eaca89",
        -- 	green = "#96d382",
        -- 	teal = "#78cec1",
        -- 	sky = "#91d7e3",
        -- 	sapphire = "#68bae0",
        -- 	blue = "#739df2",
        -- 	lavender = "#a0a8f6",
        -- 	text = "#b5c1f1",
        -- 	subtext1 = "#a6b0d8",
        -- 	subtext0 = "#959ec2",
        -- 	overlay2 = "#848cad",
        -- 	overlay1 = "#717997",
        -- 	overlay0 = "#63677f",
        -- 	surface2 = "#505469",
        -- 	surface1 = "#3e4255",
        -- 	surface0 = "#2c2f40",
        -- 	base = "#1a1c2a",
        -- 	mantle = "#141620",
        -- 	crust = "#0e0f16",
        -- },
      },
      custom_highlights = {},
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
          enabled = true,
          indentscope_color = '',
        },
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
      },
    }

    -- setup must be called before loading
    vim.cmd.colorscheme 'catppuccin'
  end,
}
