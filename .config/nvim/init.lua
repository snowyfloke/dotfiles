-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

local function toggle_background()
  if vim.o.background == "dark" then
    vim.o.background = "light"
  else
    vim.o.background = "dark"
  end
  -- Exibe uma mensagem rápida na barra de comando para confirmar a mudança
  print("Background alterado para: " .. vim.o.background)
end

vim.fn.serverstart("/tmp/nvim.pipe")
