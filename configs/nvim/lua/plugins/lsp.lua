return {
  "neovim/nvim-lspconfig",
  event = "VeryLazy",
  dependencies = {
    { "williamboman/mason.nvim",           event = "VeryLazy" }, -- Optional
    { "williamboman/mason-lspconfig.nvim", event = "VeryLazy" }, -- Optional
    -- Autocompletion
    { "hrsh7th/nvim-cmp",                  event = "VeryLazy" }, -- Required
    { "hrsh7th/cmp-nvim-lsp",              event = "VeryLazy" }, -- Required
    { "hrsh7th/cmp-buffer",                event = "VeryLazy" }, -- Optional
    { "hrsh7th/cmp-path",                  event = "VeryLazy" }, -- Optional
    { "saadparwaiz1/cmp_luasnip",          event = "VeryLazy" }, -- Optional
    { "hrsh7th/cmp-nvim-lua",              event = "VeryLazy" }, -- Optional

    -- Snippets
    { "L3MON4D3/LuaSnip",                  build = "make install_jsregexp" }, -- Required
    { "rafamadriz/friendly-snippets" },                   -- Optional
    -- treesitter
    { "github/copilot.vim" },
    {
      "olimorris/codecompanion.nvim",
      opts = {},
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
      },
    },
  }
}
