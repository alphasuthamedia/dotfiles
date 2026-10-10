return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	config = function()
		require("conform").setup({
			format_on_save = {
				lsp_fallback = true,
			},
		})
	end,
}
