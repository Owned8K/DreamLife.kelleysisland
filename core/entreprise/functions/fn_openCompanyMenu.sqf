#include "..\..\..\script_macros.hpp"
/*
    File: fn_openCompanyMenu.sqf
    Author: Your Name
    Description: Ouvre le menu de gestion d'entreprise
*/

private ["_display", "_companyData"];

if (dialog) exitWith {};

diag_log "[COMPANY MENU] Attempting to open company menu...";

// Récupérer les données de l'entreprise
_companyData = player getVariable ["company_ownership", []];
if (_companyData isEqualTo []) exitWith {
    diag_log "[COMPANY MENU] No company data found";
    hint parseText "<t color='#FF0000'>Erreur</t><br/><br/>Impossible de trouver les données de votre entreprise.";
};

createDialog "company_management";
waitUntil {!isNull (findDisplay 3800)};

// Demander les données détaillées au serveur
[player, _companyData select 0] remoteExecCall ["TON_fnc_fetchCompanyData", RSERV];

diag_log format ["[COMPANY MENU] Requested detailed data for company ID: %1", _companyData select 0]; 