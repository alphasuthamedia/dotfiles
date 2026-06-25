return {
  "supermaven-inc/supermaven-nvim",
  config = function()
    require("supermaven-nvim").setup({
      keymaps = {
        accept_suggestion = "<S-Tab>", -- ganti dari default <Tab> ke kombinasi lain
        clear_suggestion = "<C-]>",
        accept_word = "<C-j>",
      },
    })
  end,
}
