return {
	{
		"tris203/rzls.nvim",
		ft = { "razor", "cshtml" },
		config = function()
			require("rzls").setup({
				-- Configuration options can be added here
				-- capabilities: passed automatically from your LSP setup
				-- on_attach: handled by LazyVim's default on_attach
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"html",
				"css",
				"javascript",
				"c_sharp",
			},
		},
	},
}