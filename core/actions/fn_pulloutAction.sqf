#include "..\..\script_macros.hpp"
/*
    Author: Create by Tonic modified By Owned8K for Dream Life

    Description:
    Pulls civilians out of a car if it's stopped.
*/
private ["_crew"];
_crew = crew cursorObject;

{
    if !(side _x isEqualTo west) then {
        _x setVariable ["transporting",false,true]; _x setVariable ["Escorting",false,true];
        [_x] remoteExecCall ["life_fnc_pulloutVeh",_x];
    };
} forEach _crew;
