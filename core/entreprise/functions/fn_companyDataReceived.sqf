#include "..\..\..\script_macros.hpp"
/*
    File: fn_companyDataReceived.sqf
    Author: Gemini
    Description: Reçoit les données de l'entreprise et les affiche dans le menu de gestion.
*/
params [
    ["_data", [], [[]]]
];

diag_log format ["[COMPANY DATA] Received: %1", _data];

if (count _data < 6) exitWith {
    diag_log "[COMPANY DATA] Invalid data received";
    hint localize "STR_Company_No_Company";
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
        if (!isNull _display) then {
            diag_log "[COMPANY DATA] Display found, updating info";
            
            // Mise à jour des informations de l'entreprise
            private _companyInfo = _display displayCtrl 9802;
            private _info = format [
                "<t size='1.5' align='center'>%1</t><br/><br/>" +
                "<t align='left'>%2: %3</t><br/>" +
                "<t align='left'>%4: $%5</t><br/>" +
                "<t align='left'>%6: %7</t>",
                _companyName,
                localize "STR_Company_Owner",
                _ownerName,
                localize "STR_Company_Balance",
                [_companyBank] call life_fnc_numberText,
                localize "STR_Company_Status",
                if (_ownerUID isEqualTo getPlayerUID player) then {localize "STR_Company_Owner"} else {localize "STR_Company_Employee"}
            ];
            
            _companyInfo ctrlSetStructuredText parseText _info;
            
            // Mise à jour de la liste des employés
            private _employeeList = _display displayCtrl 9804;
            lbClear _employeeList;
            
            {
                _x params [
                    ["_empUID", "", [""]],
                    ["_empName", "", [""]],
                    ["_empSalary", 0, [0]]
                ];
                
                private _index = _employeeList lbAdd format ["%1 - $%2", _empName, [_empSalary] call life_fnc_numberText];
                _employeeList lbSetData [_index, str [_empUID, _empName, _empSalary]];
            } forEach _employees;
            
            // Activer/désactiver les boutons selon les permissions
            private _isOwner = _ownerUID isEqualTo getPlayerUID player;
            {
                private _ctrl = _display displayCtrl _x;
                _ctrl ctrlEnable _isOwner;
            } forEach [9805, 9806, 9807, 9808]; // HireButton, FireButton, SalaryEdit, SetSalaryButton
            
            true
        } else {
            diag_log "[COMPANY DATA] Display not found!";
            false
        };
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
    };
}; 