return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    -- 1. Prepend the Neovim logo to the Mode section
    opts.sections.lualine_a = {
      {
        "mode",
        fmt = function(str)
          return " " .. str
        end,
      },
    }

    -- 2. Helper function to fetch the active LSP name
    local function get_lsp_name()
      local msg = "No LSP"
      local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
      local clients = vim.lsp.get_clients({ bufnr = 0 })
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
    end

    -- 3. Insert the LSP component into section_x (right side)
    table.insert(opts.sections.lualine_x, 1, {
      get_lsp_name,
      icon = " ",
      color = { fg = "#7aa2f7", gui = "bold" }, -- Nice blue highlight, matches most themes
    })
  end,
}
