#include "..\..\..\script_macros.hpp"
/*
    File: fn_updatePaymentHistory.sqf
    Author: Your Name
    
    Description:
    Met à jour la liste des paiements effectués aux employés
*/

disableSerialization;

diag_log "=== life_fnc_updatePaymentHistory START ===";
diag_log format ["life_company_data: %1", life_company_data];
diag_log format ["Current Display: %1", findDisplay 9800];

// Récupérer l'interface et la listbox
private _display = findDisplay 9800;
if (isNull _display) exitWith {
    diag_log "[COMPANY] ERROR: Display 9800 not found in updatePaymentHistory";
    hint "Erreur: Interface non trouvée";
};

private _listbox = _display displayCtrl 9815;
if (isNull _listbox) exitWith {
    diag_log "[COMPANY] ERROR: Control 9815 not found in updatePaymentHistory";
    hint "Erreur: Liste des paiements non trouvée";
};

// Vérifier si le joueur a une entreprise
if (life_company_data isEqualTo []) exitWith {
    diag_log "[COMPANY] No company data found";
    hint "Vous n'avez pas d'entreprise.";
};

private _companyId = life_company_data select 0;
diag_log format ["[COMPANY] Company ID from life_company_data: %1", _companyId];
diag_log format ["[COMPANY] Full company data: %1", life_company_data];

// Vider la listbox
lbClear _listbox;
diag_log "[COMPANY] Cleared payment history listbox";

// Ajouter un message temporaire
_listbox lbAdd "Chargement de l'historique...";
_listbox lbSetColor [(lbSize _listbox) - 1, [1, 1, 1, 1]];
diag_log "[COMPANY] Added loading message to listbox";

// Demander l'historique au serveur
[_companyId, player] remoteExec ["TON_fnc_getPaymentHistory", RSERV];
diag_log format ["[COMPANY] Sent request to server for company ID: %1", _companyId];
diag_log format ["[COMPANY] Player object: %1", player];
diag_log format ["[COMPANY] Player UID: %1", getPlayerUID player];
diag_log "=== life_fnc_updatePaymentHistory END ==="; 