#include "..\..\..\script_macros.hpp"
/*
    File: fn_buyCompany.sqf
    Author: Gemini
    Description: Gère la logique côté client pour l'achat d'une entreprise.
*/
disableSerialization;

private _display = findDisplay 3700;
private _companyList = _display displayCtrl 3701;
private _companyNameInput = _display displayCtrl 3703;

private _selectedIndex = lbCurSel _companyList;
if (_selectedIndex == -1) exitWith {hint localize "STR_CompanyCreate_NoSelection";};

private _companyClass = _companyList lbData _selectedIndex;
private _companyName = ctrlText _companyNameInput;
private _price = M_CONFIG(getNumber, "CfgCompanies", _companyClass, "price");
private _licenseVar = M_CONFIG(getText, "CfgCompanies", _companyClass, "license");

// --- Validation Côté Client ---
if (life_atmbank < _price) exitWith {
    hint format[localize "STR_NOTF_NotEnoughMoney_2", [_price - life_atmbank] call life_fnc_numberText];
};

if (LICENSE_VALUE(_licenseVar, "civ")) exitWith {
    hint localize "STR_CompanyCreate_AlreadyOwner";
};

if (_companyName isEqualTo "") exitWith 
{ hint localize "STR_CompanyCreate_InvalidName"; };
    
if (count (toArray _companyName) < 3) exitWith 
{ hint localize "STR_CompanyCreate_InvalidName"; };

// --- Attribution de la licence ---
diag_log format ["[COMPANY CREATION] %1 (%2) is buying company type %3 with license %4", profileName, getPlayerUID player, _companyClass, _licenseVar];

// Attribuer la licence
missionNamespace setVariable [LICENSE_VARNAME(_licenseVar,"civ"), true];

// --- Appel Côté Serveur ---
// Le serveur fait les vérifications finales (nom unique, etc.) et effectue l'achat.
hint "Vérification du nom de l'entreprise et finalisation de l'achat...";
[_companyName, _companyClass, player, _licenseVar] remoteExecCall ["TON_fnc_dbCompanyCreate", RSERV];

// Sauvegarder les changements (licence et argent)
[1] call SOCK_fnc_updatePartial;

diag_log format ["[COMPANY CREATION] License %1 attributed to %2 (%3)", _licenseVar, profileName, getPlayerUID player];

closeDialog 0;