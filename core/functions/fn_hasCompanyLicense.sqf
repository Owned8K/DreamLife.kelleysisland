#include "..\..\script_macros.hpp"
/*
    File: fn_hasCompanyLicense.sqf
    Author: Your Name
    Description: Vérifie si le joueur a la licence d'entreprise spécifiée
*/
params [
    ["_license", "", [""]]
];

if (_license isEqualTo "") exitWith {false};

// Vérifier si le joueur a la licence
private _varName = LICENSE_VARNAME(_license,"civ");
private _hasLicense = LICENSE_VALUE(_license,"civ");

// Log pour le debug
diag_log format ["[COMPANY LICENSE] Checking license %1 (%2) = %3", _license, _varName, _hasLicense];

_hasLicense 