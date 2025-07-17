#include "..\..\..\script_macros.hpp"
/*
    File: fn_openCompanyMenu.sqf
    Author: Your Name
    Description: Ouvre le menu de gestion d'entreprise
*/

diag_log "[COMPANY MENU] Attempting to open company menu...";

// Récupérer les données de l'entreprise
private _companyData = player getVariable ["company_ownership", []];
if (_companyData isEqualTo []) exitWith {
    diag_log "[COMPANY MENU] No company data found";
    hint parseText "<t color='#FF0000'>Erreur</t><br/><br/>Impossible de trouver les données de votre entreprise.";
};

// Marquer que nous voulons ouvrir le menu
player setVariable ["company_menu_requested", true];

// Demander les données détaillées au serveur
[player, _companyData select 0] remoteExecCall ["life_fnc_fetchCompanyData", RSERV];

diag_log format ["[COMPANY MENU] Requested detailed data for company ID: %1", _companyData select 0]; 