--[[
 remaps must be loaded before plugins
 ops must be loaded after these to enable my own config/toggle colors
 ]]
require("remaps")
require("plugins")
require("autocmds")
require("opt")

--vim.cmd([[colorscheme evening]])
vim.cmd(":source ~/.config/nvim/misc.vim")
-- vim.opt.clipboard = "xclip"
vim.cmd([[
	source ~/.config/nvim/misc.vim
	set runtimepath^=~/.vim runtimepath+=~/.vim/after
	let &packpath = &runtimepath
	source ~/.vimrc]])

--[[
--	highlight all occurrences of word under cursor
-- augroup highlight_current_word
-- set updatetime=300
--	au!
-- au CursorHold * :exec 'match Search /\V\<' . expand('<cword>') . '\>/'
-- augroup END
]]
