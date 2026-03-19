local has_onedark, onedark = pcall(require, "onedark")
if has_onedark then
  onedark.setup({
    style = "darker",
  })
  onedark.load()
end

vim.g.NERDSpaceDelims = 1
vim.g.UltiSnipsExpandTrigger = "<c-a>"

local has_nvim_tree, nvim_tree = pcall(require, "nvim-tree")
if has_nvim_tree then
  local nvim_tree_api = require("nvim-tree.api")

  local function nvim_tree_on_attach(bufnr)
    nvim_tree_api.map.on_attach.default(bufnr)

    vim.keymap.set("n", "<C-t>", nvim_tree_api.tree.toggle, {
      buffer = bufnr,
      noremap = true,
      silent = true,
      nowait = true,
      desc = "nvim-tree: Toggle tree",
    })
  end

  nvim_tree.setup({
    on_attach = nvim_tree_on_attach,
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
end

local has_lualine, lualine = pcall(require, "lualine")
if has_lualine then
  lualine.setup({
    options = {
      theme = "onedark",
      component_separators = "",
      section_separators = "",
    },
  })
end

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

local has_treesitter, treesitter = pcall(require, "nvim-treesitter.configs")
if has_treesitter then
  treesitter.setup({
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
  })
end

local has_telescope, telescope = pcall(require, "telescope")
if has_telescope then
  telescope.setup({
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
end
