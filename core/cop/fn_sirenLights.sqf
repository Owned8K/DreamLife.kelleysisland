#include "..\..\script_macros.hpp"
/*
    Author: Create by Tonic modified By Owned8K for Dream Life

    Description:
    Lets play a game! Can you guess what it does? I have faith in you, if you can't
    then you have failed me and therefor I lose all faith in humanity.. No pressure.
*/
params [
    ["_vehicle",objNull,[objNull]]
];
if (isNull _vehicle) exitWith {}; //Bad entry!
if !(typeOf _vehicle in ["C_Offroad_01_F","B_MRAP_01_F","C_SUV_01_F","C_Hatchback_01_sport_F","B_Heli_Light_01_F","B_Heli_Transport_01_F"]) exitWith {}; //Last chance check to prevent something from defying humanity and creating a monster.

private _trueorfalse = _vehicle getVariable ["lights",false];

if (_trueorfalse) then {
    _vehicle setVariable ["lights",false,true];
    if !(isNil {(_vehicle getVariable "lightsJIP")}) then {
        private _jip = _vehicle getVariable "lightsJIP";
        _vehicle setVariable ["lightsJIP",nil,true];
        remoteExec ["",_jip]; //remove from JIP queue
    };
} else {
    _vehicle setVariable ["lights",true,true];
    private _jip = [_vehicle,0.22] remoteExec ["life_fnc_copLights",RCLIENT,true];
    _vehicle setVariable ["lightsJIP",_jip,true];
};
