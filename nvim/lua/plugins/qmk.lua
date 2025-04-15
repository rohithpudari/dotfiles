return {
	"codethread/qmk.nvim",
	config = function()
		---@type qmk.UserConfig
		local conf = {
			name = "Layout_zmk",
			variant = "zmk",
			layout = {
				"x x x x x x x _ _ _ _ _ _ _ _ _ _ x x x x x x x",
				"x x x x x x x _ _ _ _ _ _ _ _ _ _ x x x x x x x",
				"x x x x x x x _ _ x x _ _ x x _ _ x x x x x x x",
				"x x x x x x _ _ _ _ x _ _ x _ _ _ _ x x x x x x",
				"x x x x x _ _ _ x x x _ _ x x x _ _ _ x x x x x",
			},
		}
		require("qmk").setup(conf)
	end,
}
