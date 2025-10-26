return {
	{
		'zbirenbaum/copilot.lua',
		cmd = 'Copilot',
		event = 'InsertEnter',
		build = ':Copilot auth',
		dependencies = {
			-- {
			-- 	'copilotlsp-nvim/copilot-lsp',
			-- 	config = function()
			-- 		vim.g.copilot_nes_debounce = 500
			-- 	end,
			-- },
		},
		config = function()
			require('copilot').setup {
				suggestions = {
					enabled = true,
					auto_trigger = true,
					keymap = {
						accept = false,
					},
				},
			}
		end,
	},
}
