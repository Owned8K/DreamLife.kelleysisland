#include "..\..\script_macros.hpp"
/*
    File: fn_updateLicenseList.sqf
    Author: Your Name
    
    Description:
    Updates the license list in the player menu
*/

private ["_licenses","_side"];
_side = switch (playerSide) do {case west:{"cop"}; case civilian:{"civ"}; case independent:{"med"}; default {""}};
if (_side isEqualTo "") exitWith {};

_licenses = "";

{
    if (isClass (missionConfigFile >> "Licenses" >> configName _x)) then {
        _varName = getText(_x >> "variable");
        _sideFlag = getText(_x >> "side");
        
        if (_sideFlag isEqualTo _side) then {
            _varFull = format ["license_%1_%2", _sideFlag, _varName];
            _value = missionNamespace getVariable [_varFull, false];
            
            if (_value) then {
                _displayName = getText(_x >> "displayName");
                _licenses = _licenses + format ["%1<br/>", localize _displayName];
                diag_log format ["[LICENSE_DISPLAY] Found active license: %1 (%2)", _displayName, _varFull];
            };
        };
    };
} forEach ("true" configClasses (missionConfigFile >> "Licenses"));

player setVariable ["licenses_display", _licenses, true];
diag_log format ["[LICENSE_DISPLAY] Updated license display: %1", _licenses]; 