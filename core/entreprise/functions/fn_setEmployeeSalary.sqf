#include "..\..\..\script_macros.hpp"
/*
    File: fn_setEmployeeSalary.sqf
    Author: Your Name
    
    Description:
    Définit le salaire d'un employé
*/

private ["_display", "_combo", "_salaryEdit", "_selectedIndex", "_selectedUID", "_salary", "_companyId"];

disableSerialization;

// Récupérer l'interface et les contrôles
_display = findDisplay 9800;
if (isNull _display) exitWith {
    hint "Erreur: Menu non trouvé";
};

_combo = _display displayCtrl 9813;
_salaryEdit = _display displayCtrl 9807;

// Vérifier si un employé est sélectionné
_selectedIndex = lbCurSel _combo;
if (_selectedIndex == -1 || _selectedIndex == 0) exitWith {
    hint "Veuillez sélectionner un employé";
};

// Récupérer l'UID de l'employé sélectionné
_selectedUID = _combo lbData _selectedIndex;
if (_selectedUID == "") exitWith {
    hint "Erreur: Employé invalide";
};

// Récupérer le salaire saisi
_salary = ctrlText _salaryEdit;
if (_salary == "") exitWith {
    hint "Veuillez entrer un salaire";
};

// Convertir le salaire en nombre
_salary = parseNumber _salary;
if (_salary <= 0) exitWith {
    hint "Le salaire doit être supérieur à 0";
};

// Vérifier si le joueur a une entreprise
if (count life_company_data == 0) exitWith {
    hint "Vous n'avez pas d'entreprise";
};

_companyId = life_company_data select 0;

// Envoyer la demande au serveur
[_companyId, _selectedUID, _salary, player] remoteExec ["TON_fnc_setEmployeeSalary", RSERV];

// Vider le champ de salaire
_salaryEdit ctrlSetText ""; 