#include "..\..\..\script_macros.hpp"
/*
    Author: Owned8K
    Description: Met à jour le panneau de détails en fonction du type d'entreprise sélectionné.
*/
disableSerialization;

params [
    ["_control", controlNull, [controlNull]],
    ["_index", -1, [0]]
];

if (isNull _control || _index == -1) exitWith {};

private _display = ctrlParent _control;
private _detailsText = _display displayCtrl 3702;
private _companyClass = _control lbData _index;
if (_companyClass == "") exitWith {};

private _description = M_CONFIG(getText, "CfgCompanies", _companyClass, "description");
private _price = M_CONFIG(getNumber, "CfgCompanies", _companyClass, "price");
private _priceText = [_price] call life_fnc_numberText;

_detailsText ctrlSetStructuredText parseText format[(localize _description), _priceText];