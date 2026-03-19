local uv = vim.uv or vim.loop
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "navarasu/onedark.nvim", priority = 1000 },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
  "scrooloose/nerdcommenter",
  "romainl/vim-cool",
  "christoomey/vim-tmux-navigator",
  "lewis6991/gitsigns.nvim",
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",
  "easymotion/vim-easymotion",
  "terryma/vim-multiple-cursors",
  "ntpeters/vim-better-whitespace",
  "psliwka/vim-smoothie",
  {
    "SirVer/ultisnips",
    dependencies = {
      "honza/vim-snippets",
    },
  },
  "pantharshit00/vim-prisma",
  "styled-components/vim-styled-components",
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  "neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
  },
  {
    "hoob3rt/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
}, {
  change_detection = {
    notify = false,
  },
  install = {
    missing = false,
  },
  checker = {
    enabled = false,
  },
})
