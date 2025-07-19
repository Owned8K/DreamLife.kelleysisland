#include "..\..\..\script_macros.hpp"
/*
    File: fn_updatePaymentHistory.sqf
    Author: Your Name
    
    Description:
    Met à jour la liste des paiements effectués aux employés
*/

private ["_display", "_listbox", "_companyId"];

disableSerialization;

// Récupérer l'interface et la listbox
_display = findDisplay 9800;
if (isNull _display) exitWith {
    diag_log "[COMPANY] Display 9800 not found";
};

_listbox = _display displayCtrl 9815;
if (isNull _listbox) exitWith {
    diag_log "[COMPANY] Control 9815 not found";
};

// Vérifier si le joueur a une entreprise
if (count life_company_data == 0) exitWith {
    hint "Vous n'avez pas d'entreprise.";
};

_companyId = life_company_data select 0;

// Vider la listbox
lbClear _listbox;

// Ajouter un message temporaire
_listbox lbAdd "Chargement de l'historique...";

// Demander l'historique au serveur
[_companyId, player] remoteExec ["TON_fnc_getPaymentHistory", RSERV]; 