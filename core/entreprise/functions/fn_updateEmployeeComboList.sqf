#include "..\..\..\script_macros.hpp"
/*
    File: fn_updateEmployeeComboList.sqf
    Author: Your Name
    
    Description:
    Met à jour la combobox des employés avec les données reçues du serveur
*/

params [
    ["_employees", [], [[]]]
];

private ["_display", "_combo"];

disableSerialization;

diag_log format ["[COMPANY] Received %1 employees to display", count _employees];

// Récupérer l'interface et la combobox
_display = findDisplay 9800;
if (isNull _display) exitWith {
    diag_log "[COMPANY] Display 9800 not found";
};

_combo = _display displayCtrl 9813;
if (isNull _combo) exitWith {
    diag_log "[COMPANY] Control 9813 not found";
};

// Sauvegarder la sélection actuelle
private _currentSelection = lbCurSel _combo;

// Vider la combobox
lbClear _combo;

// Ajouter une option par défaut
_combo lbAdd "-- Sélectionner un employé --";
_combo lbSetData [0, ""];

// Si aucun employé
if (count _employees == 0) exitWith {
    _combo lbAdd "Aucun employé";
    _combo lbSetData [1, ""];
    _combo lbSetCurSel 0;
    diag_log "[COMPANY] No employees found";
};

// Ajouter chaque employé à la liste
{
    _x params [
        ["_uid", "", [""]],
        ["_name", "", [""]],
        ["_role", "", [""]]
    ];
    
    // Extraire le salaire du rôle (format: "salary_X")
    private _salary = 0;
    if (_role select [0,7] == "salary_") then {
        _salary = parseNumber (_role select [7]);
    };
    
    private _displayText = format ["%1 - $%2", _name, [_salary] call life_fnc_numberText];
    private _index = _combo lbAdd _displayText;
    _combo lbSetData [_index, _uid];
    diag_log format ["[COMPANY] Added employee to combo: %1 (UID: %2)", _displayText, _uid];
} forEach _employees;

// Restaurer la sélection si possible
if (_currentSelection > 0 && _currentSelection < lbSize _combo) then {
    _combo lbSetCurSel _currentSelection;
} else {
    _combo lbSetCurSel 0;
}; 