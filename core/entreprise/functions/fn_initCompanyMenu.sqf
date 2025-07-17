#include "..\..\..\script_macros.hpp"
/*
    File: fn_initCompanyMenu.sqf
    Author: Gemini
    Description: Initialise le menu de gestion d'entreprise
*/
disableSerialization;

diag_log "fn_initCompanyMenu called";

private _display = findDisplay 9800;
if (isNull _display) exitWith {
    diag_log "fn_initCompanyMenu: Display 9800 is null!";
};

diag_log "fn_initCompanyMenu: Display found, setting loading message";

// Afficher le message de chargement
private _companyInfo = _display displayCtrl 9802;
_companyInfo ctrlSetStructuredText parseText "<t align='center'>Chargement des données...</t>";

// Vérifier si nous avons déjà demandé les données
if (isNil "life_company_data_requested") then {
    life_company_data_requested = true;
    diag_log "fn_initCompanyMenu: Requesting company data";
    
    // Demander les données de l'entreprise
    [player] remoteExecCall ["TON_fnc_fetchCompanyData", RSERV];
    
    diag_log "fn_initCompanyMenu: Data request sent";
} else {
    diag_log "fn_initCompanyMenu: Data already requested, skipping";
}; 