#include "..\..\..\script_macros.hpp"
/*
    File: fn_companyMenu.sqf
    Author: Your Name
    Description: Affiche le menu de gestion d'entreprise
*/

private ["_display", "_companyInfo", "_employeeList", "_manageButton"];
disableSerialization;

if (isNull (findDisplay 3800)) then {
    if (!(createDialog "company_management")) exitWith {};
};

// Vérifier si le joueur a une entreprise
if (count life_company_data isEqualTo 0) exitWith {
    hint localize "STR_Company_No_Company";
    closeDialog 0;
};

_display = findDisplay 3800;
_companyInfo = _display displayCtrl 3802;
_employeeList = _display displayCtrl 3804;
_manageButton = _display displayCtrl 3805;

// Extraire les données de l'entreprise
private _companyId = life_company_data select 0;
private _companyName = life_company_data select 1;
private _ownerName = life_company_data select 2;
private _ownerUID = life_company_data select 3;
private _companyBank = life_company_data select 4;

// Formater les informations de l'entreprise
private _info = format [
    "<t size='1.2'><b>%1</b></t><br/>" +
    "<t>%2: %3</t><br/>" +
    "<t>%4: $%5</t>",
    _companyName,
    localize "STR_Company_Owner",
    _ownerName,
    localize "STR_Company_Balance",
    [_companyBank] call life_fnc_numberText
];

// Afficher les informations
_companyInfo ctrlSetStructuredText parseText _info;

// Vérifier si le joueur est le propriétaire
if (_ownerUID isEqualTo getPlayerUID player) then {
    _manageButton ctrlEnable true;
} else {
    _manageButton ctrlEnable false;
};

// Demander la liste des employés au serveur
[_companyId, player] remoteExecCall ["TON_fnc_fetchCompanyEmployees", RSERV]; 