#include "..\..\..\script_macros.hpp"
/*
    File: fn_updateEmployeesList.sqf
    Author: Your Name
    
    Description:
    Met à jour la liste des employés avec les données reçues du serveur
*/

params [
    ["_employees", [], [[]]]
];

private ["_display", "_listbox"];

disableSerialization;

// Récupérer l'interface et la listbox
_display = findDisplay 9800;
if (isNull _display) exitWith {};

_listbox = _display displayCtrl 9804;
lbClear _listbox;

// Si aucun employé
if (count _employees == 0) exitWith {
    _listbox lbAdd "Aucun employé";
};

// Ajouter chaque employé à la liste
{
    _x params [
        ["_uid", "", [""]],
        ["_name", "", [""]],
        ["_role", "", [""]]
    ];
    
    private _displayText = format ["%1 - %2", _name, _role];
    private _index = _listbox lbAdd _displayText;
    _listbox lbSetData [_index, _uid];
} forEach _employees; 