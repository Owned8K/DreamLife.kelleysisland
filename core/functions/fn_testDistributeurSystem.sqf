/*
    File: fn_testDistributeurSystem.sqf
    Description: Test du système de distributeur automatique
    Author: DreamLife
*/

diag_log "[DISTRIBUTEUR][TEST] Début du test du système...";

// Test 1: Vérifier les distributeurs sur la carte
private _distributeurs = allMissionObjects "Land_Icebox_F";
diag_log format ["[DISTRIBUTEUR][TEST] %1 distributeurs trouvés sur la carte", count _distributeurs];

{
    private _distributeur = _x;
    private _id = _distributeur getVariable ["distributeur_id", -1];
    private _nom = _distributeur getVariable ["distributeur_nom", "Inconnu"];
    
    if (_id != -1) then {
        diag_log format ["[DISTRIBUTEUR][TEST] Distributeur: %1 (ID: %2)", _nom, _id];
        
        // Vérifier les variables
        private _stock = _distributeur getVariable ["distributeur_stock", "{}"];
        private _prix = _distributeur getVariable ["distributeur_prix", "{}"];
        
        diag_log format ["[DISTRIBUTEUR][TEST] Stock: %1", _stock];
        diag_log format ["[DISTRIBUTEUR][TEST] Prix: %1", _prix];
        
        // Vérifier les actions
        private _actions = actionIDs _distributeur;
        diag_log format ["[DISTRIBUTEUR][TEST] Actions: %1", _actions];
    };
} forEach _distributeurs;

// Test 2: Vérifier les fonctions utilitaires
private _testDistributeur = _distributeurs select 0;
if (!isNull _testDistributeur) then {
    private _redgullStock = [_testDistributeur, "redgull"] call life_fnc_getDistributeurStock;
    private _redgullPrice = [_testDistributeur, "redgull"] call life_fnc_getDistributeurPrice;
    
    diag_log format ["[DISTRIBUTEUR][TEST] RedBull stock: %1, prix: %2", _redgullStock, _redgullPrice];
};

// Test 3: Vérifier l'argent du joueur
diag_log format ["[DISTRIBUTEUR][TEST] Argent du joueur: %1€", life_cash];

// Test 4: Vérifier l'inventaire
diag_log format ["[DISTRIBUTEUR][TEST] Poids actuel: %1/%2", life_carryWeight, life_maxWeight];

hint "Test du système de distributeur terminé - voir les logs";
diag_log "[DISTRIBUTEUR][TEST] Test terminé"; 