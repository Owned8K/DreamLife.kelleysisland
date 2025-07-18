#include "..\..\script_macros.hpp"
/*
    Author: Create by Tonic modified By Owned8K for Dream Life

    Description:
    Detaches player(_unit) from the Escorter(player) and sets them back down.
*/

private _unit = player getVariable ["escortingPlayer",objNull];
if (isNull _unit) then {_unit = cursorTarget;}; //Emergency fallback.
if (isNull _unit) exitWith {}; //Target not found even after using cursorTarget.
if (!(_unit getVariable ["Escorting",false])) exitWith {}; //He's not being Escorted.
detach _unit;
_unit setVariable ["Escorting",false,true];
player setVariable ["isEscorting",false];
