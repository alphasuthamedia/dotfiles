return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				javascriptreact = { "prettierd" },
				typescriptreact = { "prettierd" },
				json = { "prettierd" },
				css = { "prettierd" },
				html = { "prettierd" },
				lua = { "stylua" },
				python = { "black" },
				c = { "clang_format" },
				cpp = { "clang_format" },
			},
			format_on_save = {
				lsp_fallback = true,
			},
		})
	end,
}
