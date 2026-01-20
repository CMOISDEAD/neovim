return {
	'folke/snacks.nvim',
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		bigfile = { enabled = true },
		indent = { enabled = true },
		notifier = { enabled = true },
		quickfile = { enabled = true },
		scope = { enabled = true },
		words = { enabled = true },
		terminal = { enabled = true },
		scratch = { enabled = true },
	},
	keys = {
		{
			'<leader>tt',
			function()
				Snacks.terminal()
			end,
			desc = 'Toggle horizontal terminal',
		},
		{
			'<leader>tT',
			function()
				Snacks.terminal()
			end,
			desc = 'Toggle vertical terminal',
		},
		{
			'<leader>.',
			function()
				Snacks.scratch()
			end,
			desc = 'Toggle Scratch Buffer',
		},
		{
			'<leader>S',
			function()
				Snacks.scratch.select()
			end,
			desc = 'Select Scratch Buffer',
		},
		{
			'<leader>gz',
			function()
				Snacks.lazygit()
			end,
			desc = 'Toggle LazyGit',
		},
	},
}
