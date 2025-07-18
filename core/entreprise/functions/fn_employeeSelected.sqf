#include "..\..\..\script_macros.hpp"
/*
    File: fn_employeeSelected.sqf
    Author: Gemini
    Description: Appelé quand un employé est sélectionné dans la liste
*/
params [
    ["_control", controlNull, [controlNull]],
    ["_selectedIndex", -1, [0]]
];

if (_selectedIndex == -1) exitWith {};

// Récupérer les données de l'employé sélectionné
private _employeeData = _control lbData _selectedIndex;
_employeeData = parseSimpleArray _employeeData;
_employeeData params [
    ["_uid", "", [""]],
    ["_name", "", [""]],
    ["_salary", 0, [0]]
];

// Mettre à jour le champ de salaire
private _display = findDisplay 9800;
private _salaryEdit = _display displayCtrl 9807;
_salaryEdit ctrlSetText str _salary;

// Activer/désactiver les boutons selon les permissions
private _fireButton = _display displayCtrl 9806;
private _salaryButton = _display displayCtrl 9808;

if ((_uid isEqualTo (getPlayerUID player)) || !(call life_isCompanyOwner)) then {
    _fireButton ctrlEnable false;
    _salaryButton ctrlEnable false;
} else {
    _fireButton ctrlEnable true;
    _salaryButton ctrlEnable true;
}; 