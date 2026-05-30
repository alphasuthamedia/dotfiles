return {
	-- Ini bukan plugin baru.
	-- Kita "menempel" ke nvim-lspconfig supaya lazy tahu
	-- bahwa config ini berhubungan dengan LSP.
	"neovim/nvim-lspconfig",

	-- Jalankan config ini saat event LspAttach terjadi.
	-- Artinya: saat LSP benar-benar attach ke buffer.
	event = "LspAttach",

	config = function(_, args)
		-- args.buf = buffer yang baru saja di-attach LSP
		-- Jadi keymap hanya berlaku untuk buffer itu saja.
		local opts = { buffer = args.buf, silent = true }

		------------------------------------------------------------------
		-- NAVIGATION (Lompat-lompat kode)
		------------------------------------------------------------------

		-- gd → Go to Definition
		-- Lompat ke tempat function/variable DIIMPLEMENTASIKAN.
		-- Biasanya ke body function.
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

		-- gD → Go to Declaration
		-- Lompat ke tempat symbol DIDEKLARASIKAN.
		-- Berguna di C/C++ (header vs source).
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

		-- gi → Go to Implementation
		-- Kalau lagi di interface/trait/abstract,
		-- lompat ke implementasi konkretnya.
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)

		-- gr → References
		-- Lihat semua tempat symbol itu dipakai.
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

		------------------------------------------------------------------
		-- INFO
		------------------------------------------------------------------

		-- K → Hover
		-- Tampilkan dokumentasi / tipe data / info singkat.
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

		-- Ctrl + k → Signature help
		-- Saat mengetik function(...), tampilkan parameter.
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)

		------------------------------------------------------------------
		-- REFACTOR
		------------------------------------------------------------------

		-- <leader>rn → Rename
		-- Ganti nama symbol di semua file yang terhubung.
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

		-- <leader>ca → Code Action
		-- Quick fix, auto import, dll (tergantung LSP server).
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

		------------------------------------------------------------------
		-- DIAGNOSTICS (Error / Warning)
		------------------------------------------------------------------

		-- [d → ke error sebelumnya
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

		-- ]d → ke error berikutnya
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

		-- <leader>e → tampilkan error di floating window
		vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
	end,
}
