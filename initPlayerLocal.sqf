#include "script_macros.hpp"
/*
    File: initPlayerLocal.sqf
    Author:

    Description:
    Starts the initialization of the player.
*/
if (!hasInterface && !isServer) exitWith {
    [] call compile preprocessFileLineNumbers "\life_hc\initHC.sqf";
};

CONST(BIS_fnc_endMission,BIS_fnc_endMission);
if (LIFE_SETTINGS(getNumber,"spyGlass_toggle") isEqualTo 1) then {[] execVM "SpyGlass\fn_initSpy.sqf";};

[] execVM "core\init.sqf";
[] execVM "briefing.sqf";

// Désactive le scoreboard (Multiplayer Statistics) sur la touche P
[] spawn {
    while {true} do {
        waitUntil { !isNull (findDisplay 24) };
        
        // Vérifier si le joueur a un smartphone
        if (life_inv_smartphone < 1) then {
            // Pas de smartphone : fermer le scoreboard et afficher un message
            (findDisplay 24) closeDisplay 2;
            hint "Vous n'avez pas de smartphone !";
            diag_log "[SMARTPHONE][CLIENT] Scoreboard bloqué - Pas de smartphone";
        } else {
            // A un smartphone : laisser le scoreboard se fermer naturellement (le smartphone s'ouvre)
            (findDisplay 24) closeDisplay 2;
            diag_log "[SMARTPHONE][CLIENT] Scoreboard fermé - Smartphone disponible";
        };
        
        sleep 0.1;
    };
};
