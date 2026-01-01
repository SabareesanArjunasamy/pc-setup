return {
  {
    'folke/tokyonight.nvim',
  },
  {
    "EdenEast/nightfox.nvim",
  },
  {
    "catppuccin/nvim", name = "catppuccin",
    priority = 1000,
    init = function()
      vim.cmd.colorscheme 'catppuccin'
    end,
  },
}
