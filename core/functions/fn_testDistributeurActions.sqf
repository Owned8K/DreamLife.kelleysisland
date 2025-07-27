/*
    File: fn_testDistributeurActions.sqf
    Description: Test des actions disponibles sur les distributeurs
    Author: DreamLife
*/

diag_log "[DISTRIBUTEUR][TEST] Début du test des actions...";

// Trouver tous les distributeurs
private _distributeurs = allMissionObjects "Land_Icebox_F";
diag_log format ["[DISTRIBUTEUR][TEST] %1 objets Land_Icebox_F trouvés", count _distributeurs];

{
    private _distributeur = _x;
    private _id = _distributeur getVariable ["distributeur_id", -1];
    private _nom = _distributeur getVariable ["distributeur_nom", "Inconnu"];
    
    if (_id != -1) then {
        diag_log format ["[DISTRIBUTEUR][TEST] Distributeur: %1 (ID: %2)", _nom, _id];
        
        // Vérifier les actions
        private _actions = actionIDs _distributeur;
        diag_log format ["[DISTRIBUTEUR][TEST] Actions trouvées: %1", _actions];
        
        // Afficher les détails de chaque action
        {
            private _actionIndex = _x;
            private _actionText = _distributeur actionParams [_actionIndex, 0];
            diag_log format ["[DISTRIBUTEUR][TEST] Action %1: %2", _actionIndex, _actionText];
        } forEach _actions;
        
        // Distance au joueur
        private _distance = player distance _distributeur;
        diag_log format ["[DISTRIBUTEUR][TEST] Distance au joueur: %1m", _distance];
        
    };
} forEach _distributeurs;

// Test d'ouverture directe
if (count _distributeurs > 0) then {
    private _firstDistributeur = _distributeurs select 0;
    private _id = _firstDistributeur getVariable ["distributeur_id", -1];
    
    if (_id != -1) then {
        diag_log "[DISTRIBUTEUR][TEST] Test d'ouverture directe...";
        [_firstDistributeur] call life_fnc_openDistributeur;
    };
};

hint "Test des distributeurs terminé - voir les logs"; 