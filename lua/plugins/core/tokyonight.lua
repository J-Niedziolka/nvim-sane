return {
	"folke/tokyonight.nvim",
	priority = 1000,
	init = function()
		if vim.g.colors_name == nil then
			vim.cmd.colorscheme("tokyonight-night")
		end

		vim.cmd.hi("Comment gui=none")
		vim.cmd.hi("clear SpellCap")
		vim.cmd.hi("clear SpellRare")
		vim.cmd.hi("clear SpellLocal")
		vim.cmd.hi("SpellBad gui=underline guisp=grey")
	end,
	lazy = false,
	opts = { transparent = true },
}
