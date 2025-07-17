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
diag_log format ["Current Player: %1", name player];
diag_log format ["Player Match: %1", _player isEqualTo player];

if (!(_player isEqualTo player)) exitWith {
    diag_log "[ERROR] Wrong player object received";
};

// Si le joueur a une entreprise
if !(_queryResult isEqualTo []) then {
    diag_log "[INFO] Player has a company, setting up data";
    
    // Stocker les données dans une variable globale
    life_company_data = _queryResult;
    diag_log format ["Stored company data: %1", life_company_data];
    
    // Ajouter le bouton au menu Y
    if (!isNil {player getVariable "company_action"}) then {
        player removeAction (player getVariable "company_action");
        diag_log "[INFO] Removed old action";
    };
    
    private _actionId = player addAction [
        "<t color='#FF8C00'>Gestion d'Entreprise</t>",
        {
            if (!dialog) then {
                createDialog "company_management";
            };
        },
        "",
        0,
        false,
        false,
        "",
        "!dialog"
    ];
    
    player setVariable ["company_action", _actionId];
    diag_log format ["[SUCCESS] Added menu action with ID: %1", _actionId];
    
    hint parseText format ["<t color='#00FF00'>Entreprise trouvée :</t><br/><br/>%1", _queryResult select 1];
} else {
    diag_log "[INFO] No company found for player";
    life_company_data = [];
    
    if (!isNil {player getVariable "company_action"}) then {
        player removeAction (player getVariable "company_action");
        player setVariable ["company_action", nil];
        diag_log "[INFO] Removed existing menu action";
    };
};

diag_log "=== END COMPANY OWNERSHIP RECEIVED ==="; 