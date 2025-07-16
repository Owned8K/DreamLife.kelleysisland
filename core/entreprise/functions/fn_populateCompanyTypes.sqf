/*
    File: fn_populateCompanyTypes3.sqf
    Description: Version de test - Ajoute 3-4 types d'entreprise en dur dans la liste pour valider l'UI.
*/
#include "..\..\..\script_macros.hpp"

disableSerialization;

diag_log "FN_populateCompanyTypes3 called (test statique)";

private _display = findDisplay 3700;
if (isNull _display) exitWith { diag_log "FN_populateCompanyTypes3: Display 3700 introuvable"; };

private _companyList = _display displayCtrl 3701;
if (isNull _companyList) exitWith { diag_log "FN_populateCompanyTypes3: Control 3701 introuvable"; };

lbClear _companyList;
diag_log "FN_populateCompanyTypes3: ListBox cleared (test statique)";

// Ajout manuel de 3-4 types d'entreprise fictifs
private _index1 = _companyList lbAdd "Entreprise Alpha";
_companyList lbSetData [_index1, "alpha"];

private _index2 = _companyList lbAdd "Entreprise Beta";
_companyList lbSetData [_index2, "beta"];

private _index3 = _companyList lbAdd "Entreprise Gamma";
_companyList lbSetData [_index3, "gamma"];

private _index4 = _companyList lbAdd "Entreprise Delta";
_companyList lbSetData [_index4, "delta"];

diag_log "FN_populateCompanyTypes3: 4 éléments ajoutés (test statique)";

// Sélectionne le premier élément et met à jour les détails
_companyList lbSetCurSel 0;
[_companyList, 0] call life_fnc_updateCompanyDetails;

diag_log "FN_populateCompanyTypes3 finished (test statique)";