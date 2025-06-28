-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
-- store original vimwiki_list config, we will need it later
-- !!!make sure vimwiki plugin is loaded before running this!!!

-- add diary template for every new file
vim.api.nvim_create_autocmd("BufNewFile", {
	pattern = { "*/notes/diary/*.md" },
	callback = function()
		local date = os.date("%A, %B %d, %Y") -- e.g., Saturday, June 28, 2025
		local template = string.format(
			[[
# %s

## Todo

- [ ]

## Notes
]],
			date
		)
		vim.api.nvim_buf_set_lines(0, 0, 0, false, vim.split(template, "\n"))
	end,
})
