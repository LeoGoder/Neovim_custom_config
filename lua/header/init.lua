local M = {}

local campus = "lyon.fr"

-- 1. Fonction pour récupérer les bons symboles de commentaire selon le fichier
local function get_comment_chars()
    local ext = vim.fn.expand('%:e')
    local nom = vim.fn.expand('%:t')
    
    -- Pour le C, C++ et les headers
    if ext == "c" or ext == "h" or ext == "cpp" or ext == "hpp" then
        return "/*", "*/"
    -- Pour les scripts shell, python, et surtout les Makefile !
    elseif ext == "sh" or ext == "py" or nom == "Makefile" or nom == "makefile" then
        return "#", "#"
    else
        return "//", "//"
    end
end

-- 2. Fonction pour générer la bordure (les lignes de * et les lignes vides)
local function faire_bordure(debut_com, fin_com, char_remplissage)
    local len_gauche = string.len(debut_com .. " ")
    local len_droite = string.len(" " .. fin_com)
    local nb_chars = 80 - len_gauche - len_droite
    
    return debut_com .. " " .. string.rep(char_remplissage, nb_chars) .. " " .. fin_com
end

-- 3. Fonction pour générer une ligne de 80 caractères avec le texte
local function faire_ligne(debut_com, fin_com, texte_gauche, ascii_droite)
    local partie_gauche = debut_com .. "   " .. texte_gauche
    if texte_gauche == "" then partie_gauche = debut_com .. "   " end
    
    local partie_droite = ascii_droite .. fin_com
    
    local nb_espaces = 80 - string.len(partie_gauche) - string.len(partie_droite)
    if nb_espaces < 0 then nb_espaces = 0 end 
    
    return partie_gauche .. string.rep(" ", nb_espaces) .. partie_droite
end

-- 4. Fonction principale pour insérer le header
function M.insert_header()
    local nom_fichier = vim.fn.expand('%:t')
    if nom_fichier == "" then nom_fichier = "sans_nom.c" end
    
    local user = os.getenv("USER") or "marvin"
    local email = user .. "@student.42" .. campus
    local date_actuelle = os.date("%Y/%m/%d %H:%M:%S")

    local debut_com, fin_com = get_comment_chars()

    local texte_by = string.format("By: %s <%s>", user, email)
    local texte_cree = string.format("Created: %s by %s", date_actuelle, user)
    local texte_maj = string.format("Updated: %s by %s", date_actuelle, user)

    -- Ton ASCII art (identique)
    local a1 = ":::      ::::::::   "
    local a2 = ":+:      :+:    :+:   "
    local a3 = "+:+ +:+         +:+     "
    local a4 = "+#+  +:+       +#+        "
    local a5 = "+#+#+#+#+#+   +#+           "
    local a6 = "#+#    #+#             "
    local a7 = "###   ########" .. campus .. "   "

    local header = {
        faire_bordure(debut_com, fin_com, "*"),
        faire_bordure(debut_com, fin_com, " "),
        faire_ligne(debut_com, fin_com, "", a1),
        faire_ligne(debut_com, fin_com, nom_fichier, a2),
        faire_ligne(debut_com, fin_com, "", a3),
        faire_ligne(debut_com, fin_com, texte_by, a4),
        faire_ligne(debut_com, fin_com, "", a5),
        faire_ligne(debut_com, fin_com, texte_cree, a6),
        faire_ligne(debut_com, fin_com, texte_maj, a7),
        faire_bordure(debut_com, fin_com, " "),
        faire_bordure(debut_com, fin_com, "*"),
        "" 
    }

    vim.api.nvim_buf_set_lines(0, 0, 0, false, header)
end

-- 5. Mise à jour automatique de la ligne "Updated:" à la sauvegarde
function M.update_header()
    local user = os.getenv("USER") or "marvin"
    local date_actuelle = os.date("%Y/%m/%d %H:%M:%S")
    local texte_maj = string.format("Updated: %s by %s", date_actuelle, user)
    
    local debut_com, fin_com = get_comment_chars()
    local a7 = "###   ########" .. campus .. "   "
    
    local nouvelle_ligne = faire_ligne(debut_com, fin_com, texte_maj, a7)

    local lignes = vim.api.nvim_buf_get_lines(0, 0, 10, false)
    
    -- Sécurité : on "échappe" les caractères spéciaux de debut_com pour la recherche Lua
    -- (Sinon le symbole '*' de '/*' fait planter le string.match)
    local recherche_debut = debut_com:gsub("%*", "%%%*")
    
    if #lignes >= 9 and string.match(lignes[9], "^" .. recherche_debut .. "%s*Updated:") then
        vim.api.nvim_buf_set_lines(0, 8, 9, false, {nouvelle_ligne})
    end
end

-- Création de l'événement automatique à la sauvegarde
vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        M.update_header()
    end
})

return M
