return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		require("lualine").setup({
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff" },
				lualine_c = { "filename" },
				lualine_x = { "diagnostics", "searchcount", "encoding", "fileformat", "filetype" },
				lualine_y = {},
				lualine_z = {
					function()
						return os.date("%S:%M:%I %p; %A, %d %B %Y")
					end,
				},
			},
		})
	end,
}
