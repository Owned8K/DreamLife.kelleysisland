#include "..\..\..\script_macros.hpp"
/*
    File: fn_updateEmployeeCombo.sqf
    Author: Your Name
    
    Description:
    Met à jour la liste des employés dans la combobox
*/

private ["_display", "_combo", "_companyId"];

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

// Sauvegarder la sélection actuelle
private _currentSelection = lbCurSel _combo;

// Vider la combobox
lbClear _combo;

// Ajouter une option par défaut
_combo lbAdd "-- Sélectionner un employé --";
_combo lbSetData [0, ""];

diag_log format ["[COMPANY] Requesting employees for company ID: %1", _companyId];

// Demander la liste des employés au serveur
[_companyId, player] remoteExec ["TON_fnc_getCompanyEmployees", RSERV]; 