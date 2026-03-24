-- Minimal Neovim Configuration
-- Lightweight config for quick terminal editing

----------------------------------------------------------------------
-- Options
----------------------------------------------------------------------

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- UI
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8
vim.opt.cursorline = true
vim.opt.showmode = true
vim.opt.laststatus = 2

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Misc
vim.opt.clipboard = "unnamedplus"
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.updatetime = 250
vim.opt.mouse = "a"
vim.opt.wrap = false

----------------------------------------------------------------------
-- Keymaps
----------------------------------------------------------------------

vim.g.mapleader = " "

-- Clear search highlight
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Directory browser
vim.keymap.set("n", "<leader>e", vim.cmd.Ex, { desc = "Open file explorer" })

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Move lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor centered when scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

----------------------------------------------------------------------
-- Netrw (built-in file browser)
----------------------------------------------------------------------

vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_winsize = 25

----------------------------------------------------------------------
-- Colorscheme: Ayu Dark
-- Palette matched to Emacs/tmux ayu-dark configs
----------------------------------------------------------------------

vim.cmd("highlight clear")
vim.o.background = "dark"

local hl = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

-- Palette (from Emacs.org dw/apply-ayu-dark-style and .tmux.conf)
local c = {
    bg        = "#0F111B",
    bg_float  = "#171B27",
    bg_border = "#2B2E36",
    bg_visual = "#2B2E36",
    bg_cursorline = "#1C1F29",
    fg        = "#C3CCDF",
    fg_dim    = "#B3B1AD",
    comment   = "#65737E",
    docstring = "#8996A2",
    keyword   = "#F6C177",
    builtin   = "#81A1C1",
    string    = "#A3BE8C",
    func      = "#7FDBCA",
    type      = "#C792EA",
    variable  = "#FFB974",
    constant  = "#F07178",
    error     = "#F07178",
    warn      = "#F6C177",
    info      = "#81A1C1",
    hint      = "#7FDBCA",
    accent    = "#7FDBCA",
    search_bg = "#2f447f",
}

-- Editor UI
hl("Normal",       { fg = c.fg, bg = c.bg })
hl("NormalFloat",  { fg = c.fg, bg = c.bg_float })
hl("FloatBorder",  { fg = c.comment, bg = c.bg_float })
hl("CursorLine",   { bg = c.bg_cursorline })
hl("CursorColumn", { bg = c.bg_cursorline })
hl("ColorColumn",  { bg = c.bg_cursorline })
hl("LineNr",       { fg = c.comment })
hl("CursorLineNr", { fg = c.keyword, bold = true })
hl("SignColumn",   { fg = c.comment, bg = c.bg })
hl("Visual",       { bg = c.bg_visual })
hl("VisualNOS",    { bg = c.bg_visual })
hl("Search",       { fg = "#ffffff", bg = c.search_bg })
hl("IncSearch",    { fg = c.bg, bg = c.keyword, bold = true })
hl("CurSearch",    { fg = c.bg, bg = c.keyword, bold = true })
hl("VertSplit",    { fg = c.bg_border })
hl("WinSeparator", { fg = c.bg_border })
hl("StatusLine",   { fg = c.fg_dim, bg = c.bg_float })
hl("StatusLineNC", { fg = c.comment, bg = c.bg_cursorline })
hl("TabLine",      { fg = c.comment, bg = c.bg_float })
hl("TabLineFill",  { bg = c.bg_cursorline })
hl("TabLineSel",   { fg = c.fg, bg = c.bg, bold = true })
hl("Pmenu",        { fg = c.fg, bg = c.bg_float })
hl("PmenuSel",     { fg = "#ffffff", bg = c.search_bg })
hl("PmenuSbar",    { bg = c.bg_border })
hl("PmenuThumb",   { bg = c.comment })
hl("Folded",       { fg = c.comment, bg = c.bg_cursorline })
hl("FoldColumn",   { fg = c.comment, bg = c.bg })
hl("MatchParen",   { fg = c.keyword, bold = true, underline = true })
hl("NonText",      { fg = c.bg_border })
hl("SpecialKey",   { fg = c.bg_border })
hl("Directory",    { fg = c.builtin })
hl("Title",        { fg = c.builtin, bold = true })
hl("Question",     { fg = c.accent })
hl("MoreMsg",      { fg = c.accent })
hl("ModeMsg",      { fg = c.fg_dim, bold = true })
hl("ErrorMsg",     { fg = c.error, bold = true })
hl("WarningMsg",   { fg = c.warn })
hl("WildMenu",     { fg = c.bg, bg = c.keyword })

