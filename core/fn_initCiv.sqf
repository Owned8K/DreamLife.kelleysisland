#include "..\script_macros.hpp"
/*
    File: fn_initCiv.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Initializes the civilian.
*/

private ["_spawnPos"];

diag_log "[INIT CIV] Starting civilian initialization...";

civ_spawn_1 = nearestObjects[getMarkerPos  "civ_spawn_1", ["Land_i_Shop_01_V1_F","Land_i_Shop_01_V2_F","Land_i_Shop_01_V3_F","Land_i_Shop_02_V1_F","Land_i_Shop_02_V2_F","Land_i_Shop_02_V3_F"],250];
civ_spawn_2 = nearestObjects[getMarkerPos  "civ_spawn_2", ["Land_i_Shop_01_V1_F","Land_i_Shop_01_V2_F","Land_i_Shop_01_V3_F","Land_i_Shop_02_V1_F","Land_i_Shop_02_V2_F","Land_i_Shop_02_V3_F"],250];
civ_spawn_3 = nearestObjects[getMarkerPos  "civ_spawn_3", ["Land_i_Shop_01_V1_F","Land_i_Shop_01_V2_F","Land_i_Shop_01_V3_F","Land_i_Shop_02_V1_F","Land_i_Shop_02_V2_F","Land_i_Shop_02_V3_F"],250];
civ_spawn_4 = nearestObjects[getMarkerPos  "civ_spawn_4", ["Land_i_Shop_01_V1_F","Land_i_Shop_01_V2_F","Land_i_Shop_01_V3_F","Land_i_Shop_02_V1_F","Land_i_Shop_02_V2_F","Land_i_Shop_02_V3_F"],250];
waitUntil {!(isNull (findDisplay 46))};

if (life_is_alive && !life_is_arrested) then {
    /* Spawn at our last position */
    player setVehiclePosition [life_civ_position, [], 0, "CAN_COLLIDE"];
} else {
    if (!life_is_arrested) then {
        switch (LIFE_SETTINGS(getNumber,"spawn_method")) do {
            case 0: {
                if (playerSide isEqualTo civilian) then {
                    _spawnPos = selectRandom (["civilian_spawn_1","civilian_spawn_2","civilian_spawn_3","civilian_spawn_4","civilian_spawn_5"]);
                    player setPos (getMarkerPos _spawnPos);
                };
            };

            case 1: {
                if (playerSide isEqualTo civilian) then {
                    _spawnPos = selectRandom (["civilian_spawn_1","civilian_spawn_2","civilian_spawn_3","civilian_spawn_4","civilian_spawn_5"]);
                    player setPos (getMarkerPos _spawnPos);
                };
            };

            case 2: {
                [] call life_fnc_spawnMenu;
                waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
                waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
            };
        };
    } else {
        if (life_is_arrested) then {
            life_is_arrested = false;
            [player,true] spawn life_fnc_jail;
        };
    };
};

life_is_alive = true;

// Vérifier si le joueur possède une entreprise
diag_log format ["[INIT CIV] Checking company ownership for player: %1 (%2)", profileName, getPlayerUID player];
[player, getPlayerUID player] remoteExecCall ["TON_fnc_checkCompanyOwner", RSERV];
diag_log "[INIT CIV] Company ownership check sent to server";

[] call life_fnc_playerSkins;
[] call life_fnc_setupActions;
[] call life_fnc_hudSetup;