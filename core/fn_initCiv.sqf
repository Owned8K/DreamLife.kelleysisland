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
    if !(life_civ_position isEqualTo []) then {
        diag_log format ["[INIT CIV] Teleporting to last position: %1", life_civ_position];
        player setPosATL life_civ_position;
    } else {
        diag_log "[INIT CIV] No valid last position, using default spawn";
        if (LIFE_SETTINGS(getNumber,"spawn_method") isEqualTo 2) then {
            [] call life_fnc_spawnMenu;
            waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
            waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
        } else {
            _spawnPos = selectRandom (["civilian_spawn_1","civilian_spawn_2","civilian_spawn_3","civilian_spawn_4","civilian_spawn_5"]);
            player setPos (getMarkerPos _spawnPos);
        };
    };
} else {
    if (life_is_arrested) then {
        life_is_arrested = false;
        [player,true] spawn life_fnc_jail;
    } else {
        if (LIFE_SETTINGS(getNumber,"spawn_method") isEqualTo 2) then {
            [] call life_fnc_spawnMenu;
            waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
            waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
        } else {
            _spawnPos = selectRandom (["civilian_spawn_1","civilian_spawn_2","civilian_spawn_3","civilian_spawn_4","civilian_spawn_5"]);
            player setPos (getMarkerPos _spawnPos);
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

// Les distributeurs sont maintenant créés côté serveur au démarrage
diag_log "[INIT CIV] Les distributeurs sont créés côté serveur";

// Créer les marqueurs sur la carte
[] spawn life_fnc_createDistributeurMarkers;

// Ajouter les actions si nécessaire
[] spawn {
    sleep 5; // Attendre que les objets soient synchronisés
    [] call life_fnc_addDistributeurActions;
};