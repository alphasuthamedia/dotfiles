return {
	"mikesmithgh/gruvsquirrel.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("gruvsquirrel").setup()
		vim.cmd("colorscheme gruvsquirrel")
	end,
	opts = {},
}
