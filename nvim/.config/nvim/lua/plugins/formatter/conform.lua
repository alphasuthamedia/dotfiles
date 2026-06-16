return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
        			java = { "google-java-format" },
			},

			format_on_save = {
				lsp_fallback = true,
			},
		})
	end,
}
