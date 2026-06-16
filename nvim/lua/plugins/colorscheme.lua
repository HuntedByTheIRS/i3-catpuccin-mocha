return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false, -- 👈 This tells Lazy to load it immediately on startup
    priority = 1000, -- 👈 This ensures it loads before all other plugins
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = true,
        term_colors = true,
        dim_inactive = {
          enabled = false,
        },
        -- Deeper, near-black palette overrides
        color_overrides = {
          mocha = {
            base = "#11111B",
            mantle = "#0B0B11",
            crust = "#040407",
          },
        },
        styles = {
          comments = { "italic" },
          conditionals = { "italic" },
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
        },
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          notify = true,
          noice = true,
          mini = {
            enabled = true,
            indentscope_color = "",
          },
        },
        custom_highlights = function(colors)
          return {
            -- NvChad style Telescope (Borderless, solid block headings)
            TelescopeBorder = { fg = colors.mantle, bg = colors.mantle },
            TelescopeNormal = { bg = colors.mantle },
            TelescopePreviewBorder = { fg = colors.crust, bg = colors.crust },
            TelescopePreviewNormal = { bg = colors.crust },
            TelescopePromptBorder = { fg = colors.base, bg = colors.base },
            TelescopePromptNormal = { bg = colors.base },
            TelescopePromptTitle = { fg = colors.base, bg = colors.blue },
            TelescopePreviewTitle = { fg = colors.base, bg = colors.green },
            TelescopeResultsTitle = { fg = colors.mantle, bg = colors.mantle },
            TelescopeSelection = { bg = colors.surface0, fg = colors.text },

            -- Clean borders for Noice and floating windows
            NoiceCmdlinePopup = { bg = colors.mantle },
            NoiceCmdlinePopupBorder = { fg = colors.purple, bg = colors.mantle },
            FloatBorder = { fg = colors.surface1, bg = colors.none },
            NormalFloat = { bg = colors.none },
          }
        end,
      })

      -- Load the colorscheme
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
