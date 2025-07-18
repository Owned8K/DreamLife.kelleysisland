#include "..\..\..\script_macros.hpp"
/*
    File: fn_companyMenu.sqf
    Author: Gemini
    Description: Initialise le menu de gestion d'entreprise
*/

// Demander les données au serveur
[player] remoteExec ["TON_fnc_fetchCompanyData", RSERV];

// Ajouter un message de chargement
private _display = findDisplay 9800;
private _companyInfo = _display displayCtrl 9802;
_companyInfo ctrlSetStructuredText parseText "<t align='center'>Chargement des données...</t>"; 