/*
    File: fn_setupActions.sqf
    Author:

    Description:
    Master addAction file handler for all client-based actions.
*/

life_actions = [];

switch (playerSide) do {

    //Civilian
    case civilian: {
        //Drop fishing net
        life_actions pushBack (player addAction[localize "STR_pAct_DropFishingNet",life_fnc_dropFishingNet,"",0,false,false,"",'
        (surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && life_carryWeight < life_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !life_net_dropped ']);

        //Rob person
        life_actions pushBack (player addAction[localize "STR_pAct_RobPerson",life_fnc_robAction,"",0,false,false,"",'
        !isNull cursorObject && player distance cursorObject < 3.5 && isPlayer cursorObject && animationState cursorObject == "Incapacitated" && !(cursorObject getVariable ["robbed",false]) ']);
        
        //Company Menu
        life_actions pushBack (player addAction[localize "STR_PM_OpenCompany",life_fnc_openCompanyMenu,"",0,false,false,"",'
        !dialog && 
        {
            private _hasLicense = false;
            {
                if (_x select 1 isEqualTo "civ" && {[_x select 0] call life_fnc_hasCompanyLicense}) exitWith {
                    _hasLicense = true;
                };
            } forEach (getArray(missionConfigFile >> "Licenses" >> "companies"));
            _hasLicense
        }
        ']);
    };
    
    //Cops
    case west: { };
    
    //EMS
    case independent: { };

};
