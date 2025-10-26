local utils = require 'config.utils'

-- [[ Basic Autocommands ]]
vim.api.nvim_create_autocmd('FileType', {
	desc = 'Proper "formatoptions"',
	group = vim.api.nvim_create_augroup('no-comments-o', { clear = true }),
	callback = function()
		vim.cmd 'setlocal formatoptions-=c formatoptions-=o'
	end,
})

vim.api.nvim_create_autocmd('VimEnter', {
	desc = 'Show custom dashboard on startup',
	group = vim.api.nvim_create_augroup('Dashboard', { clear = true }),
	callback = utils.show_tip,
})
