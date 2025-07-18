#include "..\..\script_macros.hpp"
/*
    Author: Create by Tonic modified By Owned8K for Dream Life

    Description:
    Called when purchasing a license. May need to be revised.
*/
private ["_type","_varName","_displayName","_sideFlag","_price","_varConfig"];
_type = _this select 3;

if (!isClass (missionConfigFile >> "Licenses" >> _type)) exitWith {}; //Bad entry?
_displayName = M_CONFIG(getText,"Licenses",_type,"displayName");
_price = M_CONFIG(getNumber,"Licenses",_type,"price");
_sideFlag = M_CONFIG(getText,"Licenses",_type,"side");
_varConfig = M_CONFIG(getText,"Licenses",_type,"variable");

// Construction du nom de variable de licence en utilisant la variable du fichier de configuration
_varName = format ["license_%1_%2", _sideFlag, _varConfig];

if (CASH < _price) exitWith {hint format [localize "STR_NOTF_NE_1",[_price] call life_fnc_numberText,localize _displayName];};
CASH = CASH - _price;

// Set the license
missionNamespace setVariable [_varName,true];

titleText[format [localize "STR_NOTF_B_1", localize _displayName,[_price] call life_fnc_numberText],"PLAIN"];

// Save both money and licenses
[0] call SOCK_fnc_updatePartial; // Save money
[2] call SOCK_fnc_updatePartial; // Save licenses

// Update license display
[] call life_fnc_updateLicenseList;

diag_log format ["[LICENSE] Bought license %1 (%2) for %3", _type, _varName, _price];
