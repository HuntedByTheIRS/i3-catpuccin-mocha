return {
  "saghen/blink.cmp",
  -- Optional: provides snippets for the snippet source
  dependencies = "rafamadriz/friendly-snippets",

  -- Use a release tag to download pre-built binaries (highly recommended)
  version = "*",

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- 'default' for mappings similar to built-in completion
    -- 'super-tab' for mappings similar to vscode (Tab to accept/next item)
    keymap = { preset = "super-tab" },

    appearance = {
      -- Sets the fallback highlight groups to nvim-cmp's highlight groups
      -- Useful for when your colorscheme doesn't support blink.cmp yet
      use_nvim_cmp_as_default = true,
      -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      nerd_font_variant = "mono",
    },

    -- Default sources to use
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },

    -- Make it look gorgeous
    completion = {
      -- Show documentation panel automatically when selecting an item
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
        window = { border = "rounded" },
      },

      -- Customize the execution fish-eye completion menu
      menu = {
        border = "rounded",
        draw = {
          -- We use columns to layout the completion menu items
          columns = {
            { "kind_icon", gap = 1 },
            { "label", "label_description", gap = 1 },
            { "source_name" },
          },
          components = {
            -- Styling the source name to look like [LSP] or [Path]
            source_name = {
              width = { max = 30 },
              text = function(ctx)
                return "[" .. ctx.source_name .. "]"
              end,
              highlight = "BlinkCmpSource",
            },
          },
        },
      },

      -- Display an inline preview of the suggestion (Ghost Text) like Copilot
      ghost_text = { enabled = true },
    },

    -- Experimental signature help support (shows parameters as you type functions)
    signature = {
      enabled = true,
      window = { border = "rounded" },
    },
  },
  opts_extend = { "sources.default" },
}
