/*
    File: fn_populateCompanyTypes2.sqf
    Author: Gemini (refonte)
    Description: Remplit le menu de création d'entreprise avec les types disponibles (version améliorée).
*/
#include "..\..\..\script_macros.hpp"

disableSerialization;

// Log d'entrée dans la fonction
diag_log "FN_populateCompanyTypes2 called";

// Récupère la fenêtre de création d'entreprise
private _display = findDisplay "CompanyCreation";
if (isNull _display) exitWith {
    diag_log "FN_populateCompanyTypes2: Display 3700 introuvable";
};

// Récupère le contrôle ListBox des types d'entreprise
private _companyList = _display displayCtrl 3701;
if (isNull _companyList) exitWith {
    diag_log "FN_populateCompanyTypes2: Control 3701 introuvable";
};

// Vide la liste des types d'entreprise
lbClear _companyList;
diag_log "FN_populateCompanyTypes2: ListBox cleared";

// Récupère la config des types d'entreprise
private _cfgCompanies = missionConfigFile >> "CfgCompanies";
diag_log format["FN_populateCompanyTypes2: _cfgCompanies = %1", str(_cfgCompanies)];

// Indique si au moins un type a été trouvé
private _found = false;

// Parcours chaque config d'entreprise
{
    private _companyCfg = _x;
    if (isClass _companyCfg) then {
        private _companyClass = configName _companyCfg;
        private _displayNameKey = M_CONFIG(getText, "CfgCompanies", _companyClass, "displayName");
        diag_log format["FN_populateCompanyTypes2: displayNameKey for %1 = %2", _companyClass, _displayNameKey];

        if (_displayNameKey isEqualTo "") then {
            diag_log format["FN_populateCompanyTypes2: displayName manquant pour %1", _companyClass];
        } else {
            private _index = _companyList lbAdd (localize _displayNameKey);
            _companyList lbSetData [_index, _companyClass];
            diag_log format["FN_populateCompanyTypes2: Added company %1 to ListBox at index %2", _companyClass, _index];
            _found = true;
        };
    } else {
        diag_log "FN_populateCompanyTypes2: NOT Found company (not a class)";
    };
} forEach _cfgCompanies;

diag_log "FN_populateCompanyTypes2: ListBox population finished";

// Sélectionne le premier élément si la liste n'est pas vide
if (_found) then {
    diag_log "FN_populateCompanyTypes2: Selecting first company type and updating details";
    _companyList lbSetCurSel 0;
    [_companyList, 0] call life_fnc_updateCompanyDetails;
} else {
    diag_log "FN_populateCompanyTypes2: Aucun type d'entreprise trouvé.";
};

diag_log "FN_populateCompanyTypes2 finished"; 