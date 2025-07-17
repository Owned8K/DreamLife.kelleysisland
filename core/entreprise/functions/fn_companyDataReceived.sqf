#include "..\..\..\script_macros.hpp"
/*
    File: fn_companyDataReceived.sqf
    Author: Gemini
    Description: Reçoit les données de l'entreprise et les affiche dans le menu de gestion.
*/
params [
    ["_companyId", 0, [0]],
    ["_companyName", "", [""]],
    ["_ownerName", "", [""]],
    ["_ownerUID", "", [""]],
    ["_companyBank", 0, [0]]
];

if (_companyId isEqualTo 0) exitWith {
    hint localize "STR_Company_No_Company";
    closeDialog 0;
};

// Stocker les données de l'entreprise
life_company_data = [_companyId, _companyName, _ownerName, _ownerUID, _companyBank];

// Mettre à jour l'interface du menu de gestion
private _display = findDisplay 3800;
if (!isNull _display) then {
    private _companyInfo = _display displayCtrl 3802;
    
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
    
    _companyInfo ctrlSetStructuredText parseText _info;
}; 