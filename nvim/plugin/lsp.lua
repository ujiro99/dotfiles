-- 1. LSP Sever management
require("mason").setup()
require("mason-lspconfig").setup_handlers({
  function(server)
    require("lspconfig")[server].setup({
      capabilities = require("cmp_nvim_lsp").default_capabilities(),
    })
  end,
})

-- 2. build-in LSP function
-- keyboard shortcut
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
vim.keymap.set("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
vim.keymap.set("n", "gn", "<cmd>lua vim.lsp.buf.rename()<CR>")
vim.keymap.set("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>")
vim.keymap.set("n", "<Leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>")
vim.keymap.set("n", "g]", "<cmd>lua vim.diagnostic.goto_next()<CR>")
vim.keymap.set("n", "g[", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
-- LSP handlers
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = false,
})

-- 3. completion (hrsh7th/nvim-cmp)
local cmp = require("cmp")
cmp.setup({
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    -- ['<C-l>'] = cmp.mapping.complete(),
    -- ['<C-e>'] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  experimental = {
    ghost_text = true,
  },
})

-- Show diagnostic on hover
local function on_cursor_hold()
  if vim.lsp.buf.server_ready() then
    vim.diagnostic.open_float()
  end
end
local diagnostic_hover_augroup_name = "lspconfig-diagnostic"
vim.api.nvim_set_option("updatetime", 500)
vim.api.nvim_create_augroup(diagnostic_hover_augroup_name, { clear = true })
vim.api.nvim_create_autocmd({ "CursorHold" }, { group = diagnostic_hover_augroup_name, callback = on_cursor_hold })

-- null-ls
local async_formatting = function(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()

  vim.lsp.buf_request(
    bufnr,
    "textDocument/formatting",
    vim.lsp.util.make_formatting_params({}),
    function(err, res, ctx)
      if err then
        local err_msg = type(err) == "string" and err or err.message
        -- you can modify the log message / level (or ignore it completely)
        vim.notify("formatting: " .. err_msg, vim.log.levels.WARN)
        return
      end

      -- don't apply results if buffer is unloaded or has been modified
      if not vim.api.nvim_buf_is_loaded(bufnr) or vim.api.nvim_buf_get_option(bufnr, "modified") then
        return
      end

      if res then
        local client = vim.lsp.get_client_by_id(ctx.client_id)
        vim.lsp.util.apply_text_edits(res, bufnr, client and client.offset_encoding or "utf-16")
        vim.api.nvim_buf_call(bufnr, function()
          vim.cmd("silent noautocmd update")
        end)
      end
    end
  )
end

local null_ls = require("null-ls")
local mason_package = require("mason-core.package")
local mason_registry = require("mason-registry")

local null_sources = {}
for _, package in ipairs(mason_registry.get_installed_packages()) do
  local package_categories = package.spec.categories[1]
  if package_categories == mason_package.Cat.Formatter then
    table.insert(null_sources, null_ls.builtins.formatting[package.name])
  end
  if package_categories == mason_package.Cat.Linter then
    table.insert(null_sources, null_ls.builtins.diagnostics[package.name])
  end
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
  sources = null_sources,
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      -- format on <Leader>f
      vim.keymap.set("n", "<Leader>f", function()
        vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
      end, { buffer = bufnr, desc = "[lsp] format" })

      -- format on save
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePost", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          async_formatting(bufnr)
        end,
      })
    end
  end,
})

-- prettier
local prettier = require("prettier")
prettier.setup({
  bin = "prettierd",
  ["null-ls"] = {
    condition = function()
      return prettier.config_exists({
        check_package_json = true,
      })
    end,
    runtime_condition = function(params)
      return true
    end,
    timeout = 5000,
  },
  filetypes = {
    "css",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "markdown",
    "typescript",
    "typescriptreact",
  },
})
