#include "..\..\script_macros.hpp"
/*
    Author: Create by Tonic modified By Owned8K for Dream Life

    Description:
    Verifies that the ticket was paid.
*/
params [
    ["_value",5,[0]],
    ["_unit",objNull,[objNull]],
    ["_cop",objNull,[objNull]]
];
if (isNull _unit || {!(_unit isEqualTo life_ticket_unit)}) exitWith {}; //NO
if (isNull _cop || {!(_cop isEqualTo player)}) exitWith {}; //Double NO

BANK = BANK + _value;
[1] call SOCK_fnc_updatePartial;
