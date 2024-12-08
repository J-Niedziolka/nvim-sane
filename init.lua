require("remaps")
require("opt")
require("plugins")
require("autocmds")

<<<<<<< Updated upstream
-- vim.cmd([[colorscheme evening]])
vim.cmd(":source ~/.config/nvim/misc.vim")
=======
--vim.opt.clipboard = "xclip"
vim.cmd([[
	source ~/.config/nvim/misc.vim
	set runtimepath^=~/.vim runtimepath+=~/.vim/after
	let &packpath = &runtimepath
	source ~/.vimrc


" highlight all occurrances of word under cursor
" augroup highlight_current_word
"	set updatetime=300
"	au!
"au CursorHold * :exec 'match Search /\V\<' . expand('<cword>') . '\>/'
" augroup END
]])
>>>>>>> Stashed changes
