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

// Mettre à jour les informations de l'entreprise
private _display = findDisplay 9800;
private _infoText = _display displayCtrl 9802;

private _companyId = life_company_data select 0;
private _companyName = life_company_data select 1;
private _companyBank = life_company_data select 2;

_infoText ctrlSetStructuredText parseText format [
    "<t size='1.2'>%1</t><br/><br/>" +
    "<t>ID: %2</t><br/>" +
    "<t>Compte: $%3</t>",
    _companyName,
    _companyId,
    [_companyBank] call life_fnc_numberText
];

// Initialiser la liste des joueurs à proximité
[] call life_fnc_updateNearbyPlayers;

// Mettre à jour la liste des employés
[] call life_fnc_updateEmployeeList;

// Créer une boucle pour mettre à jour la liste des joueurs à proximité toutes les 2 secondes
[] spawn {
    private _display = findDisplay 9800;
    while {!isNull _display} do {
        [] call life_fnc_updateNearbyPlayers;
        sleep 2;
    };
};

// Ajouter un gestionnaire d'événement pour la fermeture du dialogue
_display displayAddEventHandler ["Unload", {
    params ["_display"];
    diag_log "[COMPANY] Menu closed, cleaning up...";
}]; 