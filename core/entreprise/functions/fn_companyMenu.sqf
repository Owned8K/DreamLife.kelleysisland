#include "..\..\..\script_macros.hpp"
/*
    File: fn_companyMenu.sqf
    Author: Your Name
    Description: Affiche le menu de gestion d'entreprise
*/

// Vérifier si le joueur a une entreprise
private _companyData = player getVariable ["company_data", []];
if (_companyData isEqualTo []) exitWith {
    hint localize "STR_Company_No_Company";
};

// Ouvrir le dialogue
createDialog "company_management";
disableSerialization;

// Récupérer les contrôles
private _display = findDisplay 3800;
private _companyInfo = _display displayCtrl 3802;
private _employeeList = _display displayCtrl 3804;
private _manageButton = _display displayCtrl 3805;

// Extraire les données de l'entreprise
private _companyId = _companyData select 0;
private _companyName = _companyData select 1;
private _ownerName = _companyData select 2;
private _companyBank = _companyData select 4;
private _employees = _companyData select 5;
private _isOwner = _companyData select 6;

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

// Remplir la liste des employés
{
    private _name = _x select 0;
    private _uid = _x select 1;
    private _role = _x select 2;
    private _index = _employeeList lbAdd format["%1 - %2", _name, _role];
    _employeeList lbSetData [_index, _uid];
} forEach _employees;

// Afficher/Cacher les boutons de gestion selon les droits
_manageButton ctrlShow _isOwner;

// Log
diag_log format["[COMPANY MENU] %1 (%2) opened company menu for %3", profileName, getPlayerUID player, _companyName]; 