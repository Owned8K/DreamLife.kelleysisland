#include "..\..\script_macros.hpp"
/*
    Author: Create by Tonic modified By Owned8K for Dream Life

    Description:
    Returns the licenses to the cop.
*/
private ["_cop","_licenses","_licensesConfigs"];
_cop = param [0,objNull,[objNull]];
if (isNull _cop) exitWith {}; //Bad entry

_licenses = "";

//Config entries for licenses that are civilian
_licensesConfigs = "getText(_x >> 'side') isEqualTo 'civ'" configClasses (missionConfigFile >> "Licenses");

{
    if (LICENSE_VALUE(configName _x,"civ")) then {
        _licenses = _licenses + localize getText(_x >> "displayName") + "<br/>";
    };
} forEach _licensesConfigs;

if (_licenses isEqualTo "") then {_licenses = (localize "STR_Cop_NoLicensesFound");};
[profileName,_licenses] remoteExecCall ["life_fnc_licensesRead",_cop];
