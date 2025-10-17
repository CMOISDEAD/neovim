return {
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		main = 'nvim-treesitter.configs',
		opts = {
			ensure_installed = {
				'lua',
				'vimdoc',
				'markdown',
				'typescript',
				'javascript',
				'python',
				'css',
				'html',
				'json',
			},
			auto_install = true,
		},
	},
}
