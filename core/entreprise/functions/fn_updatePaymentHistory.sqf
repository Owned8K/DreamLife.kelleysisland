#include "..\..\..\script_macros.hpp"
/*
    File: fn_updatePaymentHistory.sqf
    Author: Your Name
    
    Description:
    Met à jour la liste des paiements effectués aux employés
*/

disableSerialization;

diag_log "[COMPANY] Starting updatePaymentHistory...";

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
diag_log format ["[COMPANY] Requesting payment history for company ID: %1", _companyId];

// Vider la listbox
lbClear _listbox;

// Ajouter un message temporaire
_listbox lbAdd "Chargement de l'historique...";
_listbox lbSetColor [(lbSize _listbox) - 1, [1, 1, 1, 1]];

// Demander l'historique au serveur
[_companyId, player] remoteExec ["TON_fnc_getPaymentHistory", RSERV];
diag_log format ["[COMPANY] Sent request to server for company ID: %1", _companyId]; 