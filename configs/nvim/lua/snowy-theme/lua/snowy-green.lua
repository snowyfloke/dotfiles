-- snowy-green.lua
-- A full LazyVim-compatible colorscheme using Snowy's color palette.
-- Place this file in: ~/.config/nvim/lua/plugins/snowy-theme.lua
-- Then set: vim.cmd.colorscheme("snowy-green") or use LazyVim's colorscheme option.
--
-- Alternatively, if you want to load highlights directly without a full colorscheme
-- plugin, you can call M.setup() from your init.lua or a plugin spec's config().

local M = {}

local colors = {
  accent = "#00ff00",
  bg = "#041a06",
  bgalt = "#005200",
  text = "#00ff00",
  textalt = "#ccffcc",
  red = "#ff0000",
  redbright = "#ff0055",
  redpastel = "#ff4040",
  reddark = "#570000",
  blue = "#0000ff",
  bluebright = "#0095ff",
  bluepastel = "#5cbbff",
  bluedark = "#001f85",
  green = "#00ff00",
  greenbright = "#05ff50",
  greenpastel = "#40ff79",
  greendark = "#006300",
  magenta = "#ff00ff",
  magentabright = "#ff00dd",
  magentapastel = "#ff75ff",
  magentadark = "#940094",
  cyan = "#00ffff",
  cyanbright = "#00ffd5",
  cyanpastel = "#69ffff",
  cyandark = "#007373",
  yellow = "#ffff00",
  yellowbright = "#fff200",
  yellowpastel = "#ffff66",
  yellowdark = "#9e9e00",
  brown = "#8f6200",
  brownbright = "#d19002",
  brownpastel = "#ad842a",
  browndark = "#362501",
  black = "#000000",
  blackalt = "#141414",
  white = "#ffffff",
  whitealt = "#d9d9d9",
  gray = "#757575",
  graydark = "#4f4f4f",
  graybright = "#adaaaa",
  orange = "#ff8400",
  orangebright = "#ff5e00",
  orangepastel = "#ff9f45",
  orangedark = "#994a00",
  lime = "#62ff00",
  purple = "#9000ff",
  purplebright = "#7700ff",
  purplepastel = "#ae45ff",
  purpledark = "#480080",
  pink = "#ff00f7",
  pinkbright = "#ff00d0",
  pinkpastel = "#ff6efa",
  pinkdark = "#b300ac",
}

-- Derived shades not in the palette, computed for readability
local derived = {
  bg_dark = "#000000", -- darker than bg, used for sidebars/inactive areas
  bg_darker = "#000000", -- even darker, used for floating window backgrounds
  bg_visual = "#042807", -- slightly lighter than bg, used for visual selection
  bg_search = "#001e02", -- used for search highlight backgrounds
  bg_cursorline = "#07300b", -- subtle cursorline
  fg_comment = "#48924f", -- muted foreground for comments
}

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

