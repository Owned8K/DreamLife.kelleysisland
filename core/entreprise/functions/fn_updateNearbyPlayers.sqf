#include "..\..\..\script_macros.hpp"
/*
    File: fn_updateNearbyPlayers.sqf
    Author: Your Name
    
    Description:
    Met à jour la liste des joueurs à proximité dans la combobox
*/

private ["_display", "_combo", "_nearbyPlayers"];

disableSerialization;

// Récupérer l'interface et la combobox
_display = findDisplay 9800;
if (isNull _display) exitWith {
    diag_log "[COMPANY] Display 9800 not found";
};

_combo = _display displayCtrl 9811;
if (isNull _combo) exitWith {
    diag_log "[COMPANY] Control 9811 not found";
};

// Sauvegarder la sélection actuelle
private _currentSelection = lbCurSel _combo;

// Vider la combobox
lbClear _combo;

// Ajouter une option par défaut
_combo lbAdd "-- Sélectionner un joueur --";
_combo lbSetData [0, ""];

// Trouver les joueurs à proximité (10 mètres)
_nearbyPlayers = [];
{
    if (_x != player && alive _x && _x distance player < 10 && isPlayer _x) then {
        _nearbyPlayers pushBack _x;
        diag_log format ["[COMPANY] Found nearby player: %1 at distance %2m", name _x, _x distance player];
    };
} forEach playableUnits;

diag_log format ["[COMPANY] Found %1 nearby players", count _nearbyPlayers];

// Remplir la combobox
{
    private _name = name _x;
    private _index = _combo lbAdd format ["%1 (%2m)", _name, round(_x distance player)];
    _combo lbSetData [_index, str _x];
    diag_log format ["[COMPANY] Added player to combo: %1", _name];
} forEach _nearbyPlayers;

// Si aucun joueur trouvé
if (count _nearbyPlayers == 0) then {
    _combo lbAdd "Aucun joueur à proximité";
    _combo lbSetData [1, ""];
    diag_log "[COMPANY] No nearby players found";
};

// Restaurer la sélection si possible
if (_currentSelection >= 0 && _currentSelection < lbSize _combo) then {
    _combo lbSetCurSel _currentSelection;
} else {
    _combo lbSetCurSel 0;
}; 