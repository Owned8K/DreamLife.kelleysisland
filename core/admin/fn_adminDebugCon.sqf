#include "..\..\script_macros.hpp"
/*
    Author: Create by Tonic modified By Owned8K for Dream Life

    Description:
    Opens the Debug Console.
*/
if (FETCH_CONST(life_adminlevel) < 5) exitWith {closeDialog 0; hint localize "STR_NOTF_adminDebugCon";};
life_admin_debug = true;

createDialog "RscDisplayDebugPublic";
[0,format [localize "STR_NOTF_adminHasOpenedDebug",profileName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
