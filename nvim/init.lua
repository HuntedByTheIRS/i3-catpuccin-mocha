-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- Keybindings for CodeCompanion
vim.keymap.set(
  { "n", "v" },
  "<C-a>",
  "<cmd>CodeCompanionActions<cr>",
  { noremap = true, silent = true, desc = "CodeCompanion Actions" }
)
vim.keymap.set(
  { "n", "v" },
  "<LocalLeader>cc",
  "<cmd>CodeCompanionChat<cr>",
  { noremap = true, silent = true, desc = "CodeCompanion Chat" }
)
vim.keymap.set(
  { "n", "v" },
  "<LocalLeader>ci",
  "<cmd>CodeCompanion<cr>",
  { noremap = true, silent = true, desc = "CodeCompanion Inline" }
)
vim.opt.wrap = true
-- Wrap text at word boundaries instead of characters
vim.opt.linebreak = true

-- Show a marker at the beginning of wrapped lines
vim.opt.showbreak = "↪ "

local lspconfig = require("lspconfig")

-- Configure the CUE language server
lspconfig.cue.setup({
  cmd = { "cue", "lsp", "serve" },
  filetypes = { "cue" },
  -- Optional: Trigger formatting automatically on save
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr, async = false })
        end,
      })
    end
  end,
})
