#include "..\..\script_macros.hpp"
/*
    File: fn_requestReceived.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Called by the server with the return information.
*/
life_session_tries = life_session_tries + 1;
if (life_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...
if (life_session_tries > 3) exitWith {cutText[localize "STR_Session_Error","BLACK FADED"]; 0 cutFadeOut 999999;};

// Parse basic player information
CASH = parseNumber (_this select 2);
BANK = parseNumber (_this select 3);
CONST(life_adminlevel,(_this select 4));
CONST(life_donator,(_this select 5));

// Parse licenses
if ((_this select 6) isEqualType []) then {
    {missionNamespace setVariable [(_x select 0),(_x select 1)];} forEach (_this select 6);
};

life_gear = _this select 8;
[true] call life_fnc_loadGear;

// Parse company data if civilian
if (playerSide isEqualTo civilian) then {
    private _companyData = _this select (count _this - 1);
    if (!(_companyData isEqualTo [])) then {
        life_company_data = _companyData;
        
        // Ajouter le bouton de gestion d'entreprise
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
        
        diag_log format ["[SESSION] Company data received: %1", _companyData];
        hint parseText format ["<t color='#00FF00'>Entreprise chargée :</t><br/><br/>%1", _companyData select 1];
    };
};

life_session_completed = true;
