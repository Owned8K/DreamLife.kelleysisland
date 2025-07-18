#include "..\..\script_macros.hpp"
/*
    File: fn_p_openMenu.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Opens the players virtual inventory menu
*/
if (!alive player || dialog) exitWith {}; //Prevent them from opening this for exploits while dead.
createDialog "playerSettings";
disableSerialization;

switch (playerSide) do {
    case west: {
        ctrlShow[2011,false];
        ctrlShow[2015,false]; // Cacher le bouton d'entreprise pour la police
    };

    case civilian: {
        ctrlShow[2012,false];
    };

    case independent: {
        ctrlShow[2012,false];
        ctrlShow[2011,false];
        ctrlShow[2015,false]; // Cacher le bouton d'entreprise pour les médecins
    };
};

if (FETCH_CONST(life_adminlevel) < 1) then {
    ctrlShow[2021,false];
};

[] call life_fnc_p_updateMenu;

//Company Button
if (count (player getVariable ["company_data",[]]) > 0) then {
    _companyButton = _display displayCtrl YOUR_CONTROL_ID;
    _companyButton ctrlShow true;
    _companyButton ctrlSetText (localize "STR_PM_CompanyMenu");
    _companyButton buttonSetAction "[] call life_fnc_openCompanyMenu;";
} else {
    _companyButton = _display displayCtrl YOUR_CONTROL_ID;
    _companyButton ctrlShow false;
};
