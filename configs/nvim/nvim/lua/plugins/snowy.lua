return {
  {
    "folke/tokyonight.nvim", -- placeholder, LazyVim needs at least one colorscheme plugin
    enabled = false, -- disable the default
  },
  {
    dir = vim.fn.stdpath("config") .. "/lua/snowy-theme",
    name = "snowy-theme",
    priority = 1000, -- load before all other plugins
    config = function()
      require("snowy-theme").setup()
    end,
  },
}