return {
	{
		'equal.nvim',
		dev = true,
		config = function()
			require('equal').setup {
				modes = { 'n', 'v' },
				keys = {
					calc_replace = '<leader>cc', -- 1 + 2 → 3
					calc_expand = '<leader>cC', -- 1 + 2 → 1 + 2 = 3
					open_repl = '<leader>cr',
					toggle_scratch = '<leader>cs',
				},
			}
		end,
	},
	{
		'marks.nvim',
		dev = true,
		config = function()
			require('marks').setup {
				enabled = true,
				wrap_m = true,
				refresh_delay_ms = 10,
			}
		end,
	},
}
