return {
	"lervag/vimtex",
	lazy = false, -- lazy-loading will disable inverse search
	config = function()
		vim.g.vimtex_mappings_disable = { ["n"] = { "K" } } -- disable `K` as it conflicts with LSP hover
		vim.g.vimtex_quickfix_method = vim.fn.executable("pplatex") == 1 and "pplatex" or "latexlog"
		vim.g.vimtex_view_method = "skim"
		vim.g.vimtex_quickfix_open_on_warning = 0
	end,
	keys = {
		{ "<leader>tc", "<cmd>VimtexCompile<cr>", desc = "Compile the texfile", ft = "tex" },
		{ "<leader>tr", "<cmd>VimtexReload<cr>", desc = "Reload the texfile", ft = "tex" },
		{ "<leader>tw", "<cmd>VimtexCountWords<cr>", desc = "Count Words of the texfile", ft = "tex" },
	},
}
