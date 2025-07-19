#include "..\..\..\script_macros.hpp"
/*
    File: fn_updatePaymentHistoryList.sqf
    Author: Your Name
    
    Description:
    Met à jour la liste des paiements avec les données reçues du serveur
*/

params [
    ["_payments", [], [[]]]
];

disableSerialization;

diag_log format ["[COMPANY] Received %1 payments to display", count _payments];
diag_log format ["[COMPANY] Raw payments data: %1", _payments];

// Récupérer l'interface et la listbox
private _display = findDisplay 9800;
if (isNull _display) exitWith {
    diag_log "[COMPANY] ERROR: Display 9800 not found";
    hint "Erreur: Interface non trouvée";
};

private _listbox = _display displayCtrl 9815;
if (isNull _listbox) exitWith {
    diag_log "[COMPANY] ERROR: Control 9815 (PaymentHistoryList) not found";
    hint "Erreur: Liste des paiements non trouvée";
};

// Vider la listbox
lbClear _listbox;

// Si aucun paiement
if (_payments isEqualTo []) exitWith {
    _listbox lbAdd "Aucun paiement effectué";
    _listbox lbSetColor [(lbSize _listbox) - 1, [1, 1, 1, 1]];
    diag_log "[COMPANY] No payments to display";
};

{
    _x params [
        ["_name", "", [""]],
        ["_amount", 0, [0]],
        ["_date", "", [""]]
    ];
    
    if (_name != "" && _amount != 0) then {
        private _displayText = format ["%1 - %2 - $%3", _date, _name, [_amount] call life_fnc_numberText];
        private _index = _listbox lbAdd _displayText;
        
        // Stocker les données pour référence
        _listbox lbSetData [_index, format ["%1|%2|%3", _name, _amount, _date]];
        
        // Colorer en vert
        _listbox lbSetColor [_index, [0, 1, 0, 1]];
        
        diag_log format ["[COMPANY] Added payment to list: %1", _displayText];
    } else {
        diag_log format ["[COMPANY] Skipped invalid payment data: Name='%1', Amount=%2, Date='%3'", _name, _amount, _date];
    };
} forEach _payments;

// Sélectionner le premier élément
if (lbSize _listbox > 0) then {
    _listbox lbSetCurSel 0;
    diag_log format ["[COMPANY] Payment list populated with %1 items", lbSize _listbox];
} else {
    diag_log "[COMPANY] WARNING: No valid payments were added to the list";
    _listbox lbAdd "Aucun paiement valide trouvé";
    _listbox lbSetColor [(lbSize _listbox) - 1, [1, 0, 0, 1]];
}; 