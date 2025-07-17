#include "..\..\..\script_macros.hpp"
/*
    File: fn_companyMenu.sqf
    Author: Gemini
    Description: Ouvre le menu de gestion d'entreprise
*/

diag_log "fn_companyMenu called";

// Fermer le menu joueur
closeDialog 0;

diag_log "fn_companyMenu: Creating dialog";

// Ouvrir le menu de gestion d'entreprise
if (createDialog "company_management") then {
    diag_log "fn_companyMenu: Dialog created successfully";
} else {
    diag_log "fn_companyMenu: Failed to create dialog";
}; 