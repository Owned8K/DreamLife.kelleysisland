#include "..\..\..\script_macros.hpp"
/*
    File: fn_initCompanyMenu.sqf
    Author: Gemini
    Description: Initialise le menu de gestion d'entreprise
*/
disableSerialization;

private _display = findDisplay 3800;
if (isNull _display) exitWith {};

// Afficher le message de chargement
private _companyInfo = _display displayCtrl 3802;
_companyInfo ctrlSetStructuredText parseText "<t align='center'>Chargement des données...</t>";

// Demander les données de l'entreprise
[player] remoteExecCall ["TON_fnc_fetchCompanyData", RSERV]; 