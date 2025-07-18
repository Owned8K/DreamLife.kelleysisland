#include "..\..\..\script_macros.hpp"
/*
    File: fn_setEmployeeSalary.sqf
    Author: Gemini
    Description: Définit le salaire de l'employé sélectionné
*/

if !(call life_isCompanyOwner) exitWith {
    hint localize "STR_Company_NotOwner";
};

private _display = findDisplay 9800;
private _list = _display displayCtrl 9804;
private _selectedIndex = lbCurSel _list;

if (_selectedIndex == -1) exitWith {
    hint localize "STR_Company_NoEmployeeSelected";
};

private _salaryEdit = _display displayCtrl 9807;
private _newSalary = parseNumber ctrlText _salaryEdit;

if (_newSalary < 0) exitWith {
    hint localize "STR_Company_InvalidSalary";
};

private _employeeData = _list lbData _selectedIndex;
_employeeData = parseSimpleArray _employeeData;
_employeeData params [
    ["_uid", "", [""]],
    ["_name", "", [""]],
    ["_salary", 0, [0]]
];

// Confirmation
private _action = [
    format [localize "STR_Company_Salary_Confirm", _name, [_newSalary] call life_fnc_numberText],
    localize "STR_Company_Salary_Title",
    localize "STR_Global_Yes",
    localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if (_action) then {
    [player, _uid, _newSalary] remoteExec ["TON_fnc_setEmployeeSalary", RSERV];
}; 