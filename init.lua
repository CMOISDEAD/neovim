require 'options'
require 'keymaps'

-- [[ Basic Autocommands ]]
vim.api.nvim_create_autocmd('FileType', {
  desc = "Proper 'formatoptions'",
  group = vim.api.nvim_create_augroup('no-comments-o', { clear = true }),
  callback = function()
    vim.cmd 'setlocal formatoptions-=c formatoptions-=o'
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
require('lazy').setup {
  spec = {
    {
      'folke/lazydev.nvim',
      ft = 'lua',
      opts = {
        library = {
          { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
        },
      },
    },
    { import = 'plugins' },
  },
}
