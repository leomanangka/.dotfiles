return {
	-- Mason
	{
		"williamboman/mason.nvim",
		name = "mason",
		config = function()
			require("mason").setup()
		end,
	},
	-- mason-lspconfig
	{
		"williamboman/mason-lspconfig.nvim",
		name = "mason-lspconfig",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"clangd",
					"typos_lsp",
				},
			})
		end,
	},
	-- nvim-lspconfig
	{
		"neovim/nvim-lspconfig",
		name = "nvim-lspconfig",
		config = function()
			vim.diagnostic.config({
				virtual_text = {
					prefix = "●", -- Could be '●', '▎', 'x'
				},
			})

			--			local sign = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
			--
			--			for type, icon in pairs(sign) do
			--				local hl = "DiagnosticSign" .. type
			--				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			--			end

			for _, diag in ipairs({ "Error", "Warn", "Info", "Hint" }) do
				vim.fn.sign_define("DiagnosticSign" .. diag, {
					text = "",
					texthl = "DiagnosticSign" .. diag,
					linehl = "",
					numhl = "DiagnosticFloating" .. diag,
				})
			end

			local cap = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			-- SETUP LANGUAGE SERVER HERE(IMPORTANT)
			lspconfig.lua_ls.setup({
				capabilities = cap,
			})
			lspconfig.clangd.setup({
				capabilities = cap,
				cmd = {
					"clangd",
					"--offset-encoding=utf-16",
				},
			})
			lspconfig.cmake.setup({
				capabilities = cap,
			})
			lspconfig.typos_lsp.setup({
				capabilities = cap,
			})
			lspconfig.bashls.setup({
				capabilities = cap,
			})
			lspconfig.pylsp.setup({
				capabilities = cap,
			})
			lspconfig.html.setup({
				capabilities = cap,
			})
			lspconfig.gopls.setup({
				capabilities = cap,
			})
		end,
	},
}
