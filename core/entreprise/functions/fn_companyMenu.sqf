#include "..\..\..\script_macros.hpp"
/*
    File: fn_companyMenu.sqf
    Author: Gemini
    Description: Ouvre le menu de gestion d'entreprise ou de création d'entreprise selon si le joueur en possède une.
*/

// Vérifie si le joueur a déjà une entreprise
private _hasCompany = false;
{
    private _license = _x;
    if (_license select 0 select [0, 8] == "license_" && {_license select 1 == 1}) then {
        _hasCompany = true;
    };
} forEach life_licenses;

if (_hasCompany) then {
    // TODO: Ouvrir le menu de gestion d'entreprise
    hint "Menu de gestion d'entreprise à implémenter";
} else {
    // Ouvrir le menu de création d'entreprise
    createDialog "CompanyCreation";
}; 