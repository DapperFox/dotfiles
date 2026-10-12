local M = {}

local lsp_methods = vim.lsp.protocol.Methods

local prettier_filetypes = {
  css = true,
  graphql = true,
  html = true,
  javascript = true,
  javascriptreact = true,
  json = true,
  jsonc = true,
  markdown = true,
  scss = true,
  typescript = true,
  typescriptreact = true,
  yaml = true,
}

local function find_local_binary(bufnr, binary)
  local bufname = vim.api.nvim_buf_get_name(bufnr)
  local start_path = bufname ~= "" and vim.fs.dirname(bufname) or vim.uv.cwd()
  local matches = vim.fs.find({ "node_modules/.bin/" .. binary }, {
    path = start_path,
    type = "file",
    upward = true,
  })

  return matches[1]
end

local function prettier_command(bufnr)
  local bufname = vim.api.nvim_buf_get_name(bufnr)
  if bufname == "" then
    return nil
  end

  local prettierd = find_local_binary(bufnr, "prettierd")
  if prettierd or vim.fn.executable("prettierd") == 1 then
    return { prettierd or "prettierd", bufname }
  end

  local prettier = find_local_binary(bufnr, "prettier")
  if prettier or vim.fn.executable("prettier") == 1 then
    return { prettier or "prettier", "--stdin-filepath", bufname }
  end

  return nil
end

local function replace_buffer_text(bufnr, text)
  local view = vim.fn.winsaveview()
  local lines = vim.split(text, "\n", { plain = true })

  if text:sub(-1) == "\n" then
    table.remove(lines, #lines)
  end

  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
  vim.fn.winrestview(view)
end

local function format_with_prettier(bufnr)
  local command = prettier_command(bufnr)
  if not command then
    return false
  end

  local input = table.concat(vim.api.nvim_buf_get_lines(bufnr, 0, -1, false), "\n")
  local result = vim.system(command, {
    stdin = input,
    text = true,
  }):wait()

  if result.code ~= 0 then
    local stderr = (result.stderr or ""):gsub("%s+$", "")
    if stderr ~= "" then
      vim.notify("Format failed: " .. stderr, vim.log.levels.WARN)
    end
    return false
  end

  if result.stdout and result.stdout ~= input then
    replace_buffer_text(bufnr, result.stdout)
  end

  return true
end

local function has_eslint_client(bufnr)
  return #vim.lsp.get_clients({ bufnr = bufnr, name = "eslint" }) > 0
end

local function format_with_lsp(bufnr)
  local clients = vim.lsp.get_clients({
    bufnr = bufnr,
    method = lsp_methods.textDocument_formatting,
  })

  if #clients == 0 then
    return
  end

  vim.lsp.buf.format({
    async = false,
    bufnr = bufnr,
    filter = function(client)
      return client.name ~= "ts_ls" and client.name ~= "tsc"
    end,
  })
end

function M.format(bufnr)
  bufnr = bufnr == 0 and vim.api.nvim_get_current_buf() or bufnr

  if not bufnr or not vim.api.nvim_buf_is_valid(bufnr) then
    return
  end

  if vim.bo[bufnr].buftype ~= "" or not vim.bo[bufnr].modifiable then
    return
  end

  if has_eslint_client(bufnr) then
    pcall(vim.cmd, "silent EslintFixAll")
  end

  if prettier_filetypes[vim.bo[bufnr].filetype] and format_with_prettier(bufnr) then
    return
  end

  format_with_lsp(bufnr)
end

vim.api.nvim_create_user_command("Format", function()
  M.format(vim.api.nvim_get_current_buf())
end, { desc = "Format current buffer" })

local format_group = vim.api.nvim_create_augroup("UserLspFormatting", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
  group = format_group,
  callback = function(args)
    M.format(args.buf)
  end,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()

local function on_attach(client, bufnr)
  local function map(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
  end

  if client.name == "ts_ls" or client.name == "tsc" then
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end

  if client:supports_method(lsp_methods.textDocument_completion) then
    vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
  end

  vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

  map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
  map("n", "gd", vim.lsp.buf.definition, "Go to definition")
  map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
  map("n", "gr", vim.lsp.buf.references, "List references")
  map("n", "K", vim.lsp.buf.hover, "Hover")
  map("n", "<C-k>", vim.lsp.buf.signature_help, "Signature help")
  map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
  map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")
  map("n", "<leader>d", vim.diagnostic.open_float, "Line diagnostics")
  map("n", "[d", function()
    vim.diagnostic.jump({ count = -1, float = true })
  end, "Previous diagnostic")
  map("n", "]d", function()
    vim.diagnostic.jump({ count = 1, float = true })
  end, "Next diagnostic")
  map("n", "<leader>q", vim.diagnostic.setloclist, "Diagnostics list")
end

local servers = {
  cssls = {},
  elixirls = {},
  eslint = {},
  html = {},
  jsonls = {},
  lua_ls = {
    settings = {
      Lua = {
        telemetry = {
          enable = false,
        },
        workspace = {
          checkThirdParty = false,
        },
      },
    },
  },
  pyright = {},
  ts_ls = {
    init_options = {
      tsserver = {
        -- Keep project SDKs first; TypeScript 7 globals no longer ship tsserver.js.
        fallbackPath = vim.fn.stdpath("data") .. "/typescript-sdk/node_modules/typescript/lib/tsserver.js",
      },
    },
  },
}

local typescript = require("config.typescript")
local typescript_root = vim.lsp.config.ts_ls.root_dir
servers.ts_ls.root_dir = typescript.root_dir("ts_ls", typescript_root)
servers.tsc = {
  root_dir = typescript.root_dir("tsc", typescript_root),
  cmd = typescript.native_cmd,
  capabilities = {
    workspace = {
      -- Let the native server watch files; Neovim's macOS watcher hit EMFILE.
      didChangeWatchedFiles = { dynamicRegistration = false },
    },
  },
}

require("mason").setup()
require("mason-lspconfig").setup({
  automatic_enable = false,
})

for server, config in pairs(servers) do
  vim.lsp.config(server, vim.tbl_deep_extend("force", {
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    },
    on_attach = on_attach,
  }, config))

  vim.lsp.enable(server)
end

vim.diagnostic.config({
  severity_sort = true,
  underline = true,
  update_in_insert = false,
  virtual_text = false,
  float = {
    border = "rounded",
    source = "if_many",
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "E",
      [vim.diagnostic.severity.WARN] = "W",
      [vim.diagnostic.severity.INFO] = "I",
      [vim.diagnostic.severity.HINT] = "H",
    },
  },
})

return M
