#include "..\..\script_macros.hpp"
/*
    File: fn_requestReceived.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Called by the server with the return information.
*/

params [
    ["_queryResult", [], [[]]]
];

diag_log format ["[REQUEST RECEIVED] Data: %1", _queryResult];

if (_queryResult isEqualTo []) exitWith {
    diag_log "[REQUEST RECEIVED] Error: Empty data received";
    [] call SOCK_fnc_insertPlayerInfo;
};

life_session_tries = life_session_tries + 1;
if (life_session_completed) exitWith {};
if (life_session_tries > 3) exitWith {cutText[localize "STR_Session_Error","BLACK FADED"]; 0 cutFadeOut 999999;};

// Parse basic player information
CASH = parseNumber (_queryResult select 2);
BANK = parseNumber (_queryResult select 3);
CONST(life_adminlevel,(_queryResult select 4));
CONST(life_donator,(_queryResult select 5));

// Parse licenses
if ((_queryResult select 6) isEqualType []) then {
    {missionNamespace setVariable [(_x select 0),(_x select 1)];} forEach (_queryResult select 6);
};

// Parse gear
life_gear = _queryResult select 8;
[true] call life_fnc_loadGear;

// Parse company data if civilian
if (playerSide isEqualTo civilian) then {
    private _companyData = _queryResult select (count _queryResult - 1);
    diag_log format ["[REQUEST RECEIVED] Company Data: %1", _companyData];
    
    if (!(_companyData isEqualTo [])) then {
        life_company_data = _companyData;
        
        // Ajouter le bouton de gestion d'entreprise
        private _actionId = player addAction [
            "<t color='#FF8C00'>Gestion d'Entreprise</t>",
            {
                if (!dialog) then {
                    createDialog "Life_company_management";
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
        
        diag_log format ["[SESSION] Company data received: %1", _companyData];
    };
};

life_session_completed = true;
