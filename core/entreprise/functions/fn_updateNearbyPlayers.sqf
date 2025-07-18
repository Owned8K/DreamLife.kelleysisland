#include "..\..\..\script_macros.hpp"
/*
    File: fn_updateNearbyPlayers.sqf
    Author: Your Name
    
    Description:
    Met à jour la liste des joueurs à proximité dans l'interface de gestion d'entreprise
*/

private ["_display", "_listbox", "_nearbyPlayers"];

disableSerialization;

// Récupérer l'interface et la listbox
_display = findDisplay 9800;
if (isNull _display) exitWith {
    diag_log "[COMPANY] Display 9800 not found";
};

_listbox = _display displayCtrl 9811;
if (isNull _listbox) exitWith {
    diag_log "[COMPANY] Control 9811 not found";
};

lbClear _listbox;

// Trouver les joueurs à proximité (10 mètres)
_nearbyPlayers = [];
{
    if (_x != player && alive _x && _x distance player < 10 && isPlayer _x) then {
        _nearbyPlayers pushBack _x;
        diag_log format ["[COMPANY] Found nearby player: %1 at distance %2m", name _x, _x distance player];
    };
} forEach playableUnits;

diag_log format ["[COMPANY] Found %1 nearby players", count _nearbyPlayers];

// Remplir la listbox
{
    private _name = name _x;
    private _index = _listbox lbAdd format ["%1 (%2m)", _name, round(_x distance player)];
    _listbox lbSetData [_index, str _x];
    diag_log format ["[COMPANY] Added player to list: %1", _name];
} forEach _nearbyPlayers;

if (count _nearbyPlayers == 0) then {
    _listbox lbAdd "Aucun joueur à proximité";
    diag_log "[COMPANY] No nearby players found";
}; 