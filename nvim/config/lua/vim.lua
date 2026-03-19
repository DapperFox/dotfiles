vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local python_provider = vim.fn.stdpath("config") .. "/.python-provider/bin/python"
if vim.fn.executable(python_provider) == 1 then
  vim.g.python3_host_prog = python_provider
end

vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.wrap = false
vim.opt.clipboard = "unnamedplus"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.mouse = ""
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.iskeyword:append("-")
vim.opt.listchars = { tab = ">-", trail = "-", nbsp = "+" }
vim.opt.wildmenu = true
vim.opt.visualbell = true
vim.opt.errorbells = false
vim.opt.lazyredraw = true
vim.opt.autoread = true
vim.opt.display = "lastline"
vim.opt.path = { ".", "src" }
vim.opt.suffixesadd = { ".js", ".jsx", ".ts", ".tsx" }
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 4
vim.opt.sidescrolloff = 8
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.completeopt = { "menuone", "noselect", "popup" }
vim.opt.cursorline = true

if vim.fn.executable("rg") == 1 then
  vim.opt.grepprg = "rg --vimgrep --smart-case --hidden"
  vim.opt.grepformat = "%f:%l:%c:%m"
end

vim.api.nvim_set_hl(0, "LineNr", { ctermbg = "NONE" })

vim.cmd([[
  cabbrev tn tabnew
  cabbrev th tabprevious
  cabbrev tl tabnext
  cabbrev td tabclose
]])

local map = vim.keymap.set

map("n", "<C-t>", "<cmd>NvimTreeToggle<CR>", { silent = true, desc = "Toggle file tree" })
map("n", "<C-r>", "<cmd>NvimTreeFindFile<CR>", { silent = true, desc = "Reveal file in tree" })
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { silent = true, desc = "Toggle file tree" })
map("n", "<leader>o", "<cmd>NvimTreeFindFile<CR>", { silent = true, desc = "Reveal file in tree" })
map("n", "<C-p>", "<cmd>Telescope find_files<CR>", { silent = true, desc = "Find files" })
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { silent = true, desc = "Find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { silent = true, desc = "Live grep" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { silent = true, desc = "Help tags" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { silent = true, desc = "Buffers" })
map("n", "<leader>a", "<cmd>Telescope live_grep<CR>", { silent = true, desc = "Live grep" })
map("n", "<leader>b", "<cmd>Telescope buffers<CR>", { silent = true, desc = "Buffers" })
map("n", "<leader>lf", "<cmd>Format<CR>", { silent = true, desc = "Format buffer" })
map("n", "<C-c>", "<cmd>nohlsearch<CR><C-c>", { silent = true, desc = "Clear search highlight" })
map("n", ",cs", function()
  vim.fn.setreg("+", vim.fn.expand("%"))
end, { desc = "Copy relative path" })
map("n", ",cl", function()
  vim.fn.setreg("+", vim.fn.expand("%:p"))
end, { desc = "Copy absolute path" })

if vim.fn.executable("jq") == 1 then
  map("n", "<leader>fj", "<cmd>%!jq '.'<CR>", { silent = true, desc = "Format JSON with jq" })
end

function _G.LoadMainNodeModule(fname)
  local node_modules = "./node_modules/"
  local package_json_path = node_modules .. fname .. "/package.json"

  if vim.fn.filereadable(package_json_path) == 1 then
    local package_json = vim.fn.json_decode(table.concat(vim.fn.readfile(package_json_path), ""))
    if package_json and package_json.main then
      return node_modules .. fname .. "/" .. package_json.main
    end
  end

  return node_modules .. fname
end

vim.opt.includeexpr = "v:lua.LoadMainNodeModule(v:fname)"

local startup_argv = vim.fn.argv()
local startup_target = startup_argv[1]

if #startup_argv == 1 and type(startup_target) == "string" and vim.fn.isdirectory(startup_target) == 1 then
  local startup_dir = vim.fn.fnamemodify(startup_target, ":p")
  local startup_group = vim.api.nvim_create_augroup("TelescopeDirectoryStartup", { clear = true })

  vim.api.nvim_create_autocmd("VimEnter", {
    group = startup_group,
    once = true,
    callback = function()
      if #vim.api.nvim_list_uis() == 0 then
        return
      end

      vim.schedule(function()
        local ok, builtin = pcall(require, "telescope.builtin")
        if not ok then
          return
        end

        vim.api.nvim_set_current_dir(startup_dir)
        pcall(vim.cmd, "NvimTreeClose")

        local current_buf = vim.api.nvim_get_current_buf()
        local current_name = vim.api.nvim_buf_get_name(current_buf)

        if current_name ~= "" and vim.fn.isdirectory(current_name) == 1 and not vim.bo[current_buf].modified then
          vim.cmd.enew()
          pcall(vim.api.nvim_buf_delete, current_buf, { force = true })
        end

        builtin.find_files({ cwd = startup_dir })
      end)
    end,
  })
end
