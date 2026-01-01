local servers = {
	"lua_ls",
	-- "cssls",
	-- "html",
	-- "tsserver",
	"pyright",
	-- "bashls",
	"jsonls",
	-- "yamlls",
}

local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = { exclude = { "solargraph" } },
})

local lspconfig = require "lspconfig"

require("mason-lspconfig").setup_handlers({
  function(server_name)
    local opts = {
      on_attach = require("config.lsp.handlers").on_attach,
      capabilities = require("config.lsp.handlers").capabilities,
    }
    local require_ok, conf_opts = pcall(require, "config.lsp.settings." .. server_name)
    if require_ok then
      opts = vim.tbl_deep_extend("force", conf_opts, opts)
    end

    lspconfig[server_name].setup(opts)
  end,
})

--lspconfig.rubocop.setup({
  -- cmd = { "bundle", "exec", "rubocop", "--lsp" },
--})

-- lspconfig["solargraph"].setup( -- setup solargraph (Don't install it with mason, it sucks)
--   {
--     on_attach = function(client, bufnr)
--       require("config.lsp.handlers").on_attach(client, bufnr)
--
--       client.server_capabilities.documentFormattingProvider = false -- we want to use rubocop
--     end,
--     settings = {
--       solargraph = {
--         formatting = false,
--         useBundler = true,
--         diagnostics = true, -- lsp diagnostics are slow
--       },
--     },
--   }
-- )
