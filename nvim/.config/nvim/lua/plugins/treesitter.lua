return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	lazy = false,
	priority = 1000,
	config = function()
		local ok, configs = pcall(require, "nvim-treesitter.config")
		if not ok then
			vim.notify("nvim-treesitter belum terinstall, restart Neovim setelah install selesai", vim.log.levels.WARN)
			return
		end
		configs.setup({
			ensure_installed = { "lua", "javascript", "typescript", "tsx", "css", "html", "json" },
			sync_install = false,
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
