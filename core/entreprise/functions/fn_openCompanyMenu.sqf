#include "..\..\..\script_macros.hpp"
/*
    File: fn_openCompanyMenu.sqf
    Author: Your Name
    Description: Ouvre le menu de gestion d'entreprise
*/

diag_log "[COMPANY MENU] Attempting to open company menu...";
diag_log format ["[COMPANY MENU] License check: logistician = %1", LICENSE_VALUE("logistician","civ")];

// Vérifier si le joueur a la licence
if !(LICENSE_VALUE("logistician","civ")) exitWith {
    diag_log "[COMPANY MENU] Player doesn't have logistician license";
    hint parseText "<t color='#FF0000'>Vous n'avez pas la licence de logistique.</t><br/><br/>Rendez-vous au vendeur de licences pour l'acheter.<br/><br/>Prix : $25,000";
};

// Vérifier si le joueur a assez d'argent pour acheter une entreprise
if (life_atmbank < 25000) exitWith {
    diag_log "[COMPANY MENU] Player doesn't have enough money";
    hint parseText "<t color='#FF0000'>Vous n'avez pas assez d'argent sur votre compte en banque.</t><br/><br/>Vous avez besoin d'au moins $25,000 pour créer une entreprise.";
};

// Marquer que nous voulons ouvrir le menu
player setVariable ["company_menu_requested", true];

// Demander les données au serveur
[player, getPlayerUID player] remoteExecCall ["life_fnc_fetchCompanyData", RSERV];

diag_log "[COMPANY MENU] Requested company data from server"; 