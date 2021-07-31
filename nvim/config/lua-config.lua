local lualine = require('lualine')
lualine.setup {
  options = {
    theme = 'onedark'
  }
}

local treesitter = require('nvim-treesitter.configs')
treesitter.setup {
  ensure_installed = 'maintained',
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  }
}

local telescope = require('telescope')
telescope.setup{
  defaults = {
    file_ignore_patterns = {"node_modules"}
  }
}
