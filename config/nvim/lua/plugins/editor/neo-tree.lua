return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  lazy = false,

  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },

  keys = {
    {
      "<leader>fe",
      "<cmd>Neotree toggle<CR>",
      desc = "File Explorer",
    },
  },

  opts = {
    filesystem = {
      follow_current_file = {
        enabled = true,
      },
    },
  },
}
