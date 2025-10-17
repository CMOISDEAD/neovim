return {
	{
		'nvim-mini/mini.nvim',
		config = function()
			local MiniExtra = require 'mini.extra'

			-- mini.colors
			require('mini.colors').setup {}
			vim.cmd 'colorscheme minicyan'

			-- mini.ai
			require('mini.ai').setup {
				n_lines = 500,
				custom_textobjects = {
					B = MiniExtra.gen_ai_spec.buffer(),
					F = require('mini.ai').gen_spec.treesitter { a = '@function.outer', i = '@function.inner' },
				},
				search_method = 'cover',
			}

			-- mini.surround
			require('mini.surround').setup()

			-- mini.statusline
			local statusline = require 'mini.statusline'
			statusline.setup { use_icons = vim.g.have_nerd_font }
			statusline.section_location = function()
				return '%2l:%-2v'
			end

			-- mini.tabline
			require('mini.tabline').setup()

			-- mini.basics
			require('mini.basics').setup {
				options = { basic = false },
				mappings = {
					basic = true,
					windows = true,
					move_with_alt = true,
				},
			}

			-- mini.icons
			local ext3_blocklist = { scm = true, txt = true, yml = true }
			local ext4_blocklist = { json = true, yaml = true }
			require('mini.icons').setup {
				use_file_extension = function(ext, _)
					return not (ext3_blocklist[ext:sub(-3)] or ext4_blocklist[ext:sub(-4)])
				end,
			}

			-- mini.notify
			require('mini.notify').setup()

			-- mini.extra
			require('mini.extra').setup()

			-- mini.bufremove
			require('mini.bufremove').setup()

			-- mini.comment
			require('mini.comment').setup()

			-- mini.cursorword
			require('mini.cursorword').setup()

			-- mini.files
			require('mini.files').setup { windows = { preview = true } }

			-- mini.hipatterns
			local hipatterns = require 'mini.hipatterns'
			local hi_words = MiniExtra.gen_highlighter.words
			hipatterns.setup {
				highlighters = {
					fixme = hi_words({ 'FIXME', 'Fixme', 'fixme' }, 'MiniHipatternsFixme'),
					hack = hi_words({ 'HACK', 'Hack', 'hack' }, 'MiniHipatternsHack'),
					todo = hi_words({ 'TODO', 'Todo', 'todo' }, 'MiniHipatternsTodo'),
					note = hi_words({ 'NOTE', 'Note', 'note' }, 'MiniHipatternsNote'),
					hex_color = hipatterns.gen_highlighter.hex_color(),
				},
			}

			-- mini.jump
			require('mini.jump').setup()

			-- mini.jump2d
			require('mini.jump2d').setup()

			-- mini.git
			require('mini.git').setup()

			-- mini.diff
			require('mini.diff').setup()

			-- mini.move
			require('mini.move').setup()

			-- mini.operators
			require('mini.operators').setup()

			-- mini.pairs
			require('mini.pairs').setup()

			-- mini.pick
			require('mini.pick').setup()

			-- mini.trailspace
			require('mini.trailspace').setup()

			-- mini.clue
			local miniclue = require 'mini.clue'
			miniclue.setup {
				triggers = {
					-- Leader triggers
					{ mode = 'n', keys = '<Leader>' },
					{ mode = 'x', keys = '<Leader>' },

					-- Built-in completion
					{ mode = 'i', keys = '<C-x>' },

					-- `g` key
					{ mode = 'n', keys = 'g' },
					{ mode = 'x', keys = 'g' },

					-- Marks
					{ mode = 'n', keys = "'" },
					{ mode = 'n', keys = '`' },
					{ mode = 'x', keys = "'" },
					{ mode = 'x', keys = '`' },

					-- Registers
					{ mode = 'n', keys = '"' },
					{ mode = 'x', keys = '"' },
					{ mode = 'i', keys = '<C-r>' },
					{ mode = 'c', keys = '<C-r>' },

					-- Window commands
					{ mode = 'n', keys = '<C-w>' },

					-- `z` key
					{ mode = 'n', keys = 'z' },
					{ mode = 'x', keys = 'z' },
				},
				clues = {
					{
						{ mode = 'n', keys = '<Leader>b', desc = '+Buffer' },
						{ mode = 'n', keys = '<Leader>e', desc = '+Explore/Edit' },
						{ mode = 'n', keys = '<Leader>f', desc = '+Find' },
						{ mode = 'n', keys = '<Leader>g', desc = '+Git' },
						{ mode = 'n', keys = '<Leader>l', desc = '+Language' },
						{ mode = 'n', keys = '<Leader>s', desc = '+Search' },
						{ mode = 'n', keys = '<Leader>t', desc = '+Terminal' },
						{ mode = 'n', keys = '<Leader>q', desc = '+Quit' },

						{ mode = 'x', keys = '<Leader>l', desc = '+Language' },
					},
					miniclue.gen_clues.builtin_completion(),
					miniclue.gen_clues.g(),
					miniclue.gen_clues.marks(),
					miniclue.gen_clues.registers(),
					miniclue.gen_clues.windows(),
					miniclue.gen_clues.z(),
				},
			}

			-- mini.indentscope
			require('mini.indentscope').setup()

			-- mini.trailspace
			require('mini.trailspace').setup()

			-- mini.misc
			local minimisc = require 'mini.misc'
			minimisc.setup()
			minimisc.setup_restore_cursor()
			minimisc.setup_termbg_sync()
		end,
	},
}
