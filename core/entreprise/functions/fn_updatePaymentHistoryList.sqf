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

private ["_display", "_listbox"];

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

// Vider la listbox
lbClear _listbox;

// Si aucun paiement
if (count _payments == 0) exitWith {
    _listbox lbAdd "Aucun paiement effectué";
    diag_log "[COMPANY] No payments found";
};

// Ajouter chaque paiement à la liste
{
    _x params [
        ["_name", "", [""]],
        ["_amount", 0, [0]],
        ["_date", "", [""]]
    ];
    
    // Formater la date pour un meilleur affichage
    private _formattedDate = _date select [0, 16]; // Prend seulement la date et l'heure (YYYY-MM-DD HH:MM)
    
    private _displayText = format ["%1 - %2 - $%3", _formattedDate, _name, [_amount] call life_fnc_numberText];
    private _index = _listbox lbAdd _displayText;
    
    // Colorer en vert les montants positifs
    _listbox lbSetColor [_index, [0, 1, 0, 1]];
    
    diag_log format ["[COMPANY] Added payment to list: %1", _displayText];
} forEach _payments;

// Sélectionner le premier élément
if (lbSize _listbox > 0) then {
    _listbox lbSetCurSel 0;
}; 