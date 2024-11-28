-- Indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.textwidth = 0

-- Interface
vim.opt.colorcolumn = "81"
vim.opt.cursorline = true
vim.opt.mouse = "a"
-- vim.opt.smartcase = true
vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.wrap = false
vim.opt.scrolloff = 5
vim.opt.conceallevel = 0

-- Spelling
vim.opt.wildmode = "longest,list,full"
if vim.g.vscode then
	vim.opt.spell = false
else
	vim.opt.spell = true
end
vim.opt.spelllang = "en_us,pl"
vim.opt.spellsuggest = "best,9"

-- Timing
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Vim diff

-- Interface
vim.opt.showmode = false
vim.opt.inccommand = "split"
vim.opt.signcolumn = "yes"
vim.opt.list = true
vim.opt.listchars = { tab = "· ", trail = "·", nbsp = "␣" }
vim.g.have_nerd_font = false

-- Use internal formatting for bindings like gq
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		vim.bo[args.buf].formatexpr = nil
	end,
})

-- Highlight bad spell as a grey underline, disable other suggests (VS Code)
if vim.g.vscode then
	vim.cmd.hi("Comment gui=none")
	vim.cmd.hi("clear SpellCap")
	vim.cmd.hi("clear SpellRare")
	vim.cmd.hi("clear SpellLocal")
	vim.cmd.hi("SpellBad gui=underline guisp=grey")
end

-- Path to the file where the selected colorscheme will be saved
local persist_file = vim.fn.stdpath("config") .. "/colorscheme.lua"

-- Function to save the current colorscheme to the persist file
local function save_colorscheme(scheme)
	local file = io.open(persist_file, "w")
	if file then
		file:write("vim.cmd('colorscheme " .. scheme .. "')\n")
		file:close()
	else
		print("Error: Unable to save colorscheme.")
	end
end

-- Load the saved colorscheme at startup
local function load_colorscheme()
	if vim.fn.filereadable(persist_file) == 1 then
		dofile(persist_file)
	else
		-- Fallback to a default colorscheme if none is saved
		vim.cmd("colorscheme default")
	end
end

-- Run the load_colorscheme function at startup
load_colorscheme()

-- Get the list of available colorschemes
local colorschemes = vim.fn.getcompletion("", "color")
local colorschemes_idx = vim.fn.index(colorschemes, vim.api.nvim_cmd({ cmd = "colorscheme" }, { output = true }))

-- Function to change the colorscheme and save the new one
local function change_colorscheme(forward)
	if forward then
		colorschemes_idx = colorschemes_idx + 1
	else
		colorschemes_idx = colorschemes_idx - 1
	end

	if colorschemes_idx > #colorschemes then
		colorschemes_idx = 1
	elseif colorschemes_idx < 1 then
		colorschemes_idx = #colorschemes
	end

	local ok = pcall(function()
		vim.cmd("colorscheme " .. colorschemes[colorschemes_idx])
	end)

	if ok then
		save_colorscheme(colorschemes[colorschemes_idx])
		print("Colorscheme set to: " .. colorschemes[colorschemes_idx])
	else
		change_colorscheme(forward)
	end
end

-- Key mappings for toggling colorschemes
vim.keymap.set("n", "<C-h>", function()
	change_colorscheme(true)
end)

vim.keymap.set("n", "<C-l>", function()
	change_colorscheme(false)
end)
