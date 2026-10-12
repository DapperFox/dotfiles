local M = {}

-- One choice per workspace keeps the two servers from attaching together.
-- Restart Neovim after installing or upgrading a workspace's TypeScript SDK.
local choices = {}
local sdk_folders = {
  "node_modules/typescript",
  ".vscode/pnpify/typescript",
  ".yarn/sdks/typescript",
  ".pnpm/sdks/typescript",
}

local function workspace_sdk(root)
  local directory = root
  while directory do
    for _, folder in ipairs(sdk_folders) do
      local sdk = vim.fs.joinpath(directory, folder)
      local ok, package = pcall(function()
        return vim.json.decode(table.concat(vim.fn.readfile(sdk .. "/package.json"), "\n"))
      end)
      if ok and type(package) == "table" and type(package.version) == "string" then
        local version = vim.version.parse(package.version)
        if version then
          return sdk, version
        end
      end
    end
    local parent = vim.fs.dirname(directory)
    directory = parent ~= directory and parent or nil
  end
end

local function supports_native(binary)
  if vim.fn.executable(binary) ~= 1 then
    return false
  end
  local ok, result = pcall(function()
    return vim.system({ binary, "--version" }, { text = true, timeout = 2000 }):wait()
  end)
  local version = ok and vim.version.parse(result.stdout or "") or nil
  return ok and result.code == 0 and version ~= nil and version.major >= 7
end

local function choose(root)
  if choices[root] then
    return choices[root]
  end

  local sdk, version = workspace_sdk(root)
  local choice = { server = "ts_ls" }

  -- A project's older SDK takes priority over a newer global compiler.
  if not version or version.major >= 7 then
    local binaries = {}
    if sdk then
      binaries[#binaries + 1] = vim.fs.joinpath(sdk, "bin/tsc")
    end
    binaries[#binaries + 1] = vim.fs.joinpath(root, "node_modules/.bin/tsc")
    binaries[#binaries + 1] = "tsc"
    for _, binary in ipairs(binaries) do
      if supports_native(binary) then
        choice = { server = "tsc", binary = binary }
        break
      end
    end
  end

  choices[root] = choice
  return choice
end

function M.root_dir(server, resolve_root)
  return function(bufnr, on_dir)
    -- Reuse lspconfig's workspace and Deno detection for both servers.
    resolve_root(bufnr, function(root)
      if choose(root).server == server then
        on_dir(root)
      end
    end)
  end
end

function M.native_cmd(dispatchers, config)
  local choice = choose(config.root_dir)
  return vim.lsp.rpc.start({ assert(choice.binary), "--lsp", "--stdio" }, dispatchers)
end

return M
