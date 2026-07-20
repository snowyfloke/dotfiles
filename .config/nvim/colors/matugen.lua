local M = {}

function M.setup()
  require("base16-colorscheme").setup({
    base00 = "#faf9fd",
    base01 = "#eeedf1",
    base02 = "#e9e7eb",
    base03 = "#74777f",
    base04 = "#43474e",
    base05 = "#1a1c1e",
    base06 = "#1a1c1e",
    base07 = "#1a1c1e",
    base08 = "#ba1a1a",
    base09 = "#6e5676",
    base0A = "#555f71",
    base0B = "#205fa6",
    base0C = "#dabde2",
    base0D = "#a6c8ff",
    base0E = "#bdc7dc",
    base0F = "#ffdad6",
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi("TelescopeNormal", { fg = "#1a1c1e", bg = "#faf9fd" })
  hi("TelescopeBorder", { fg = "#74777f", bg = "#faf9fd" })
  hi("TelescopePromptNormal", {
    fg = "#1a1c1e",
    bg = "#faf9fd",
  })
  hi("TelescopePromptBorder", {
    fg = "#74777f",
    bg = "#faf9fd",
  })
  hi("TelescopePromptPrefix", {
    fg = "#205fa6",
    bg = "#faf9fd",
  })
  hi(
    "TelescopePromptCounter",
    { fg = "#43474e", bg = "#faf9fd" }
  )
  hi("TelescopePromptTitle", { fg = "#faf9fd", bg = "#205fa6" })
  hi("TelescopePreviewTitle", {
    fg = "#faf9fd",
    bg = "#555f71",
  })
  hi("TelescopeResultsTitle", {
    fg = "#faf9fd",
    bg = "#6e5676",
  })
  hi(
    "TelescopeSelection",
    { fg = "#1a1c1e", bg = "#e9e7eb" }
  )
  hi(
    "TelescopeSelectionCaret",
    { fg = "#205fa6", bg = "#e9e7eb" }
  )
  hi("TelescopeMatching", { fg = "#205fa6", bold = true })
end

-- Register a signal handler for SIGUSR1 (matugen updates)
local signal = vim.uv.new_signal()
signal:start(
  "sigusr1",
  vim.schedule_wrap(function()
    package.loaded["matugen"] = nil
    require("matugen").setup()
  end)
)

return M
