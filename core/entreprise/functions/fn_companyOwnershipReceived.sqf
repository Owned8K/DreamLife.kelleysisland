#include "..\..\..\script_macros.hpp"
/*
    File: fn_companyOwnershipReceived.sqf
    Author: Your Name
    Description: Reçoit et traite le résultat de la vérification de propriété d'entreprise
*/

params [
    ["_queryResult", [], [[]]],
    ["_player", objNull, [objNull]]
];

if (!(_player isEqualTo player)) exitWith {};

// Stocker le résultat pour une utilisation ultérieure
player setVariable ["company_ownership", _queryResult, true];

// Si le joueur a une entreprise, ajouter l'action au menu Y
if !(_queryResult isEqualTo []) then {
    // Supprimer l'ancienne action si elle existe
    if (!isNil {player getVariable "company_action"}) then {
        player removeAction (player getVariable "company_action");
    };
    
    // Ajouter la nouvelle action
    private _actionId = player addAction [
        "<t color='#FF8C00'>Gestion d'Entreprise</t>",
        life_fnc_openCompanyMenu,
        "",
        0,
        false,
        false,
        "",
        "!dialog"
    ];
    
    // Sauvegarder l'ID de l'action
    player setVariable ["company_action", _actionId];
    
    diag_log format ["[COMPANY OWNERSHIP] Added menu action for company: %1", _queryResult select 1];
} else {
    // Supprimer l'action si elle existe
    if (!isNil {player getVariable "company_action"}) then {
        player removeAction (player getVariable "company_action");
        player setVariable ["company_action", nil];
    };
    
    diag_log "[COMPANY OWNERSHIP] No company found, removed menu action if it existed";
}; 