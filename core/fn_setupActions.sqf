/*
    File: fn_setupActions.sqf
    Author:

    Description:
    Master addAction file handler for all client-based actions.
*/

diag_log "[SETUP ACTIONS] Starting setup...";

life_actions = [];

switch (playerSide) do {

    //Civilian
    case civilian: {
        diag_log "[SETUP ACTIONS] Setting up civilian actions...";
        
        //Drop fishing net
        life_actions pushBack (player addAction[localize "STR_pAct_DropFishingNet",life_fnc_dropFishingNet,"",0,false,false,"",'
        (surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && life_carryWeight < life_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !life_net_dropped ']);

        //Rob person
        life_actions pushBack (player addAction[localize "STR_pAct_RobPerson",life_fnc_robAction,"",0,false,false,"",'
        !isNull cursorObject && player distance cursorObject < 3.5 && isPlayer cursorObject && animationState cursorObject == "Incapacitated" && !(cursorObject getVariable ["robbed",false]) ']);
        
        //Company Menu
        life_actions pushBack (player addAction["<t color='#FF8C00'>Gestion d'Entreprise</t>",life_fnc_openCompanyMenu,"",0,false,false,"",'
        !dialog'
        ]);
        
        diag_log format["[SETUP ACTIONS] Number of actions added: %1", count life_actions];
        diag_log format["[SETUP ACTIONS] License check: %1", license_civ_logistician];
    };
    
    //Cops
    case west: { };
    
    //EMS
    case independent: { };

};

diag_log "[SETUP ACTIONS] Setup complete.";
