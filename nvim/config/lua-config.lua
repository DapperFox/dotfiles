local lualine = require('lualine')
lualine.setup {
  options = {
    theme = 'nord',
    section_separators = {'', ''},
  }
}

local treesitter = require('nvim-treesitter.configs')
treesitter.setup {
  ensure_installed = {'elixir', 'javascript', 'graphql', 'html', 'http', 'json', 'markdown', 'prisma', 'typescript', 'vim', 'lua', 'sql', 'css', 'gitignore', 'dockerfile', 'comment'},
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  }
}

local telescope = require('telescope')
telescope.setup {
  defaults = {
    file_ignore_patterns = {"node_modules"}
  }
}
