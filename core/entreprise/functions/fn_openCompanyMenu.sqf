#include "..\..\..\script_macros.hpp"
/*
    File: fn_openCompanyMenu.sqf
    Author: Your Name
    Description: Ouvre le menu d'entreprise en récupérant d'abord les données
*/

// Récupérer l'ID de l'entreprise du joueur depuis la licence
private _companyLicenses = [];
{
    if (_x select 1 isEqualTo "civ" && {[_x select 0] call life_fnc_hasCompanyLicense}) then {
        _companyLicenses pushBack (_x select 0);
    };
} forEach (getArray(missionConfigFile >> "Licenses" >> "companies"));

if (_companyLicenses isEqualTo []) exitWith {
    hint localize "STR_Company_No_Company";
};

// Marquer que nous voulons ouvrir le menu
player setVariable ["company_menu_requested", true];

// Demander les données au serveur (correction du nom de la fonction)
[player, _companyLicenses select 0] remoteExecCall ["life_fnc_fetchCompanyData", RSERV];

// Log
diag_log format ["[COMPANY MENU] Requesting company data for license: %1", _companyLicenses select 0]; 