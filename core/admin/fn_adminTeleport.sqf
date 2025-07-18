#include "..\..\script_macros.hpp"
/*
    Author: Create by Tonic modified By Owned8K for Dream Life
    
    Description:
    Teleport to chosen position.
*/
if (FETCH_CONST(life_adminlevel) < 3) exitWith {closeDialog 0;};

closeDialog 0;

openMap [true, false];
onMapSingleClick "[_pos select 0, _pos select 1, _pos select 2] call life_fnc_teleport";