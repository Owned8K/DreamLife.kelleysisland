#include "..\..\..\script_macros.hpp"
/*
    File: fn_initLicenseVendors.sqf
    Author: Owned8K
    
    Description:
    Initialise les vendeurs de licences
*/

{
    if ((_x getVariable ["license_vendor", ""]) != "") then {
        private _license = _x getVariable "license_vendor";
        private _price = getNumber(missionConfigFile >> "Licenses" >> _license >> "price");
        [_x, _license, _price] call life_fnc_addLicenseAction;
    };
} forEach allUnits; 