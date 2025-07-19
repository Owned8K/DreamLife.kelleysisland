#include "..\..\..\script_macros.hpp"
/*
    File: fn_openCompanyMenu.sqf
    Author: Your Name
    
    Description:
    Ouvre le menu de gestion d'entreprise
*/

if (count life_company_data == 0) exitWith {
    hint "Vous n'avez pas d'entreprise.";
};

if (!createDialog "Life_company_management") exitWith {
    hint "Erreur lors de l'ouverture du menu.";
};

diag_log "[COMPANY] Opening company management menu...";

// Mettre à jour les informations de l'entreprise
private _display = findDisplay 9800;
private _infoText = _display displayCtrl 9802;

private _companyId = life_company_data select 0;
private _companyName = life_company_data select 1;
private _ownerName = life_company_data select 2;
private _ownerUID = life_company_data select 3;
private _companyBank = life_company_data select 4;

_infoText ctrlSetStructuredText parseText format [
    "<t size='1.2'>%1</t><br/><br/>" +
    "<t>ID: %2</t><br/>" +
    "<t>Propriétaire: %3</t><br/>" +
    "<t>Compte: $%4</t>",
    _companyName,
    _companyId,
    _ownerName,
    [_companyBank] call life_fnc_numberText
];

// Initialiser la liste des joueurs à proximité
[] call life_fnc_updateNearbyPlayers;

// Les listes d'employés et de paiements seront initialisées automatiquement par l'onLoad du dialogue

diag_log "[COMPANY] Company management menu initialized"; 