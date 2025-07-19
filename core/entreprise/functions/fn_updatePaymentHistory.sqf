#include "..\..\..\script_macros.hpp"
/*
    File: fn_updatePaymentHistory.sqf
    Author: Your Name
    
    Description:
    Met à jour la liste des paiements effectués aux employés
*/

diag_log "=== life_fnc_updatePaymentHistory START ===";
diag_log format ["Lock status: %1", !isNil "life_payment_history_update_lock"];

if (!isNil "life_payment_history_update_lock") then {
    life_payment_history_update_lock = nil;
    diag_log "[COMPANY] Removed existing lock";
};

life_payment_history_update_lock = true;
diag_log "[COMPANY] Set new lock";

[] spawn {
    sleep 3;
    life_payment_history_update_lock = nil;
    diag_log "[COMPANY] Lock released after timeout";
};

disableSerialization;

// Récupérer l'interface et la listbox
private _display = findDisplay 9800;
if (isNull _display) exitWith {
    diag_log "[COMPANY] ERROR: Display 9800 not found in updatePaymentHistory";
    hint "Erreur: Interface non trouvée";
    life_payment_history_update_lock = nil;
};

private _listbox = _display displayCtrl 9815;
if (isNull _listbox) exitWith {
    diag_log "[COMPANY] ERROR: Control 9815 not found in updatePaymentHistory";
    hint "Erreur: Liste des paiements non trouvée";
    life_payment_history_update_lock = nil;
};

// Vérifier si le joueur a une entreprise
if (life_company_data isEqualTo []) exitWith {
    diag_log "[COMPANY] No company data found";
    hint "Vous n'avez pas d'entreprise.";
    life_payment_history_update_lock = nil;
};

private _companyId = life_company_data select 0;
private _companyName = life_company_data select 1;
private _ownerName = life_company_data select 2;
private _ownerUID = life_company_data select 3;
private _companyBank = life_company_data select 4;

diag_log format ["[COMPANY] Updating payment history for company: %1 (ID: %2)", _companyName, _companyId];

// Vider la listbox
lbClear _listbox;
diag_log "[COMPANY] Cleared payment history listbox";

// Ajouter un message temporaire
_listbox lbAdd format ["Chargement de l'historique pour %1...", _companyName];
_listbox lbSetColor [(lbSize _listbox) - 1, [1, 1, 1, 1]];
diag_log "[COMPANY] Added loading message to listbox";

// Demander l'historique au serveur
[_companyId, player] remoteExecCall ["TON_fnc_getPaymentHistory", RSERV];
diag_log format ["[COMPANY] Sent request to server for company ID: %1", _companyId];
diag_log format ["[COMPANY] Player object: %1", player];
diag_log format ["[COMPANY] Player UID: %1", getPlayerUID player];
diag_log "=== life_fnc_updatePaymentHistory END ==="; 