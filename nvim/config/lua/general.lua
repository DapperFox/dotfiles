local onedark = require("onedark")
onedark.setup({
  style = "darker",
})
onedark.load()

vim.g.NERDSpaceDelims = 1
vim.g.UltiSnipsExpandTrigger = "<c-a>"

require("nvim-tree").setup({
  hijack_cursor = true,
  sync_root_with_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true,
  },
  view = {
    side = "right",
    width = 36,
    preserve_window_proportions = true,
  },
  renderer = {
    group_empty = true,
  },
})

require("lualine").setup({
  options = {
    theme = "onedark",
    component_separators = "",
    section_separators = "",
  },
})

local has_gitsigns, gitsigns = pcall(require, "gitsigns")
if has_gitsigns then
  gitsigns.setup({
    signs = {
      add = { text = "+" },
      change = { text = "~" },
      delete = { text = "_" },
      topdelete = { text = "-" },
      changedelete = { text = "~" },
    },
    current_line_blame = false,
    signcolumn = true,
    watch_gitdir = {
      follow_files = true,
    },
  })
end

require("nvim-treesitter.configs").setup({
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
})

require("telescope").setup({
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      ".git/",
    },
    layout_config = {
      prompt_position = "top",
    },
    path_display = {
      "smart",
    },
    sorting_strategy = "ascending",
  },
})
