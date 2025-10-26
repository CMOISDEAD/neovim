return {
	{
		'saghen/blink.cmp',
		event = 'VimEnter',
		version = '1.*',
		dependencies = {
			{
				'L3MON4D3/LuaSnip',
				version = '2.*',
				build = (function()
					if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
						return
					end
					return 'make install_jsregexp'
				end)(),
				dependencies = {
					{
						'rafamadriz/friendly-snippets',
						config = function()
							require('luasnip.loaders.from_vscode').lazy_load()
						end,
					},
				},
				opts = {},
			},
			'folke/lazydev.nvim',
		},
		--- @module 'blink.cmp'
		--- @type blink.cmp.Config
		opts = {
			keymap = {
				preset = 'enter',
			},
			appearance = {
				nerd_font_variant = 'mono',
			},
			completion = {
				menu = {
					draw = {
						components = {
							kind_icon = {
								text = function(ctx)
									local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
									return kind_icon
								end,
								highlight = function(ctx)
									local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
									return hl
								end,
							},
							kind = {
								highlight = function(ctx)
									local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
									return hl
								end,
							},
						},
					},
				},
				documentation = { auto_show = true, auto_show_delay_ms = 500 },
				list = {
					selection = {
						preselect = false,
						auto_insert = true,
					},
				},
			},
			sources = {
				default = { 'lsp', 'path', 'snippets', 'lazydev' },
				providers = {
					lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
				},
			},
			snippets = { preset = 'luasnip' },
			fuzzy = { implementation = 'lua' },
			signature = { enabled = true },
		},
	},
}
