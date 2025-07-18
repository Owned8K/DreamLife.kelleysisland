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
if (isNull _display) exitWith {};

_listbox = _display displayCtrl 9811;
lbClear _listbox;

// Trouver les joueurs à proximité (10 mètres)
_nearbyPlayers = [];
{
    if (_x != player && alive _x && _x distance player < 10) then {
        _nearbyPlayers pushBack _x;
    };
} forEach playableUnits;

// Remplir la listbox
{
    private _name = name _x;
    private _index = _listbox lbAdd _name;
    _listbox lbSetData [_index, str _x];
} forEach _nearbyPlayers;

if (count _nearbyPlayers == 0) then {
    _listbox lbAdd "Aucun joueur à proximité";
}; 