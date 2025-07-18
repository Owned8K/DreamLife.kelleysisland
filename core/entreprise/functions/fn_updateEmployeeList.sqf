#include "..\..\..\script_macros.hpp"
/*
    File: fn_updateEmployeeList.sqf
    Author: Your Name
    
    Description:
    Met à jour la liste des employés dans l'interface de gestion d'entreprise
*/

private ["_display", "_listbox"];

disableSerialization;

// Récupérer l'interface et la listbox
_display = findDisplay 9800;
if (isNull _display) exitWith {};

_listbox = _display displayCtrl 9804;
lbClear _listbox;

// Vérifier si le joueur a une entreprise
if (count life_company_data == 0) exitWith {
    _listbox lbAdd "Aucune entreprise";
};

private _companyId = life_company_data select 0;

// Demander la liste des employés au serveur
[_companyId, player] remoteExec ["TON_fnc_getCompanyEmployees", RSERV];

// Ajouter un message temporaire
_listbox lbAdd "Chargement des employés..."; 