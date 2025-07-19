#include "..\..\..\script_macros.hpp"
/*
    File: fn_updateEmployeeCombo.sqf
    Author: Your Name
    
    Description:
    Met à jour la liste des employés dans la combobox
*/

private ["_display", "_combo", "_companyId", "_employees"];

disableSerialization;

diag_log "[COMPANY] Updating employee combo...";

// Récupérer l'interface et la combobox
_display = findDisplay 9800;
if (isNull _display) exitWith {
    diag_log "[COMPANY] Display 9800 not found";
};

_combo = _display displayCtrl 9813;
if (isNull _combo) exitWith {
    diag_log "[COMPANY] Control 9813 not found";
};

// Vérifier si le joueur a une entreprise
if (count life_company_data == 0) exitWith {
    hint "Vous n'avez pas d'entreprise.";
    diag_log "[COMPANY] No company data found";
};

_companyId = life_company_data select 0;
_employees = [];

// Récupérer les données des employés si disponibles
if (count life_company_data >= 6) then {
    _employees = life_company_data select 5;
    diag_log format ["[COMPANY] Found employees in company data: %1", _employees];
} else {
    diag_log "[COMPANY] No employee data in company_data";
};

// Sauvegarder la sélection actuelle
private _currentSelection = lbCurSel _combo;

// Vider la combobox
lbClear _combo;

// Ajouter une option par défaut
_combo lbAdd "-- Sélectionner un employé --";
_combo lbSetData [0, ""];

// Si nous avons des données d'employés locales, les utiliser
if (count _employees > 0) then {
    diag_log format ["[COMPANY] Using local employee data: %1", _employees];
    
    {
        _x params [
            ["_uid", "", [""]],
            ["_name", "", [""]],
            ["_salary", 0, [0]]
        ];
        
        private _displayText = format ["%1 - $%2", _name, [_salary] call life_fnc_numberText];
        private _index = _combo lbAdd _displayText;
        _combo lbSetData [_index, _uid];
        diag_log format ["[COMPANY] Added employee from local data: %1 (UID: %2, Salary: %3)", _displayText, _uid, _salary];
    } forEach _employees;
} else {
    diag_log format ["[COMPANY] No local employee data, requesting from server for company ID: %1", _companyId];
    
    // Demander la liste des employés au serveur
    [_companyId, player] remoteExec ["TON_fnc_getCompanyEmployees", RSERV];
};

// Restaurer la sélection si possible
if (_currentSelection > 0 && _currentSelection < lbSize _combo) then {
    _combo lbSetCurSel _currentSelection;
} else {
    _combo lbSetCurSel 0;
}; 