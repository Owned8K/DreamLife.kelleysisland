#include "..\..\..\script_macros.hpp"
/*
    Author: Owned8K
    Description: Met à jour la liste des employés dans l'interface
*/

params [
    ["_employees", [], [[]]]
];

private _display = findDisplay 3800;
if (isNull _display) exitWith {};

private _employeeList = _display displayCtrl 3804;
lbClear _employeeList;

{
    _x params [
        ["_name", "", [""]],
        ["_uid", "", [""]],
        ["_role", "", [""]]
    ];
    
    private _index = _employeeList lbAdd format["%1 - %2", _name, _role];
    _employeeList lbSetData [_index, _uid];
} forEach _employees; 