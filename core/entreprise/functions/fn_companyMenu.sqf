#include "..\..\..\script_macros.hpp"
/*
    File: fn_companyMenu.sqf
    Author: Gemini
    Description: Ouvre le menu de gestion d'entreprise
*/

diag_log "fn_companyMenu called";

// Fermer tous les dialogues existants
closeDialog 0;

diag_log "fn_companyMenu: Creating dialog";

// Ouvrir le menu de gestion d'entreprise
if (createDialog "company_management") then {
    diag_log "fn_companyMenu: Dialog created successfully";
    
    // Initialiser le menu
    disableSerialization;
    private _display = findDisplay 9800;
    private _companyInfo = _display displayCtrl 9802;
    _companyInfo ctrlSetStructuredText parseText "<t align='center'>Chargement des données...</t>";
    
    // Demander les données de l'entreprise
    [player] remoteExecCall ["TON_fnc_fetchCompanyData", RSERV];
    
    diag_log "fn_companyMenu: Data requested";
} else {
    diag_log "fn_companyMenu: Failed to create dialog";
}; 