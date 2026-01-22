return {
	{
		'MagicDuck/grug-far.nvim',
		config = function()
			require('grug-far').setup {}
		end,
		keys = {
			{
				'<leader>sr',
				function()
					local grug = require 'grug-far'
					local ext = vim.bo.buftype == '' and vim.fn.expand '%:e'
					grug.open {
						transient = true,
						prefills = {
							filesFilter = ext and ext ~= '' and '*.' .. ext or nil,
						},
					}
				end,
				mode = { 'n', 'v' },
				desc = 'Search and Replace',
			},
		},
	},
	{
		'wakatime/vim-wakatime',
	},
	{
		'MeanderingProgrammer/render-markdown.nvim',
		dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' }, -- if you use the mini.nvim suite
		opts = {},
	},
	{
		'vague-theme/vague.nvim',
		lazy = false,
		priority = 1000,
	},
}
