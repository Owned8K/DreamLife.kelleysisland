#include "..\..\..\script_macros.hpp"
/*
    File: fn_fireEmployee.sqf
    Author: Your Name
    
    Description:
    Licencie un employé sélectionné dans la combobox
*/

private ["_display", "_combo", "_selectedIndex", "_employeeUID", "_companyId"];

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
    hint "Veuillez sélectionner un employé à licencier.";
};

// Récupérer l'UID de l'employé
_employeeUID = _combo lbData _selectedIndex;

if (_employeeUID == "") exitWith {
    hint "Erreur: Impossible de récupérer les données de l'employé.";
};

// Envoyer la demande de licenciement au serveur
[_companyId, _employeeUID, player] remoteExec ["TON_fnc_fireEmployee", RSERV];

// Message de confirmation
hint "Demande de licenciement envoyée..."; 