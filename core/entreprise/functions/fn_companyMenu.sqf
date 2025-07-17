#include "..\..\..\script_macros.hpp"
/*
    File: fn_companyMenu.sqf
    Author: Gemini
    Description: Ouvre le menu de gestion d'entreprise
*/

diag_log "fn_companyMenu called";

// Fermer tous les dialogues existants
closeDialog 0;
sleep 0.1; // Attendre un court instant pour s'assurer que le dialogue est fermé

diag_log "fn_companyMenu: Creating dialog";

// Ouvrir le menu de gestion d'entreprise
if (createDialog "company_management") then {
    diag_log "fn_companyMenu: Dialog created successfully";
    waitUntil {!isNull (findDisplay 9800)};
    diag_log "fn_companyMenu: Dialog is now available";
} else {
    diag_log "fn_companyMenu: Failed to create dialog";
}; 