#include "..\..\script_macros.hpp"
/*
    File: fn_loadGear.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Loads saved civilian gear, this is limited for a reason and that's balance.
*/
private _itemArray = life_gear;
waitUntil {!(isNull (findDisplay 46))};

[] call life_fnc_stripDownPlayer;

if (_itemArray isEqualTo []) exitWith {[] call life_fnc_startLoadout;};

_itemArray params [
    "_uniform",
    "_vest",
    "_backpack",
    "_goggles",
    "_headgear",
    ["_items",[]],
    "_prim",
    "_seco",
    ["_uItems",[]],
    ["_uMags",[]],
    ["_bItems",[]],
    ["_bMags",[]],
    ["_vItems",[]],
    ["_vMags",[]],
    ["_pItems",[]],
    ["_hItems",[]],
    ["_yItems",[]]
];

private "_handle";
if (!(_goggles isEqualTo "")) then {[_goggles,true,false,false,false] call life_fnc_handleItem;};
if (!(_headgear isEqualTo "")) then {[_headgear,true,false,false,false] call life_fnc_handleItem;};
if (!(_uniform isEqualTo "")) then {[_uniform,true,false,false,false] call life_fnc_handleItem;};
if (!(_vest isEqualTo "")) then {[_vest,true,false,false,false] call life_fnc_handleItem;};
if (!(_backpack isEqualTo "")) then {[_backpack,true,false,false,false] call life_fnc_handleItem;};

{[_x,true,false,false,false] call life_fnc_handleItem;} forEach _items;

{player addItemToUniform _x;} forEach (_uItems);
{(uniformContainer player) addItemCargoGlobal [_x,1];} forEach (_uMags);
{player addItemToVest _x;} forEach (_vItems);
{(vestContainer player) addItemCargoGlobal [_x,1];} forEach (_vMags);
{player addItemToBackpack _x;} forEach (_bItems);
{(backpackContainer player) addItemCargoGlobal [_x,1];} forEach (_bMags);

life_maxWeight = if (backpack player isEqualTo "") then {LIFE_SETTINGS(getNumber,"total_maxWeight")} else {LIFE_SETTINGS(getNumber,"total_maxWeight") + round(FETCH_CONFIG2(getNumber,"CfgVehicles",(backpack player),"maximumload") / 4)};
{
    [true,(_x select 0),(_x select 1)] call life_fnc_handleInv;
} forEach (_yItems);

//Primary & Secondary (Handgun) should be added last as magazines do not automatically load into the gun.
if (!(_prim isEqualTo "")) then {[_prim,true,false,false,false] call life_fnc_handleItem;};
if (!(_seco isEqualTo "")) then {[_seco,true,false,false,false] call life_fnc_handleItem;};

{
    if (!(_x isEqualTo "")) then {
        player addPrimaryWeaponItem _x;
    };
} forEach (_pItems);
{
    if (!(_x isEqualTo "")) then {
        player addHandgunItem _x;
    };
} forEach (_hItems);

[] call life_fnc_playerSkins;