-- Diff
hl("DiffAdd",    { bg = "#1a2e1a" })
hl("DiffChange", { bg = "#1a1a2e" })
hl("DiffDelete", { fg = c.error, bg = "#2e1a1a" })
hl("DiffText",   { bg = "#2a2a4e", bold = true })

-- Syntax
hl("Comment",    { fg = c.comment, italic = true })
hl("String",     { fg = c.string })
hl("Character",  { fg = c.string })
hl("Number",     { fg = c.constant })
hl("Boolean",    { fg = c.constant })
hl("Float",      { fg = c.constant })
hl("Constant",   { fg = c.constant })
hl("Identifier", { fg = c.fg })
hl("Function",   { fg = c.func })
hl("Statement",  { fg = c.keyword })
hl("Keyword",    { fg = c.keyword })
hl("Operator",   { fg = c.fg_dim })
hl("PreProc",    { fg = c.keyword })
hl("Include",    { fg = c.keyword })
hl("Define",     { fg = c.keyword })
hl("Type",       { fg = c.type })
hl("StorageClass", { fg = c.type })
hl("Structure",  { fg = c.type })
hl("Special",    { fg = c.variable })
hl("SpecialChar",{ fg = c.variable })
hl("Tag",        { fg = c.builtin })
hl("Delimiter",  { fg = c.fg_dim })
hl("Error",      { fg = c.error })
hl("Todo",       { fg = c.keyword, bold = true })
hl("Underlined", { fg = c.accent, underline = true })

-- Diagnostics
hl("DiagnosticError", { fg = c.error })
hl("DiagnosticWarn",  { fg = c.warn })
hl("DiagnosticInfo",  { fg = c.info })
hl("DiagnosticHint",  { fg = c.hint })
hl("DiagnosticUnderlineError", { undercurl = true, sp = c.error })
hl("DiagnosticUnderlineWarn",  { undercurl = true, sp = c.warn })
hl("DiagnosticUnderlineInfo",  { undercurl = true, sp = c.info })
hl("DiagnosticUnderlineHint",  { undercurl = true, sp = c.hint })

-- Treesitter (if available)
hl("@comment",          { link = "Comment" })
hl("@string",           { link = "String" })
hl("@number",           { link = "Number" })
hl("@boolean",          { link = "Boolean" })
hl("@function",         { link = "Function" })
hl("@function.builtin", { fg = c.builtin })
hl("@keyword",          { link = "Keyword" })
hl("@type",             { link = "Type" })
hl("@type.builtin",     { fg = c.type, italic = true })
hl("@variable",         { fg = c.fg })
hl("@variable.builtin", { fg = c.variable })
hl("@constant",         { link = "Constant" })
hl("@constant.builtin", { fg = c.constant, italic = true })
hl("@property",         { fg = c.fg_dim })
hl("@parameter",        { fg = c.variable })
hl("@operator",         { link = "Operator" })
hl("@punctuation",      { fg = c.fg_dim })
hl("@tag",              { fg = c.builtin })
hl("@tag.attribute",    { fg = c.variable })
hl("@tag.delimiter",    { fg = c.fg_dim })
hl("@string.escape",    { fg = c.variable })
hl("@text.emphasis",    { italic = true })
hl("@text.strong",      { bold = true })
hl("@text.uri",         { fg = c.accent, underline = true })

----------------------------------------------------------------------
-- Autocommands
----------------------------------------------------------------------

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({ timeout = 200 })
    end,
})

-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        local pos = vim.api.nvim_win_get_cursor(0)
        vim.cmd([[%s/\s\+$//e]])
        vim.api.nvim_win_set_cursor(0, pos)
    end,
})
