return {
	"akinsho/bufferline.nvim",
	keys = {
		-- updating these keys as H and L are taken by start and end of line
		{ "<Left>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
		{ "<Right>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
	},
}
