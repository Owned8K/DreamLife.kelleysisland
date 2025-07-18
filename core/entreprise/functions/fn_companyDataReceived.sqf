#include "..\..\..\script_macros.hpp"
/*
    Author: Owned8K
    Description: Reçoit les données de l'entreprise et les affiche dans le menu de gestion.
*/
params [
    ["_data", [], [[]]]
];

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

diag_log format ["[COMPANY DATA] Parsed data - ID: %1, Name: %2, Owner: %3", _companyId, _companyName, _ownerName];

// Stocker les données de l'entreprise
life_company_data = _data;

// Essayer de mettre à jour l'interface plusieurs fois si nécessaire
[_companyName, _ownerName, _ownerUID, _companyBank, _employees] spawn {
    params ["_companyName", "_ownerName", "_ownerUID", "_companyBank", "_employees"];
    
    private _fnc_updateDisplay = {
        private _display = findDisplay 9800;
        if (isNull _display) exitWith {
            diag_log "[COMPANY DATA] Display 9800 not found!";
            false
        };
        diag_log "[COMPANY DATA] Display 9800 found";

        // Vérifier tous les contrôles
        private _companyInfo = _display displayCtrl 9802;
        if (isNull _companyInfo) exitWith {
            diag_log "[COMPANY DATA] Control 9802 (CompanyInfo) not found!";
            false
        };
        diag_log "[COMPANY DATA] Control 9802 (CompanyInfo) found";

        private _employeeList = _display displayCtrl 9804;
        if (isNull _employeeList) exitWith {
            diag_log "[COMPANY DATA] Control 9804 (EmployeeList) not found!";
            false
        };
        diag_log "[COMPANY DATA] Control 9804 (EmployeeList) found";

        // Test d'affichage simple
        _companyInfo ctrlSetStructuredText parseText "Test d'affichage...";
        _companyInfo ctrlCommit 0;
        diag_log "[COMPANY DATA] Set test text to CompanyInfo";

        // Mise à jour des informations de l'entreprise
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
        diag_log "[COMPANY DATA] Set company info text";
        
        // Mise à jour de la liste des employés
        lbClear _employeeList;
        diag_log format ["[COMPANY DATA] Updating employee list with %1 employees", count _employees];
        
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
            diag_log format ["[COMPANY DATA] Added employee: %1", _empName];
        } forEach _employees;
        
        _employeeList ctrlCommit 0;
        
        // Activer/désactiver les boutons selon les permissions
        private _isOwner = _ownerUID isEqualTo getPlayerUID player;
        {
            private _ctrl = _display displayCtrl _x;
            if (!isNull _ctrl) then {
                _ctrl ctrlEnable _isOwner;
                if (!_isOwner) then {
                    _ctrl ctrlSetTextColor [0.5, 0.5, 0.5, 1];
                };
                diag_log format ["[COMPANY DATA] Set control %1 enabled: %2", _x, _isOwner];
            } else {
                diag_log format ["[COMPANY DATA] Control %1 not found!", _x];
            };
        } forEach [9805, 9806, 9807, 9808];
        
        true
    };

    private _attempts = 0;
    private _maxAttempts = 10;
    private _updated = false;
    
    while {_attempts < _maxAttempts && !_updated} do {
        _updated = [] call _fnc_updateDisplay;
        if (!_updated) then {
            _attempts = _attempts + 1;
            diag_log format ["[COMPANY DATA] Update attempt %1 failed, waiting...", _attempts];
            sleep 0.1;
        };
    };
    
    if (!_updated) then {
        diag_log "[COMPANY DATA] Failed to update display after all attempts";
        hint "Erreur lors de la mise à jour de l'interface";
    } else {
        diag_log "[COMPANY DATA] Successfully updated display";
    };
}; 