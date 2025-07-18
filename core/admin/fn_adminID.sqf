/*
    Author: Create by Tonic modified By Owned8K for Dream Life

    Description:
    Output information received to admin menu.
*/
private ["_display","_ret","_text"];
disableSerialization;
_ret = _this select 0;
_display = findDisplay 2900;
_text = _display displayCtrl 2903;

_text ctrlSetStructuredText parseText format ["ID: %1",_ret];