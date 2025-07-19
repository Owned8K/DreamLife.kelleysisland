#include "..\..\..\script_macros.hpp"
/*
    File: fn_updatePaymentHistoryList.sqf
    Author: Your Name
    
    Description:
    Met à jour la liste des paiements dans l'interface
*/

params [
    ["_paymentHistory", [], [[]]]
];

diag_log "=== life_fnc_updatePaymentHistoryList START ===";
diag_log format ["[COMPANY] Received payment history data: %1", _paymentHistory];

disableSerialization;

private _display = findDisplay 9800;
if (isNull _display) exitWith {
    diag_log "[COMPANY] ERROR: Display 9800 not found in updatePaymentHistoryList";
    hint "Erreur: Interface non trouvée";
};

private _listbox = _display displayCtrl 9815;
if (isNull _listbox) exitWith {
    diag_log "[COMPANY] ERROR: Control 9815 not found in updatePaymentHistoryList";
    hint "Erreur: Liste des paiements non trouvée";
};

// Vider la listbox
lbClear _listbox;
diag_log "[COMPANY] Cleared payment history listbox";

if (_paymentHistory isEqualTo []) then {
    _listbox lbAdd "Aucun paiement trouvé";
    _listbox lbSetColor [(lbSize _listbox) - 1, [1, 0.5, 0, 1]];
    diag_log "[COMPANY] No payments found, added message to listbox";
} else {
    {
        _x params [
            ["_employeeUID", "", [""]],
            ["_employeeName", "", [""]],
            ["_amount", 0, [0]],
            ["_date", "", [""]]
        ];
        
        diag_log format ["[COMPANY] Processing payment entry - Employee: %1 (%2), Amount: $%3, Date: %4", 
            _employeeName, _employeeUID, [_amount] call life_fnc_numberText, _date];
        
        private _text = format ["%1 - $%2 - %3", 
            _employeeName,
            [_amount] call life_fnc_numberText,
            _date
        ];
        
        _listbox lbAdd _text;
        _listbox lbSetData [(lbSize _listbox) - 1, _employeeUID];
        _listbox lbSetColor [(lbSize _listbox) - 1, [1, 1, 1, 1]];
        
        diag_log format ["[COMPANY] Added payment entry to listbox: %1", _text];
    } forEach _paymentHistory;
    
    diag_log format ["[COMPANY] Added %1 payment entries to listbox", count _paymentHistory];
};

diag_log "=== life_fnc_updatePaymentHistoryList END ==="; 