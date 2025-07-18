#include "..\..\..\script_macros.hpp"
/*
    Author: Owned8K
    Description: Reçoit les données de l'entreprise et les affiche dans le menu de gestion.
*/
params [
    ["_data", [], [[]]]
];

// Debug pour voir les données reçues
hint format ["Données reçues: %1", _data];
diag_log format ["[COMPANY DATA] Received: %1", _data];

if (count _data < 6) exitWith {
    diag_log "[COMPANY DATA] Invalid data received";
    hint "Vous n'avez pas d'entreprise";
    closeDialog 0;
};

_data params [
    ["_companyId", 0, [0]],
    ["_companyName", "", [""]],
    ["_ownerName", "", [""]],
    ["_ownerUID", "", [""]],
    ["_companyBank", 0, [0]],
    ["_employees", [], [[]]]
];

// Debug pour voir les données parsées
hint format ["ID: %1\nNom: %2\nPropriétaire: %3", _companyId, _companyName, _ownerName];

// Stocker les données de l'entreprise
life_company_data = _data;

// Attendre que le dialogue soit prêt
waitUntil {!isNull findDisplay 9800};
private _display = findDisplay 9800;

if (isNull _display) exitWith {
    hint "Erreur: Impossible de trouver le dialogue 9800";
};

// Mise à jour des informations de l'entreprise
private _companyInfo = _display displayCtrl 9802;
if (isNull _companyInfo) then {
    hint "Erreur: Impossible de trouver le contrôle 9802 (Info)";
} else {
    private _info = format [
        "<t size='1.5' align='center'>%1</t><br/><br/>" +
        "<t align='left' size='1.2'>Propriétaire: <t color='#FFA500'>%2</t></t><br/>" +
        "<t align='left' size='1.2'>Solde: <t color='#32CD32'>$%3</t></t><br/>" +
        "<t align='left' size='1.2'>Statut: <t color='#87CEEB'>%4</t></t>",
        _companyName,
        _ownerName,
        [_companyBank] call life_fnc_numberText,
        if (_ownerUID isEqualTo getPlayerUID player) then {
            "<t color='#FFD700'>Propriétaire</t>"
        } else {
            "<t color='#87CEEB'>Employé</t>"
        }
    ];

    _companyInfo ctrlSetStructuredText parseText _info;
    _companyInfo ctrlCommit 0;
};

// Mise à jour de la liste des employés
private _employeeList = _display displayCtrl 9804;
if (isNull _employeeList) then {
    hint "Erreur: Impossible de trouver le contrôle 9804 (Liste)";
} else {
    lbClear _employeeList;
    
    if (count _employees == 0) then {
        // Message si aucun employé
        private _noEmpInfo = _display displayCtrl 9802;
        _noEmpInfo ctrlSetStructuredText parseText "<t align='center' size='1.2'>Aucun employé dans l'entreprise</t>";
        _noEmpInfo ctrlCommit 0;
    } else {
        {
            _x params [
                ["_empUID", "", [""]],
                ["_empName", "", [""]],
                ["_empSalary", 0, [0]]
            ];
            
            private _index = _employeeList lbAdd format ["%1", _empName];
            _employeeList lbSetData [_index, str [_empUID, _empName, _empSalary]];
            _employeeList lbSetTextRight [_index, format ["$%1", [_empSalary] call life_fnc_numberText]];
            
            // Colorer différemment le propriétaire
            if (_empUID isEqualTo _ownerUID) then {
                _employeeList lbSetColor [_index, [1, 0.843, 0, 1]]; // Gold color
                _employeeList lbSetColorRight [_index, [1, 0.843, 0, 1]];
            };
        } forEach _employees;
    };
    _employeeList ctrlCommit 0;
};

// Activer/désactiver les boutons selon les permissions
private _isOwner = _ownerUID isEqualTo getPlayerUID player;
{
    private _ctrl = _display displayCtrl _x;
    if (!isNull _ctrl) then {
        _ctrl ctrlEnable _isOwner;
        if (!_isOwner) then {
            _ctrl ctrlSetTextColor [0.5, 0.5, 0.5, 1];
        };
    } else {
        hint format ["Erreur: Impossible de trouver le contrôle %1", _x];
    };
} forEach [9805, 9806, 9807, 9808]; 