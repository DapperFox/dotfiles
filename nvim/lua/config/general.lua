require("config.terminal_theme").setup()

local has_luasnip, luasnip = pcall(require, "luasnip")
if has_luasnip then
  luasnip.config.setup({
    history = true,
    updateevents = "TextChanged,TextChangedI",
  })

  require("luasnip.loaders.from_vscode").lazy_load()
  require("luasnip.loaders.from_lua").lazy_load({
    paths = vim.fn.stdpath("config") .. "/luasnippets",
  })

  luasnip.filetype_extend("typescript", { "javascript" })
  luasnip.filetype_extend("typescriptreact", { "javascript" })

  vim.keymap.set({ "i", "s" }, "<c-a>", function()
    if luasnip.expand_or_jumpable() then
      luasnip.expand_or_jump()
    end
  end, { silent = true, desc = "LuaSnip expand or jump" })

  vim.keymap.set({ "i", "s" }, "<c-j>", function()
    if luasnip.jumpable(1) then
      luasnip.jump(1)
    end
  end, { silent = true, desc = "LuaSnip jump forward" })

  vim.keymap.set({ "i", "s" }, "<c-k>", function()
    if luasnip.jumpable(-1) then
      luasnip.jump(-1)
    end
  end, { silent = true, desc = "LuaSnip jump backward" })
end

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
      theme = "auto",
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

local has_treesitter, treesitter = pcall(require, "nvim-treesitter")
if has_treesitter then
  treesitter.install({
    "css",
    "elixir",
    "graphql",
    "html",
    "javascript",
    "jsdoc",
    "json",
    "lua",
    "markdown",
    "markdown_inline",
    "prisma",
    "python",
    "scss",
    "tsx",
    "typescript",
    "vim",
    "vimdoc",
    "yaml",
  })

  vim.treesitter.language.register("json", "jsonc")

  vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("UserTreesitter", { clear = true }),
    callback = function(args)
      if not pcall(vim.treesitter.start, args.buf) then
        return
      end

      vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
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

  pcall(telescope.load_extension, "fzf")
end
