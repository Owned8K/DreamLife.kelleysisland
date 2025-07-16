/*
    File: fn_populateCompanyTypes.sqf
    Author: Gemini
    Description: Remplit le menu de création d'entreprise avec les types disponibles.
*/
#include "..\..\script_macros.hpp"

// Désactive la sérialisation automatique pour manipuler l'UI
disableSerialization;

// Log d'entrée dans la fonction
diag_log "FN_populateCompanyTypes called";

// Récupère la fenêtre de création d'entreprise
private _display = findDisplay 3700;
// Vérifie que la fenêtre existe
if (isNull _display) exitWith { diag_log "FN_populateCompanyTypes: Display 3700 introuvable"; };

// Récupère le contrôle ListBox des types d'entreprise
private _companyList = _display displayCtrl 3701;
// Vérifie que le contrôle existe
if (isNull _companyList) exitWith { diag_log "FN_populateCompanyTypes: Control 3701 introuvable"; };

// Vide la liste des types d'entreprise
lbClear _companyList;
// Log du nettoyage de la liste
diag_log "FN_populateCompanyTypes: Clearing the ListBox";

// Récupère la config des types d'entreprise
private _cfgCompanies = missionConfigFile >> "CfgCompanies";
// Log du contenu de la config
diag_log ("life_fnc_populateCompanyTypes: _cfgCompanies = " + str(_cfgCompanies));

// Indique si au moins un type a été trouvé
private _found = false;
// Log du début de la boucle de remplissage
diag_log "FN_populateCompanyTypes: Début du parcours des types d'entreprise";
{
    // Récupère la config courante
    private _companyCfg = _x;
    // Vérifie que c'est bien une classe valide
    if (isClass _companyCfg) then {
        // Récupère le nom de la classe
        private _companyClass = configName _companyCfg;
        // Récupère la clé stringtable du nom affiché
        private _displayNameKey = M_CONFIG(getText, "CfgCompanies", _companyClass, "displayName");
        // Log la clé récupérée
        diag_log ("life_fnc_populateCompanyTypes: displayNameKey pour " + _companyClass + " = " + str(_displayNameKey));
        // Si la clé est vide
        if (_displayNameKey isEqualTo "") then {
            // Log d'erreur
            diag_log ("life_fnc_populateCompanyTypes: displayName manquant pour " + _companyClass);
        } else {
            // Ajoute le nom localisé dans la liste et récupère l'index
            private _index = _companyList lbAdd (localize _displayNameKey);
            // Associe la classe à l'élément de la liste
            _companyList lbSetData [_index, _companyClass];
            // Log d'ajout
            diag_log ("life_fnc_populateCompanyTypes: Added company " + _companyClass + " to ListBox at index " + str(_index));
            // Marque qu'au moins un type a été trouvé
            _found = true;
        };
    } else {
        // Log si la config n'est pas une classe
        diag_log ("life_fnc_populateCompanyTypes: NOT Found company in forEach");
    };
} forEach _cfgCompanies;
// Log de fin de remplissage
diag_log ("FN_populateCompanyTypes: Added items to ListBox");

// Si au moins un type a été trouvé
if (_found) then {
    // Log de sélection du premier élément
    diag_log "FN_populateCompanyTypes: Sélection du premier type d'entreprise pour affichage des détails";
    // Sélectionne le premier élément de la liste
    _companyList lbSetCurSel 0;
    // Met à jour les détails affichés pour ce type
    [_companyList, 0] call life_fnc_updateCompanyDetails;
} else {
    // Log si aucun type n'a été trouvé
    diag_log "FN_populateCompanyTypes: Aucun type d'entreprise trouvé.";
};

// Log de fin de fonction
diag_log "life_fnc_populateCompanyTypes finished";