function M.setup()
  -- Reset all highlights before applying
  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end
  vim.g.colors_name = "snowy-green"
  vim.o.termguicolors = true

  -- ─────────────────────────────────────────────────────────────
  -- LAYER 1: Core Editor UI
  -- ─────────────────────────────────────────────────────────────

  hi("Normal", { fg = colors.textalt, bg = colors.bg })
  hi("NormalNC", { fg = colors.graybright, bg = derived.bg_dark })
  hi("NormalFloat", { fg = colors.textalt, bg = derived.bg_darker })
  hi("FloatBorder", { fg = colors.cyandark, bg = derived.bg_darker })
  hi("FloatTitle", { fg = colors.accent, bg = derived.bg_darker, bold = true })
  hi("FloatFooter", { fg = colors.gray, bg = derived.bg_darker })

  hi("Cursor", { fg = colors.bg, bg = colors.accent })
  hi("CursorIM", { fg = colors.bg, bg = colors.cyanbright })
  hi("CursorLine", { bg = derived.bg_cursorline })
  hi("CursorLineNr", { fg = colors.accent, bg = derived.bg_cursorline, bold = true })
  hi("LineNr", { fg = colors.graydark })
  hi("SignColumn", { fg = colors.gray, bg = colors.bg })
  hi("ColorColumn", { bg = derived.bg_dark })
  hi("FoldColumn", { fg = colors.cyandark, bg = colors.bg })
  hi("Folded", { fg = colors.graybright, bg = derived.bg_dark, italic = true })

  hi("VertSplit", { fg = colors.cyandark, bg = colors.bg })
  hi("WinSeparator", { fg = colors.cyandark, bg = colors.bg })
  hi("WinBar", { fg = colors.accent, bg = derived.bg_dark, bold = true })
  hi("WinBarNC", { fg = colors.gray, bg = derived.bg_dark })

  hi("StatusLine", { fg = colors.textalt, bg = derived.bg_dark })
  hi("StatusLineNC", { fg = colors.gray, bg = derived.bg_darker })

  hi("TabLine", { fg = colors.gray, bg = derived.bg_dark })
  hi("TabLineSel", { fg = colors.accent, bg = colors.bg, bold = true })
  hi("TabLineFill", { bg = derived.bg_darker })

  hi("Pmenu", { fg = colors.textalt, bg = derived.bg_darker })
  hi("PmenuSel", { fg = colors.bg, bg = colors.accent, bold = true })
  hi("PmenuSbar", { bg = derived.bg_dark })
  hi("PmenuThumb", { bg = colors.cyandark })
  hi("PmenuMatch", { fg = colors.yellowbright, bold = true })
  hi("PmenuMatchSel", { fg = colors.yellowbright, bg = colors.accent, bold = true })

  hi("Visual", { bg = derived.bg_visual })
  hi("VisualNOS", { bg = derived.bg_visual })
  hi("Search", { fg = colors.bg, bg = colors.yellowbright })
  hi("IncSearch", { fg = colors.bg, bg = colors.orangebright, bold = true })
  hi("CurSearch", { fg = colors.bg, bg = colors.orangebright, bold = true })
  hi("Substitute", { fg = colors.bg, bg = colors.redbright })
  hi("MatchParen", { fg = colors.yellowbright, bold = true, underline = true })

  hi("NonText", { fg = colors.graydark })
  hi("SpecialKey", { fg = colors.cyandark })
  hi("Whitespace", { fg = colors.graydark })
  hi("EndOfBuffer", { fg = colors.graydark })
  hi("Conceal", { fg = colors.gray })
  hi("Directory", { fg = colors.bluepastel, bold = true })

  hi("Title", { fg = colors.accent, bold = true })
  hi("Question", { fg = colors.greenpastel })
  hi("MoreMsg", { fg = colors.greenpastel, bold = true })
  hi("ModeMsg", { fg = colors.textalt, bold = true })
  hi("MsgArea", { fg = colors.textalt, bg = colors.bg })
  hi("MsgSeparator", { fg = colors.cyandark, bg = derived.bg_dark })
  hi("ErrorMsg", { fg = colors.redbright, bg = colors.bg, bold = true })
  hi("WarningMsg", { fg = colors.yellowbright })
  hi("WildMenu", { fg = colors.bg, bg = colors.accent, bold = true })
  hi("QuickFixLine", { fg = colors.accent, bg = derived.bg_visual, bold = true })

  hi("SpellBad", { undercurl = true, sp = colors.redpastel })
  hi("SpellCap", { undercurl = true, sp = colors.bluepastel })
  hi("SpellRare", { undercurl = true, sp = colors.magentapastel })
  hi("SpellLocal", { undercurl = true, sp = colors.cyanpastel })

  hi("DiffAdd", { fg = colors.greenpastel, bg = colors.greendark })
  hi("DiffChange", { fg = colors.yellowpastel, bg = colors.browndark })
  hi("DiffDelete", { fg = colors.redpastel, bg = colors.reddark })
  hi("DiffText", { fg = colors.bg, bg = colors.yellowbright, bold = true })

  -- ─────────────────────────────────────────────────────────────
  -- LAYER 2: Legacy Syntax Groups
  -- ─────────────────────────────────────────────────────────────

  hi("Comment", { fg = derived.fg_comment, italic = true })
  hi("String", { fg = colors.greenpastel })
  hi("Number", { fg = colors.orangepastel })
  hi("Float", { fg = colors.orangepastel })
  hi("Boolean", { fg = colors.purplepastel, bold = true })
  hi("Constant", { fg = colors.purplepastel })
  hi("Identifier", { fg = colors.textalt })
  hi("Function", { fg = colors.bluepastel, bold = true })
  hi("Keyword", { fg = colors.accent, bold = true })
  hi("Conditional", { fg = colors.accent, bold = true })
  hi("Repeat", { fg = colors.accent, bold = true })
  hi("Operator", { fg = colors.cyanbright })
  hi("Type", { fg = colors.cyanpastel })
  hi("StorageClass", { fg = colors.magentapastel, bold = true })
  hi("Structure", { fg = colors.cyanpastel, bold = true })
  hi("Typedef", { fg = colors.cyanpastel })
  hi("Statement", { fg = colors.accent })
  hi("PreProc", { fg = colors.magentabright })
  hi("Include", { fg = colors.magentabright })
  hi("Define", { fg = colors.magentabright })
  hi("Macro", { fg = colors.magentapastel })
  hi("Special", { fg = colors.yellowpastel })
  hi("SpecialChar", { fg = colors.yellowpastel })
  hi("Delimiter", { fg = colors.graybright })
  hi("Debug", { fg = colors.orangebright })
  hi("Error", { fg = colors.redbright, bold = true })
  hi("Todo", { fg = colors.yellowbright, bg = colors.browndark, bold = true })
  hi("Tag", { fg = colors.bluepastel })
  hi("Label", { fg = colors.cyanpastel })
  hi("Exception", { fg = colors.redpastel, bold = true })
  hi("Underlined", { underline = true })

  -- ─────────────────────────────────────────────────────────────
  -- LAYER 3: Treesitter Groups
  -- ─────────────────────────────────────────────────────────────

  -- Comments
  hi("@comment", { fg = derived.fg_comment, italic = true })
  hi("@comment.documentation", { fg = colors.cyandark, italic = true })
  hi("@comment.todo", { fg = colors.yellowbright, bg = colors.browndark, bold = true })
  hi("@comment.error", { fg = colors.redbright, bold = true })
  hi("@comment.warning", { fg = colors.yellowbright, bold = true })
  hi("@comment.note", { fg = colors.bluepastel, bold = true })

  -- Strings
  hi("@string", { fg = colors.greenpastel })
  hi("@string.escape", { fg = colors.yellowpastel, bold = true })
  hi("@string.special", { fg = colors.yellowbright })
  hi("@string.regexp", { fg = colors.orangepastel })

  -- Literals
  hi("@number", { fg = colors.orangepastel })
  hi("@number.float", { fg = colors.orangepastel })
  hi("@boolean", { fg = colors.purplepastel, bold = true })

  -- Constants
  hi("@constant", { fg = colors.purplepastel })
  hi("@constant.builtin", { fg = colors.purplepastel, bold = true })
  hi("@constant.macro", { fg = colors.magentapastel })

  -- Variables
  hi("@variable", { fg = colors.textalt })
  hi("@variable.builtin", { fg = colors.cyanpastel, italic = true })
  hi("@variable.member", { fg = colors.cyanpastel })
  hi("@variable.parameter", { fg = colors.yellowpastel })
  hi("@variable.parameter.builtin", { fg = colors.yellowpastel, italic = true })

  -- Functions
  hi("@function", { fg = colors.bluepastel, bold = true })
  hi("@function.builtin", { fg = colors.cyanbright, bold = true })
  hi("@function.call", { fg = colors.bluepastel })
  hi("@function.macro", { fg = colors.magentabright })
  hi("@function.method", { fg = colors.bluepastel, bold = true })
  hi("@function.method.call", { fg = colors.bluepastel })
  hi("@constructor", { fg = colors.cyanpastel, bold = true })

  -- Keywords
  hi("@keyword", { fg = colors.accent, bold = true })
  hi("@keyword.function", { fg = colors.accent, bold = true })
  hi("@keyword.return", { fg = colors.cyanbright, bold = true })
  hi("@keyword.operator", { fg = colors.cyanbright })
  hi("@keyword.import", { fg = colors.magentabright })
  hi("@keyword.type", { fg = colors.cyanpastel, bold = true })
  hi("@keyword.modifier", { fg = colors.magentapastel })
  hi("@keyword.conditional", { fg = colors.accent, bold = true })
  hi("@keyword.conditional.ternary", { fg = colors.cyanbright })
  hi("@keyword.repeat", { fg = colors.accent, bold = true })
  hi("@keyword.exception", { fg = colors.redpastel, bold = true })
  hi("@keyword.debug", { fg = colors.orangebright })
  hi("@keyword.directive", { fg = colors.magentabright })

  -- Operators & Punctuation
  hi("@operator", { fg = colors.cyanbright })
  hi("@punctuation.bracket", { fg = colors.graybright })
  hi("@punctuation.delimiter", { fg = colors.graybright })
  hi("@punctuation.special", { fg = colors.yellowpastel })

  -- Types
  hi("@type", { fg = colors.cyanpastel })
  hi("@type.builtin", { fg = colors.cyanpastel, bold = true })
  hi("@type.definition", { fg = colors.cyanpastel, bold = true })
  hi("@type.qualifier", { fg = colors.magentapastel })

  -- Attributes & Namespaces
  hi("@attribute", { fg = colors.yellowpastel, italic = true })
  hi("@namespace", { fg = colors.bluepastel })
  hi("@module", { fg = colors.bluepastel })
  hi("@label", { fg = colors.cyanpastel })
  hi("@property", { fg = colors.cyanpastel })

  -- HTML/XML/JSX Tags
  hi("@tag", { fg = colors.bluepastel, bold = true })
  hi("@tag.attribute", { fg = colors.yellowpastel })
  hi("@tag.delimiter", { fg = colors.graybright })
  hi("@tag.builtin", { fg = colors.cyanbright, bold = true })

  -- Markup (Markdown, RST, etc.)
  hi("@markup.heading", { fg = colors.accent, bold = true })
  hi("@markup.heading.1", { fg = colors.accent, bold = true })
  hi("@markup.heading.2", { fg = colors.cyanbright, bold = true })
  hi("@markup.heading.3", { fg = colors.bluepastel, bold = true })
  hi("@markup.heading.4", { fg = colors.cyanpastel })
  hi("@markup.heading.5", { fg = colors.cyanpastel })
  hi("@markup.heading.6", { fg = colors.gray })
  hi("@markup.italic", { italic = true })
  hi("@markup.bold", { bold = true })
  hi("@markup.strikethrough", { strikethrough = true })
  hi("@markup.underline", { underline = true })
  hi("@markup.link", { fg = colors.bluepastel, underline = true })
  hi("@markup.link.label", { fg = colors.cyanbright })
  hi("@markup.link.url", { fg = colors.greenpastel, italic = true })
  hi("@markup.raw", { fg = colors.yellowpastel, bg = derived.bg_dark })
  hi("@markup.raw.block", { fg = colors.yellowpastel, bg = derived.bg_dark })
  hi("@markup.list", { fg = colors.cyanpastel })
  hi("@markup.list.checked", { fg = colors.greenpastel })
  hi("@markup.list.unchecked", { fg = colors.graybright })
  hi("@markup.quote", { fg = colors.graybright, italic = true })
  hi("@markup.math", { fg = colors.orangepastel })

  -- Diff (Treesitter)
  hi("@diff.plus", { fg = colors.greenpastel })
  hi("@diff.minus", { fg = colors.redpastel })
  hi("@diff.delta", { fg = colors.yellowpastel })

  -- ─────────────────────────────────────────────────────────────
  -- LAYER 4: LSP & Diagnostics
  -- ─────────────────────────────────────────────────────────────

  hi("DiagnosticError", { fg = colors.redpastel })
  hi("DiagnosticWarn", { fg = colors.yellowpastel })
  hi("DiagnosticInfo", { fg = colors.bluepastel })
  hi("DiagnosticHint", { fg = colors.cyanpastel })
  hi("DiagnosticOk", { fg = colors.greenpastel })

  hi("DiagnosticVirtualTextError", { fg = colors.redpastel, bg = colors.reddark, italic = true })
  hi("DiagnosticVirtualTextWarn", { fg = colors.yellowpastel, bg = colors.browndark, italic = true })
  hi("DiagnosticVirtualTextInfo", { fg = colors.bluepastel, bg = colors.bluedark, italic = true })
  hi("DiagnosticVirtualTextHint", { fg = colors.cyanpastel, bg = derived.bg_dark, italic = true })

  hi("DiagnosticUnderlineError", { undercurl = true, sp = colors.redpastel })
  hi("DiagnosticUnderlineWarn", { undercurl = true, sp = colors.yellowpastel })
  hi("DiagnosticUnderlineInfo", { undercurl = true, sp = colors.bluepastel })
  hi("DiagnosticUnderlineHint", { undercurl = true, sp = colors.cyanpastel })

  hi("DiagnosticSignError", { fg = colors.redpastel })
  hi("DiagnosticSignWarn", { fg = colors.yellowpastel })
  hi("DiagnosticSignInfo", { fg = colors.bluepastel })
  hi("DiagnosticSignHint", { fg = colors.cyanpastel })

  hi("DiagnosticFloatingError", { fg = colors.redpastel })
  hi("DiagnosticFloatingWarn", { fg = colors.yellowpastel })
  hi("DiagnosticFloatingInfo", { fg = colors.bluepastel })
  hi("DiagnosticFloatingHint", { fg = colors.cyanpastel })

  hi("LspReferenceText", { bg = derived.bg_visual })
  hi("LspReferenceRead", { bg = derived.bg_visual })
  hi("LspReferenceWrite", { bg = derived.bg_visual, underline = true })
  hi("LspInlayHint", { fg = colors.cyandark, italic = true })
  hi("LspCodeLens", { fg = colors.gray, italic = true })
  hi("LspSignatureActiveParameter", { fg = colors.yellowbright, bold = true, underline = true })

  -- LSP Semantic Tokens
  hi("@lsp.type.class", { fg = colors.cyanpastel, bold = true })
  hi("@lsp.type.decorator", { fg = colors.yellowpastel, italic = true })
  hi("@lsp.type.enum", { fg = colors.cyanpastel })
  hi("@lsp.type.enumMember", { fg = colors.purplepastel })
  hi("@lsp.type.function", { fg = colors.bluepastel })
  hi("@lsp.type.interface", { fg = colors.cyanpastel, italic = true })
  hi("@lsp.type.keyword", { fg = colors.accent })
  hi("@lsp.type.macro", { fg = colors.magentabright })
  hi("@lsp.type.method", { fg = colors.bluepastel })
  hi("@lsp.type.namespace", { fg = colors.bluepastel })
  hi("@lsp.type.parameter", { fg = colors.yellowpastel })
  hi("@lsp.type.property", { fg = colors.cyanpastel })
  hi("@lsp.type.struct", { fg = colors.cyanpastel, bold = true })
  hi("@lsp.type.type", { fg = colors.cyanpastel })
  hi("@lsp.type.typeParameter", { fg = colors.cyanpastel, italic = true })
  hi("@lsp.type.variable", { fg = colors.textalt })
  hi("@lsp.mod.deprecated", { strikethrough = true })
  hi("@lsp.mod.readonly", { italic = true })
  hi("@lsp.mod.defaultLibrary", { bold = true })

  -- ─────────────────────────────────────────────────────────────
  -- PLUGINS: LazyVim defaults
  -- ─────────────────────────────────────────────────────────────

  -- GitSigns
  hi("GitSignsAdd", { fg = colors.greenpastel })
  hi("GitSignsChange", { fg = colors.yellowpastel })
  hi("GitSignsDelete", { fg = colors.redpastel })
  hi("GitSignsAddNr", { fg = colors.greenpastel })
  hi("GitSignsChangeNr", { fg = colors.yellowpastel })
  hi("GitSignsDeleteNr", { fg = colors.redpastel })
  hi("GitSignsAddLn", { bg = colors.greendark })
  hi("GitSignsChangeLn", { bg = colors.browndark })
  hi("GitSignsDeleteLn", { bg = colors.reddark })
  hi("GitSignsCurrentLineBlame", { fg = colors.cyandark, italic = true })

  -- Telescope
  hi("TelescopeNormal", { fg = colors.textalt, bg = derived.bg_darker })
  hi("TelescopeBorder", { fg = colors.cyandark, bg = derived.bg_darker })
  hi("TelescopeTitle", { fg = colors.accent, bg = derived.bg_darker, bold = true })
  hi("TelescopePromptNormal", { fg = colors.textalt, bg = derived.bg_dark })
  hi("TelescopePromptBorder", { fg = colors.cyandark, bg = derived.bg_dark })
  hi("TelescopePromptTitle", { fg = colors.yellowbright, bg = derived.bg_dark, bold = true })
  hi("TelescopePromptPrefix", { fg = colors.accent })
  hi("TelescopeResultsNormal", { fg = colors.textalt, bg = derived.bg_darker })
  hi("TelescopeResultsBorder", { fg = colors.cyandark, bg = derived.bg_darker })
  hi("TelescopeResultsTitle", { fg = colors.cyanpastel, bg = derived.bg_darker })
  hi("TelescopePreviewNormal", { fg = colors.textalt, bg = derived.bg_dark })
  hi("TelescopePreviewBorder", { fg = colors.cyandark, bg = derived.bg_dark })
  hi("TelescopePreviewTitle", { fg = colors.greenpastel, bg = derived.bg_dark })
  hi("TelescopeSelection", { bg = derived.bg_visual })
  hi("TelescopeSelectionCaret", { fg = colors.accent, bg = derived.bg_visual })
  hi("TelescopeMatching", { fg = colors.yellowbright, bold = true })

  -- Neo-tree
  hi("NeoTreeNormal", { fg = colors.textalt, bg = derived.bg_dark })
  hi("NeoTreeNormalNC", { fg = colors.gray, bg = derived.bg_dark })
  hi("NeoTreeFloatBorder", { fg = colors.cyandark, bg = derived.bg_darker })
  hi("NeoTreeTitleBar", { fg = colors.bg, bg = colors.cyandark, bold = true })
  hi("NeoTreeRootName", { fg = colors.accent, bold = true })
  hi("NeoTreeDirectoryName", { fg = colors.bluepastel })
  hi("NeoTreeDirectoryIcon", { fg = colors.cyanbright })
  hi("NeoTreeFileName", { fg = colors.textalt })
  hi("NeoTreeFileNameOpened", { fg = colors.accent })
  hi("NeoTreeGitAdded", { fg = colors.greenpastel })
  hi("NeoTreeGitModified", { fg = colors.yellowpastel })
  hi("NeoTreeGitDeleted", { fg = colors.redpastel })
  hi("NeoTreeGitUntracked", { fg = colors.orangepastel })
  hi("NeoTreeGitIgnored", { fg = colors.gray })
  hi("NeoTreeGitConflict", { fg = colors.redbright, bold = true })
  hi("NeoTreeIndentMarker", { fg = colors.graydark })
  hi("NeoTreeExpander", { fg = colors.cyandark })
  hi("NeoTreeSymbolicLinkTarget", { fg = colors.magentapastel })
  hi("NeoTreeDotfile", { fg = colors.gray })
  hi("NeoTreeHiddenByName", { fg = colors.graydark })
  hi("NeoTreeCursorLine", { bg = derived.bg_cursorline })
  hi("NeoTreeModified", { fg = colors.yellowpastel })
  hi("NeoTreeMessage", { fg = colors.gray, italic = true })

  -- Noice
  hi("NoiceCmdlinePopup", { fg = colors.textalt, bg = derived.bg_darker })
  hi("NoiceCmdlinePopupBorder", { fg = colors.cyandark })
  hi("NoiceCmdlinePopupTitle", { fg = colors.accent, bold = true })
  hi("NoiceCmdlineIcon", { fg = colors.accent })
  hi("NoiceConfirm", { fg = colors.textalt, bg = derived.bg_darker })
  hi("NoiceConfirmBorder", { fg = colors.cyandark })
  hi("NoiceMini", { fg = colors.textalt, bg = derived.bg_dark })
  hi("NoiceFormatProgressDone", { fg = colors.bg, bg = colors.accent })
  hi("NoiceFormatProgressTodo", { fg = colors.textalt, bg = derived.bg_dark })
  hi("NoiceLspProgressTitle", { fg = colors.cyanpastel })
  hi("NoiceLspProgressClient", { fg = colors.bluepastel })
  hi("NoiceLspProgressSpinner", { fg = colors.accent })

  -- Which-key
  hi("WhichKey", { fg = colors.accent })
  hi("WhichKeyGroup", { fg = colors.cyanpastel, bold = true })
  hi("WhichKeyDesc", { fg = colors.textalt })
  hi("WhichKeySeperator", { fg = colors.cyandark })
  hi("WhichKeyFloat", { bg = derived.bg_darker })
  hi("WhichKeyBorder", { fg = colors.cyandark, bg = derived.bg_darker })
  hi("WhichKeyTitle", { fg = colors.accent, bold = true })
  hi("WhichKeyValue", { fg = colors.gray })

  -- indent-blankline (ibl)
  hi("IblIndent", { fg = colors.graydark })
  hi("IblScope", { fg = colors.cyandark })
  hi("IblWhitespace", { fg = colors.graydark })

  -- blink.cmp
  hi("BlinkCmpMenu", { fg = colors.textalt, bg = derived.bg_darker })
  hi("BlinkCmpMenuBorder", { fg = colors.cyandark, bg = derived.bg_darker })
  hi("BlinkCmpMenuSelection", { fg = colors.bg, bg = colors.accent, bold = true })
  hi("BlinkCmpScrollBarThumb", { bg = colors.cyandark })
  hi("BlinkCmpScrollBarGutter", { bg = derived.bg_dark })
  hi("BlinkCmpLabel", { fg = colors.textalt })
  hi("BlinkCmpLabelDeprecated", { fg = colors.gray, strikethrough = true })
  hi("BlinkCmpLabelMatch", { fg = colors.yellowbright, bold = true })
  hi("BlinkCmpKind", { fg = colors.cyanpastel })
  hi("BlinkCmpKindText", { fg = colors.textalt })
  hi("BlinkCmpKindMethod", { fg = colors.bluepastel })
  hi("BlinkCmpKindFunction", { fg = colors.bluepastel })
  hi("BlinkCmpKindConstructor", { fg = colors.cyanpastel })
  hi("BlinkCmpKindField", { fg = colors.cyanpastel })
  hi("BlinkCmpKindVariable", { fg = colors.textalt })
  hi("BlinkCmpKindClass", { fg = colors.cyanpastel })
  hi("BlinkCmpKindInterface", { fg = colors.cyanpastel })
  hi("BlinkCmpKindModule", { fg = colors.bluepastel })
  hi("BlinkCmpKindProperty", { fg = colors.cyanpastel })
  hi("BlinkCmpKindUnit", { fg = colors.orangepastel })
  hi("BlinkCmpKindValue", { fg = colors.greenpastel })
  hi("BlinkCmpKindEnum", { fg = colors.cyanpastel })
  hi("BlinkCmpKindKeyword", { fg = colors.accent })
  hi("BlinkCmpKindSnippet", { fg = colors.yellowpastel })
  hi("BlinkCmpKindColor", { fg = colors.magentapastel })
  hi("BlinkCmpKindFile", { fg = colors.bluepastel })
  hi("BlinkCmpKindReference", { fg = colors.cyanpastel })
  hi("BlinkCmpKindFolder", { fg = colors.bluepastel })
  hi("BlinkCmpKindEnumMember", { fg = colors.purplepastel })
  hi("BlinkCmpKindConstant", { fg = colors.purplepastel })
  hi("BlinkCmpKindStruct", { fg = colors.cyanpastel })
  hi("BlinkCmpKindEvent", { fg = colors.orangepastel })
  hi("BlinkCmpKindOperator", { fg = colors.cyanbright })
  hi("BlinkCmpKindTypeParameter", { fg = colors.cyanpastel })
  hi("BlinkCmpDoc", { fg = colors.textalt, bg = derived.bg_darker })
  hi("BlinkCmpDocBorder", { fg = colors.cyandark, bg = derived.bg_darker })
  hi("BlinkCmpDocSeparator", { fg = colors.cyandark })
  hi("BlinkCmpSignatureHelp", { fg = colors.textalt, bg = derived.bg_darker })
  hi("BlinkCmpSignatureHelpBorder", { fg = colors.cyandark, bg = derived.bg_darker })
  hi("BlinkCmpSignatureHelpActiveParameter", { fg = colors.yellowbright, bold = true, underline = true })

  -- Flash
  hi("FlashMatch", { fg = colors.bg, bg = colors.cyanpastel })
  hi("FlashCurrent", { fg = colors.bg, bg = colors.yellowbright, bold = true })
  hi("FlashLabel", { fg = colors.bg, bg = colors.accent, bold = true })
  hi("FlashBackdrop", { fg = colors.gray })
  hi("FlashPrompt", { fg = colors.accent })
  hi("FlashCursor", { fg = colors.bg, bg = colors.accent })

  -- Snacks (dashboard, notifier, etc.)
  hi("SnacksDashboardNormal", { fg = colors.textalt, bg = colors.bg })
  hi("SnacksDashboardDesc", { fg = colors.cyanpastel })
  hi("SnacksDashboardFile", { fg = colors.bluepastel })
  hi("SnacksDashboardDir", { fg = colors.gray })
  hi("SnacksDashboardDate", { fg = colors.gray })
  hi("SnacksDashboardFooter", { fg = colors.cyandark, italic = true })
  hi("SnacksDashboardHeader", { fg = colors.accent, bold = true })
  hi("SnacksDashboardIcon", { fg = colors.accent })
  hi("SnacksDashboardKey", { fg = colors.yellowbright, bold = true })
  hi("SnacksDashboardTitle", { fg = colors.accent, bold = true })
  hi("SnacksDashboardTerminal", { fg = colors.textalt })
  hi("SnacksDashboardSpecial", { fg = colors.magentapastel })
  hi("SnacksNotifyERROR", { fg = colors.redpastel })
  hi("SnacksNotifyWARN", { fg = colors.yellowpastel })
  hi("SnacksNotifyINFO", { fg = colors.cyanpastel })
  hi("SnacksNotifyDEBUG", { fg = colors.gray })
  hi("SnacksNotifyTRACE", { fg = colors.purplepastel })
  hi("SnacksNotifyBorderERROR", { fg = colors.reddark })
  hi("SnacksNotifyBorderWARN", { fg = colors.browndark })
  hi("SnacksNotifyBorderINFO", { fg = colors.cyandark })
  hi("SnacksNotifyBorderDEBUG", { fg = colors.graydark })
  hi("SnacksNotifyBorderTRACE", { fg = colors.purpledark })
  hi("SnacksNotifyTitleERROR", { fg = colors.redpastel, bold = true })
  hi("SnacksNotifyTitleWARN", { fg = colors.yellowpastel, bold = true })
  hi("SnacksNotifyTitleINFO", { fg = colors.cyanpastel, bold = true })
  hi("SnacksNotifyTitleDEBUG", { fg = colors.gray, bold = true })
  hi("SnacksNotifyTitleTRACE", { fg = colors.purplepastel, bold = true })
  hi("SnacksPicker", { fg = colors.textalt, bg = derived.bg_darker })
  hi("SnacksPickerBorder", { fg = colors.cyandark, bg = derived.bg_darker })
  hi("SnacksPickerTitle", { fg = colors.accent, bold = true })
  hi("SnacksPickerMatch", { fg = colors.yellowbright, bold = true })
  hi("SnacksPickerSelected", { bg = derived.bg_visual })
  hi("SnacksPickerCursorLine", { bg = derived.bg_cursorline })
  hi("SnacksInputNormal", { fg = colors.textalt, bg = derived.bg_darker })
  hi("SnacksInputBorder", { fg = colors.cyandark })
  hi("SnacksInputTitle", { fg = colors.accent, bold = true })
  hi("SnacksBackdrop", { bg = colors.blackalt })
  hi("SnacksZenBar", { bg = derived.bg_dark })
  hi("SnacksProfilerBadge", { fg = colors.bg, bg = colors.accent })
  hi("SnacksProfilerUnknown", { fg = colors.gray })
  hi("SnacksProfilerFunction", { fg = colors.bluepastel })
  hi("SnacksProfilerFile", { fg = colors.cyanpastel })

  -- Todo-comments
  hi("TodoFgTODO", { fg = colors.cyanbright })
  hi("TodoFgFIX", { fg = colors.redbright })
  hi("TodoFgHACK", { fg = colors.yellowbright })
  hi("TodoFgWARN", { fg = colors.yellowpastel })
  hi("TodoFgPERF", { fg = colors.magentapastel })
  hi("TodoFgNOTE", { fg = colors.greenpastel })
  hi("TodoFgTEST", { fg = colors.orangepastel })
  hi("TodoBgTODO", { fg = colors.bg, bg = colors.cyanbright, bold = true })
  hi("TodoBgFIX", { fg = colors.bg, bg = colors.redbright, bold = true })
  hi("TodoBgHACK", { fg = colors.bg, bg = colors.yellowbright, bold = true })
  hi("TodoBgWARN", { fg = colors.bg, bg = colors.yellowpastel, bold = true })
  hi("TodoBgPERF", { fg = colors.bg, bg = colors.magentapastel, bold = true })
  hi("TodoBgNOTE", { fg = colors.bg, bg = colors.greenpastel, bold = true })
  hi("TodoBgTEST", { fg = colors.bg, bg = colors.orangepastel, bold = true })
  hi("TodoSignTODO", { fg = colors.cyanbright })
  hi("TodoSignFIX", { fg = colors.redbright })
  hi("TodoSignHACK", { fg = colors.yellowbright })
  hi("TodoSignWARN", { fg = colors.yellowpastel })
  hi("TodoSignPERF", { fg = colors.magentapastel })
  hi("TodoSignNOTE", { fg = colors.greenpastel })
  hi("TodoSignTEST", { fg = colors.orangepastel })

  -- Bufferline (if used)
  hi("BufferLineBackground", { fg = colors.gray, bg = derived.bg_dark })
  hi("BufferLineBufferSelected", { fg = colors.accent, bg = colors.bg, bold = true })
  hi("BufferLineBufferVisible", { fg = colors.graybright, bg = derived.bg_dark })
  hi("BufferLineFill", { bg = derived.bg_darker })
  hi("BufferLineSeparator", { fg = colors.graydark, bg = derived.bg_dark })
  hi("BufferLineSeparatorSelected", { fg = colors.cyandark, bg = colors.bg })
  hi("BufferLineIndicatorSelected", { fg = colors.accent, bg = colors.bg })
  hi("BufferLineModified", { fg = colors.yellowpastel })
  hi("BufferLineModifiedSelected", { fg = colors.yellowbright })
  hi("BufferLineDiagnostic", { fg = colors.gray, bg = derived.bg_dark })
  hi("BufferLineDiagnosticSelected", { fg = colors.redpastel, bg = colors.bg })
  hi("BufferLineTab", { fg = colors.gray, bg = derived.bg_dark })
  hi("BufferLineTabSelected", { fg = colors.accent, bg = colors.bg })
  hi("BufferLineTabSeparator", { fg = colors.graydark, bg = derived.bg_dark })
  hi("BufferLineTabSeparatorSelected", { fg = colors.cyandark, bg = colors.bg })
  hi("BufferLineCloseButton", { fg = colors.gray, bg = derived.bg_dark })
  hi("BufferLineCloseButtonSelected", { fg = colors.redpastel, bg = colors.bg })
  hi("BufferLineNumbersSelected", { fg = colors.accent, bg = colors.bg })

  -- ─────────────────────────────────────────────────────────────
  -- LUALINE (all modes, all sections)
  -- ─────────────────────────────────────────────────────────────
  -- Section a: mode indicator (bold blocks)
  -- Section b: git/branch info
  -- Section c: filename / path
  -- Sections x/y/z: right side info

  local lualine_modes = {
    normal = { a_fg = colors.bg, a_bg = colors.accent, b_fg = colors.textalt, b_bg = derived.bg_dark },
    insert = { a_fg = colors.bg, a_bg = colors.greenbright, b_fg = colors.textalt, b_bg = derived.bg_dark },
    visual = { a_fg = colors.bg, a_bg = colors.yellowbright, b_fg = colors.textalt, b_bg = derived.bg_dark },
    replace = { a_fg = colors.bg, a_bg = colors.redpastel, b_fg = colors.textalt, b_bg = derived.bg_dark },
    command = { a_fg = colors.bg, a_bg = colors.orangepastel, b_fg = colors.textalt, b_bg = derived.bg_dark },
    terminal = { a_fg = colors.bg, a_bg = colors.purplepastel, b_fg = colors.textalt, b_bg = derived.bg_dark },
    inactive = { a_fg = colors.gray, a_bg = derived.bg_darker, b_fg = colors.gray, b_bg = derived.bg_darker },
  }

  for mode, c in pairs(lualine_modes) do
    hi("lualine_a_" .. mode, { fg = c.a_fg, bg = c.a_bg, bold = true })
    hi("lualine_b_" .. mode, { fg = c.b_fg, bg = c.b_bg })
    hi("lualine_c_" .. mode, { fg = colors.textalt, bg = colors.bg })
    hi("lualine_x_" .. mode, { fg = colors.textalt, bg = colors.bg })
    hi("lualine_y_" .. mode, { fg = c.b_fg, bg = c.b_bg })
    hi("lualine_z_" .. mode, { fg = c.a_fg, bg = c.a_bg, bold = true })
  end
end

return M

