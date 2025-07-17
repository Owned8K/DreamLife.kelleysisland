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

diag_log "=== COMPANY OWNERSHIP RECEIVED ===";
diag_log format ["Query Result: %1", _queryResult];
diag_log format ["Player: %1", name _player];

if (!(_player isEqualTo player)) exitWith {
    diag_log "[ERROR] Wrong player object received";
};

// Stocker le résultat pour une utilisation ultérieure
player setVariable ["company_ownership", _queryResult, true];
diag_log format ["Stored company data: %1", _queryResult];

// Si le joueur a une entreprise, ajouter l'action au menu Y
if !(_queryResult isEqualTo []) then {
    diag_log "[INFO] Player has a company, adding menu action";
    
    // Supprimer l'ancienne action si elle existe
    if (!isNil {player getVariable "company_action"}) then {
        player removeAction (player getVariable "company_action");
        diag_log "[INFO] Removed old action";
    };
    
    // Ajouter la nouvelle action
    private _actionId = player addAction [
        "<t color='#FF8C00'>Gestion d'Entreprise</t>",
        {
            [] spawn life_fnc_openCompanyMenu;
        },
        "",
        0,
        false,
        false,
        "",
        "!dialog"
    ];
    
    // Sauvegarder l'ID de l'action
    player setVariable ["company_action", _actionId];
    diag_log format ["[SUCCESS] Added menu action with ID: %1", _actionId];
    
    // Afficher un message au joueur
    hint parseText format ["<t color='#00FF00'>Entreprise trouvée :</t><br/><br/>%1", _queryResult select 1];
} else {
    diag_log "[INFO] No company found for player";
    
    // Supprimer l'action si elle existe
    if (!isNil {player getVariable "company_action"}) then {
        player removeAction (player getVariable "company_action");
        player setVariable ["company_action", nil];
        diag_log "[INFO] Removed existing menu action";
    };
};

diag_log "=== END COMPANY OWNERSHIP RECEIVED ==="; 