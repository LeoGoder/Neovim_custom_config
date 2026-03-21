-- Nettoyage des anciens thèmes avant de charger le tien
vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

-- Déclaration de ton thème clair
vim.o.background = "light"
vim.g.colors_name = "tropicals"

-- Ta palette (j'ai ajouté les '#' qui sont obligatoires pour Neovim)
local colors = {
    cerulean        = "#227c9d", -- Bleu (Fonctions, variables)
    ocean_mist      = "#17c3b2", -- Cyan/Menthe (Chaînes de caractères)
    apricot_cream   = "#ffcb77", -- Jaune (Fonds de sélection/recherche)
    floral_white    = "#fef9ef", -- Blanc cassé (Fond principal)
    grapefruit_pink = "#fe6d73", -- Rose/Rouge (Mots-clés, erreurs)
    dark_amethyst   = "#462255", -- Violet très foncé (Commentaires, ponctuation)
    prussian_blue   = "#001D4A", -- Bleu très sombre (Texte par défaut)
}

-- Une petite fonction pour raccourcir l'écriture des groupes
local function hl(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

-- ==========================================
-- 1. INTERFACE UTILISATEUR (UI)
-- ==========================================
hl("Normal",       { fg = colors.prussian_blue, bg = colors.floral_white })
hl("LineNr",       { fg = colors.cerulean }) -- Numéros de ligne
hl("CursorLine",   { bg = "#f2ebd9" }) -- Une version très légèrement assombrie de ton fond
hl("CursorLineNr", { fg = colors.grapefruit_pink, bold = true })
hl("Visual",       { bg = colors.apricot_cream, fg = colors.prussian_blue }) -- Sélection de texte
hl("Search",       { bg = colors.apricot_cream, fg = colors.prussian_blue, bold = true })

-- ==========================================
-- 2. SYNTAXE DE BASE ET TREE-SITTER
-- ==========================================
-- Commentaires (Violet foncé en italique)
hl("Comment",      { fg = colors.dark_amethyst, italic = true })

-- Mots-clés et logique (Rose pamplemousse)
hl("Keyword",      { fg = colors.grapefruit_pink, bold = true })
hl("Statement",    { fg = colors.grapefruit_pink })
hl("Conditional",  { fg = colors.grapefruit_pink })
hl("Repeat",       { fg = colors.grapefruit_pink })
hl("Operator",     { fg = colors.grapefruit_pink })

-- Fonctions et Identifiants (Bleu céruléen)
hl("Function",     { fg = colors.cerulean, bold = true })
hl("Identifier",   { fg = colors.cerulean })
hl("@variable",    { fg = colors.prussian_blue }) -- Les variables standards restent de la couleur du texte

-- Valeurs littérales (Menthe)
hl("String",       { fg = colors.ocean_mist })
hl("Number",       { fg = colors.ocean_mist })
hl("Boolean",      { fg = colors.grapefruit_pink, bold = true })

-- Types et structures (On utilise le bleu ou le violet pour garder du contraste)
hl("Type",         { fg = colors.dark_amethyst, bold = true })
hl("@type",        { fg = colors.dark_amethyst, bold = true })
hl("@constructor", { fg = colors.cerulean })

-- ==========================================
-- 3. DIAGNOSTICS (Erreurs, Warnings LSP)
-- ==========================================
hl("DiagnosticError", { fg = colors.grapefruit_pink })
hl("DiagnosticWarn",  { fg = colors.apricot_cream }) -- Ici c'est ok car souvent souligné, pas du texte pur
hl("DiagnosticInfo",  { fg = colors.cerulean })
hl("DiagnosticHint",  { fg = colors.ocean_mist })

