#include "..\..\..\script_macros.hpp"
/*
    File: fn_openCompanyMenu.sqf
    Author: Your Name
    Description: Ouvre le menu de gestion d'entreprise
*/

diag_log "[COMPANY MENU] Attempting to open company menu...";

// Vérifier si le joueur a la licence
if !(LICENSE_VALUE("logistician","civ")) exitWith {
    diag_log "[COMPANY MENU] Player doesn't have logistician license";
    hint "Vous n'avez pas la licence nécessaire.";
};

// Marquer que nous voulons ouvrir le menu
player setVariable ["company_menu_requested", true];

// Demander les données au serveur
[player, getPlayerUID player] remoteExecCall ["life_fnc_fetchCompanyData", RSERV];

diag_log "[COMPANY MENU] Requested company data from server"; 