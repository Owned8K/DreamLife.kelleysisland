#include "..\..\..\script_macros.hpp"
/*
    Author: Owned8K
    Description: Reçoit les données de l'entreprise et les affiche dans le menu de gestion.
*/
params [
    ["_data", [], [[]]]
];

if (count _data < 6) exitWith {
    hint "Vous n'avez pas d'entreprise";
    closeDialog 0;
    life_company_loading = nil;
};

_data spawn {
    disableSerialization;
    params [
        ["_companyId", 0, [0]],
        ["_companyName", "", [""]],
        ["_ownerName", "", [""]],
        ["_ownerUID", "", [""]],
        ["_companyBank", 0, [0]],
        ["_employees", [], [[]]]
    ];

    // Stocker les données de l'entreprise
    life_company_data = _this;

    // Vérifier si le dialogue est toujours ouvert
    private _display = findDisplay 9800;
    if (isNull _display) exitWith {
        life_company_loading = nil;
    };

    // Mise à jour des informations de l'entreprise
    private _companyInfo = _display displayCtrl 9802;
    if (!isNull _companyInfo) then {
        private _info = format [
            "<t size='1.2' align='center'>%1</t><br/>" +
            "<t align='left' size='1'>Propriétaire: <t color='#FFA500'>%2</t></t><br/>" +
            "<t align='left' size='1'>Solde: <t color='#32CD32'>$%3</t></t><br/>" +
            "<t align='left' size='1'>Statut: <t color='#87CEEB'>%4</t></t>",
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
    if (!isNull _employeeList) then {
        lbClear _employeeList;
        
        if (count _employees == 0) then {
            private _index = _employeeList lbAdd "Aucun employé dans l'entreprise";
            _employeeList lbSetColor [_index, [1, 1, 1, 1]]; // Blanc
            _employeeList ctrlEnable false;
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
            _ctrl ctrlCommit 0;
        };
    } forEach [9805, 9806, 9807, 9808];

    // Fin du chargement
    life_company_loading = nil;
}; 