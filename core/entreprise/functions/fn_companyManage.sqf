#include "..\..\..\script_macros.hpp"
/*
    Author: Owned8K
    Description: Gère les actions de gestion d'entreprise (embauche, licenciement, etc.)
*/
private ["_display", "_employeeList", "_selectedIndex", "_selectedEmployee"];
disableSerialization;

_display = findDisplay 3800;
if (isNull _display) exitWith {};

_employeeList = _display displayCtrl 3804;
_selectedIndex = lbCurSel _employeeList;

if (_selectedIndex == -1) exitWith {
    hint localize "STR_Company_No_Employee_Selected";
};

_selectedEmployee = _employeeList lbData _selectedIndex;

// Créer le menu d'action pour l'employé sélectionné
createDialog "company_employee_actions"; 