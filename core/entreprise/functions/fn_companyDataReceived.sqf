#include "..\..\..\script_macros.hpp"
/*
    File: fn_companyDataReceived.sqf
    Author: Your Name
    Description: Reçoit et traite les données de l'entreprise du serveur
*/

params [
    ["_companyData", [], [[]]],
    ["_player", objNull, [objNull]]
];

if (!(_player isEqualTo player)) exitWith {};
if (_companyData isEqualTo []) exitWith {
    hint localize "STR_Company_No_Company";
};

// Structure des données:
// _companyData = [id, name, owner_name, owner_uid, bank, employees]
private _companyId = _companyData select 0;
private _companyName = _companyData select 1;
private _ownerName = _companyData select 2;
private _ownerUID = _companyData select 3;
private _companyBank = _companyData select 4;
private _employees = _companyData select 5;

// Vérifier si le joueur est le propriétaire
private _isOwner = (getPlayerUID player) isEqualTo _ownerUID;

// Stocker les données avec des informations supplémentaires
player setVariable ["company_data", [
    _companyId,
    _companyName,
    _ownerName,
    _ownerUID,
    _companyBank,
    _employees,
    _isOwner
], true];

// Ouvrir le menu si demandé
if (player getVariable ["company_menu_requested", false]) then {
    player setVariable ["company_menu_requested", false];
    [] call life_fnc_companyMenu;
};

// Log
diag_log format ["[COMPANY DATA] Received company data: %1", _companyData]; 