/*
    File: fn_addDistributeurActions.sqf
    Description: Ajoute les actions aux distributeurs côté client si nécessaire
    Author: DreamLife
*/

diag_log "[DISTRIBUTEUR][CLIENT] Vérification des actions sur les distributeurs...";

// Trouver tous les distributeurs
private _distributeurs = allMissionObjects "Land_Icebox_F";
private _actionsAdded = 0;

{
    private _distributeur = _x;
    private _id = _distributeur getVariable ["distributeur_id", -1];
    private _nom = _distributeur getVariable ["distributeur_nom", "Inconnu"];
    
    if (_id != -1) then {
        // Vérifier si les actions sont déjà présentes
        private _actions = actionIDs _distributeur;
        private _hasAction = false;
        
        {
            private _actionText = _distributeur actionParams [_x, 0];
            if (_actionText find "Utiliser le Distributeur" != -1) then {
                _hasAction = true;
            };
        } forEach _actions;
        
        if (!_hasAction) then {
            diag_log format ["[DISTRIBUTEUR][CLIENT] Ajout d'action pour %1", _nom];
            
            // Ajouter l'action côté client
            _distributeur addAction [
                "<t color='#FFD700'>Utiliser le Distributeur</t>",
                {
                    params ["_target"];
                    [_target] call life_fnc_openDistributeur;
                },
                nil,
                1.5,
                true,
                true,
                "",
                "true"
            ];
            
            _actionsAdded = _actionsAdded + 1;
        } else {
            diag_log format ["[DISTRIBUTEUR][CLIENT] Actions déjà présentes pour %1", _nom];
        };
    };
} forEach _distributeurs;

diag_log format ["[DISTRIBUTEUR][CLIENT] %1 actions ajoutées", _actionsAdded];
hint format ["%1 actions de distributeur ajoutées", _actionsAdded]; 