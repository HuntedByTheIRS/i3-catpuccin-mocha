return {
  -- 1. Configure Neogit
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- strongly recommended for diff views
      "nvim-telescope/telescope.nvim", -- optional git integration
    },
    config = true,
    keys = {
      -- Map <leader>gn to open Neogit status full screen
      { "<leader>gn", "<cmd>Neogit<cr>", desc = "Neogit Status" },
    },
  },

  -- 2. Configure Oil.nvim
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional icons
    opts = {
      -- Optional configuration options here
      default_file_explorer = true, -- Replaces netrw
      columns = {
        "icon",
        "permissions",
        "size",
        "mtime",
      },
    },
    keys = {
      -- Map minus (-) to open Oil in the current directory (standard Oil mapping)
      { "<leader>fo", "<cmd>Oil<cr>", desc = "Open parent directory with Oil" },
    },
  },
}
