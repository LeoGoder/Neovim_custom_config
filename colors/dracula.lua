-- Nettoyage des anciens thèmes
vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

-- Déclaration du thème SOMBRE
vim.o.background = "dark"
vim.g.colors_name = "dracula_custom"

-- La palette Dracula officielle
local colors = {
    background   = "#282A36",
    current_line = "#44475A",
    selection    = "#44475A",
    foreground   = "#F8F8F2",
    comment      = "#6272A4",
    red          = "#FF5555",
    orange       = "#FFB86C",
    yellow       = "#F1FA8C",
    green        = "#50FA7B",
    cyan         = "#8BE9FD",
    purple       = "#BD93F9",
    pink         = "#FF79C6",
}

-- Fonction utilitaire pour l'assignation de couleurs
local function hl(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

-- ==========================================
-- 1. INTERFACE UTILISATEUR (UI)
-- ==========================================
hl("Normal",       { fg = colors.foreground, bg = colors.background })
hl("LineNr",       { fg = colors.comment })
hl("CursorLine",   { bg = colors.current_line })
hl("CursorLineNr", { fg = colors.yellow, bold = true })
hl("Visual",       { bg = colors.selection })
hl("Search",       { bg = colors.orange, fg = colors.background, bold = true })
hl("IncSearch",    { bg = colors.yellow, fg = colors.background, bold = true })
hl("ColorColumn",  { bg = colors.selection })

-- ==========================================
-- 2. SYNTAXE & TREE-SITTER
-- ==========================================
-- Commentaires et Ponctuation (Gris-bleu en italique)
hl("Comment",      { fg = colors.comment, italic = true })
hl("@punctuation", { fg = colors.foreground })

-- Mots-clés et Logique (Rose)
hl("Keyword",      { fg = colors.pink, bold = true })
hl("Statement",    { fg = colors.pink })
hl("Conditional",  { fg = colors.pink })
hl("Repeat",       { fg = colors.pink })
hl("Operator",     { fg = colors.pink })
hl("Exception",    { fg = colors.pink })

-- Fonctions et Variables (Vert et Blanc)
hl("Function",     { fg = colors.green })
hl("@function",    { fg = colors.green })
hl("Identifier",   { fg = colors.foreground })
hl("@variable",    { fg = colors.foreground })

-- >>> AJUSTEMENT 1 : 'self' en Violet <<<
-- Les variables intégrées (comme 'self' en Python) deviennent Violet et Italique
hl("@variable.builtin", { fg = colors.purple, italic = true }) -- self, cls, etc. en Violet

-- >>> AJUSTEMENT 2 : built-in functions en Vert <<<
-- Les fonctions intégrées (comme print, len) deviennent Vert, comme les autres fonctions
hl("@function.builtin", { fg = colors.green }) -- print, len, etc. en Vert

-- Paramètres et arguments (Orange et Italique)
hl("@variable.parameter", { fg = colors.orange, italic = true })

-- Chaines et Valeurs (Jaune et Violet)
hl("String",       { fg = colors.yellow })
hl("@comment.documentation", { fg = colors.yellow }) -- Docstrings jaunes
hl("Number",       { fg = colors.purple })
hl("Boolean",      { fg = colors.purple })
hl("Float",        { fg = colors.purple })
hl("Constant",     { fg = colors.purple })

-- Types et Structures (Cyan)
hl("Type",         { fg = colors.cyan, italic = true })
hl("@type",        { fg = colors.cyan, italic = true })
hl("@constructor", { fg = colors.cyan })

-- Spécifiques (Rose)
hl("Special",      { fg = colors.pink })
hl("@punctuation.delimiter", { fg = colors.pink }) -- Pour l'opérateur flèche '->' en C
-- ==========================================
-- >>> LES JETONS SÉMANTIQUES (LSP) <<<
-- Pour que les variables gardent leur couleur dans le corps des fonctions
-- ==========================================
hl("@lsp.type.parameter", { fg = colors.orange, italic = true })
hl("@lsp.type.variable",  {}) -- Laisse les variables normales par défaut
hl("@lsp.type.property",  { fg = colors.foreground }) -- Pour les self.attributs
hl("@lsp.type.enumMember",{ fg = colors.purple })
hl("@lsp.type.function",  { fg = colors.green })
hl("@lsp.type.method",    { fg = colors.green })
hl("@lsp.type.macro",     { fg = colors.pink })
hl("@lsp.type.class",     { fg = colors.cyan, italic = true })

-- Spécifique pour s'assurer que 'self' reste violet partout si le LSP s'en mêle
hl("@lsp.type.selfParameter", { fg = colors.purple, italic = true })

-- ==========================================
-- 3. DIAGNOSTICS (Erreurs LSP)
-- ==========================================
hl("DiagnosticError", { fg = colors.red })
hl("DiagnosticWarn",  { fg = colors.orange })
hl("DiagnosticInfo",  { fg = colors.cyan })
hl("DiagnosticHint",  { fg = colors.green })

