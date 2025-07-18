#include "..\..\..\script_macros.hpp"
/*
    File: fn_setEmployeeSalary.sqf
    Author: Your Name
    
    Description:
    Définit le salaire d'un employé sélectionné
*/

private ["_display", "_combo", "_selectedIndex", "_employeeUID", "_companyId", "_salaryEdit", "_salary"];

// Vérifier si le joueur a une entreprise
if (count life_company_data == 0) exitWith {
    hint "Vous n'avez pas d'entreprise.";
};

_companyId = life_company_data select 0;

// Récupérer la combobox et la sélection
_display = findDisplay 9800;
if (isNull _display) exitWith {};

_combo = _display displayCtrl 9813;
_selectedIndex = lbCurSel _combo;

// Vérifier si un employé est sélectionné
if (_selectedIndex < 1) exitWith {
    hint "Veuillez sélectionner un employé.";
};

// Récupérer l'UID de l'employé
_employeeUID = _combo lbData _selectedIndex;

if (_employeeUID == "") exitWith {
    hint "Erreur: Impossible de récupérer les données de l'employé.";
};

// Récupérer le salaire saisi
_salaryEdit = _display displayCtrl 9807;
_salary = ctrlText _salaryEdit;

if (!([_salary] call TON_fnc_isnumber)) exitWith {
    hint "Le salaire doit être un nombre.";
};

_salary = parseNumber _salary;

if (_salary < 0) exitWith {
    hint "Le salaire ne peut pas être négatif.";
};

// Envoyer la demande de modification de salaire au serveur
[_companyId, _employeeUID, _salary, player] remoteExec ["TON_fnc_setEmployeeSalary", RSERV];

// Message de confirmation
hint "Demande de modification de salaire envoyée..."; 