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

if (count _data != 5) exitWith {
    diag_log "[COMPANY DATA] Invalid data received";
    hint localize "STR_Company_No_Company";
    closeDialog 0;
};

_data params [
    ["_companyId", 0, [0]],
    ["_companyName", "", [""]],
    ["_ownerName", "", [""]],
    ["_ownerUID", "", [""]],
    ["_companyBank", 0, [0]]
];

diag_log format ["[COMPANY DATA] Parsed data - ID: %1, Name: %2, Owner: %3", _companyId, _companyName, _ownerName];

// Stocker les données de l'entreprise
life_company_data = _data;

// Mettre à jour l'interface du menu de gestion
private _display = findDisplay 9800;
if (!isNull _display) then {
    diag_log "[COMPANY DATA] Display found, updating info";
    private _companyInfo = _display displayCtrl 9802;
    
    // Formater les informations de l'entreprise
    private _info = format [
        "<t size='1.2' align='center'><b>%1</b></t><br/><br/>" +
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
    
    diag_log format ["[COMPANY DATA] Setting info: %1", _info];
    _companyInfo ctrlSetStructuredText parseText _info;
} else {
    diag_log "[COMPANY DATA] Display not found!";
}; 