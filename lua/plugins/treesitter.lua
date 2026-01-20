return {
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		main = 'nvim-treesitter.configs',
		opts = {
			highlight = {
				enable = true,
			},
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
				'rust',
				'yaml',
			},
			auto_install = true,
		},
	},
}
