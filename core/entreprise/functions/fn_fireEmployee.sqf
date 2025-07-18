#include "..\..\..\script_macros.hpp"
/*
    Author: Owned8K
    Description: Licencie l'employé sélectionné
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

private _employeeData = _list lbData _selectedIndex;
_employeeData = parseSimpleArray _employeeData;
_employeeData params [
    ["_uid", "", [""]],
    ["_name", "", [""]],
    ["_salary", 0, [0]]
];

// Confirmation
private _action = [
    format [localize "STR_Company_Fire_Confirm", _name],
    localize "STR_Company_Fire_Title",
    localize "STR_Global_Yes",
    localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if (_action) then {
    [player, _uid] remoteExec ["TON_fnc_fireEmployee", RSERV];
}; 