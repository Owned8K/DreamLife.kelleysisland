#include "..\..\..\script_macros.hpp"
/*
    File: fn_companyDataReceived.sqf
    Author: Gemini
    Description: Reçoit les données de l'entreprise et les affiche dans le menu joueur.
*/
params [
    ["_companyId", 0, [0]],
    ["_companyName", "", [""]],
    ["_ownerName", "", [""]],
    ["_ownerUID", "", [""]],
    ["_companyBank", 0, [0]]
];

if (_companyId isEqualTo 0) exitWith {
    hint localize "STR_Company_No_Company";
};

// Stocker les données de l'entreprise
life_company_data = [_companyId, _companyName, _ownerName, _ownerUID, _companyBank];

// Mettre à jour l'interface du menu joueur
private _display = findDisplay 2001;
if (isNull _display) exitWith {};

private _licenseList = _display displayCtrl 2014;
private _struct = ctrlText _licenseList;

// Ajouter les informations de l'entreprise
_struct = _struct + format ["<br/><t size='1.1'><b>%1</b></t><br/>", _companyName];
_struct = _struct + format ["%1: %2<br/>", localize "STR_Company_Balance", [_companyBank] call life_fnc_numberText];

if (_ownerUID isEqualTo getPlayerUID player) then {
    _struct = _struct + format ["%1: %2<br/>", localize "STR_Company_Status", localize "STR_Company_Owner"];
} else {
    _struct = _struct + format ["%1: %2<br/>", localize "STR_Company_Status", localize "STR_Company_Employee"];
};

_licenseList ctrlSetStructuredText parseText _struct; 