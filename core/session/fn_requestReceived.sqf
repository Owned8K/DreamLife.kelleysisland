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
private _licenses = _queryResult select 6;
if (_licenses isEqualType []) then {
    {
        if (_x isEqualType []) then {
            if (count _x == 2) then {
                private _varName = _x select 0;
                private _value = _x select 1;
                if (_value isEqualType 0) then {
                    missionNamespace setVariable [_varName, (_value isEqualTo 1)];
                } else {
                    missionNamespace setVariable [_varName, _value];
                };
                diag_log format ["[LICENSE] Setting %1 to %2", _varName, _value];
            };
        };
    } forEach _licenses;
};

// Parse gear
life_gear = _queryResult select 8;
[true] call life_fnc_loadGear;

// Parse position if available (should be civ_position)
try {
    private _rawPosition = _queryResult param [7, "[]"];
    diag_log format ["[POSITION] Raw position data: %1 (Type: %2)", _rawPosition, typeName _rawPosition];

    if (_rawPosition isEqualType "") then {
        if (_rawPosition != "[]" && _rawPosition != "") then {
            private _position = call compile _rawPosition;
            if (_position isEqualType [] && {count _position == 3}) then {
                player setPosATL _position;
                diag_log format ["[POSITION] Successfully set position to %1", _position];
            } else {
                throw "Invalid position array format";
            };
        } else {
            throw "Empty position data";
        };
    } else {
        throw format ["Unexpected position data type: %1", typeName _rawPosition];
    };
} catch {
    diag_log format ["[POSITION] Error handling position: %1", _exception];
};

// Parse company data if civilian
if (playerSide isEqualTo civilian) then {
    private _companyData = _queryResult select (count _queryResult - 1);
    diag_log format ["[REQUEST RECEIVED] Company Data: %1", _companyData];
    
    if (!(_companyData isEqualTo [])) then {
        life_company_data = _companyData;
        diag_log format ["[SESSION] Company data received: %1", _companyData];
    };
};

// Mise à jour de l'interface pour afficher les licences
[] call life_fnc_hudUpdate;
[] call life_fnc_updateLicenseList;

life_session_completed = true;
