/*
    File: fn_distributeursConfig.sqf
    Description: Configuration des positions des distributeurs automatiques
    Author: DreamLife
*/

// Configuration des distributeurs
// Format: [ID, Nom, PosX, PosY, PosZ, Direction, Zone]
life_distributeurs_config = [
    [1, "Distributeur Hopital Nord Ouest", 965.99, 5106.63, 0.00143909, 180, "Hopital"],
    [2, "Distributeur Super marché sud ouest", 790.683, 3489.36, 0.00143814, 90, "Marché"],
    [3, "Distributeur Super marché Union", 3591.03, 3198.15, 0.00143909, 270, "Marché"],
    [4, "Distributeur Super marché JamesTown", 1406.86, 1786.07, 0.00144005, 0, "Marché"],
    [5, "Distributeur Super marché GateWood", 2365.57, 944.141, 0.00143814, 180, "Marché"],
    [6, "Distributeur Perrytonia", 4814.51, 2193.55, 0.00143909, 180, "Perrytonia"],
    [7, "Distributeur WaterGates", 7375.8, 3584.2, 0.00143909, 180, "WaterGates"],
    [8, "Distributeur FallsChurch", 5403.13, 4300.23, 0.00143814, 180, "FallsChurch"],
    [9, "Distributeur LakeSide", 2043.23, 6098.04, 0.00144005, 180, "LakeSide"]
];

// Fonction pour récupérer la configuration d'un distributeur par ID
life_fnc_getDistributeurConfig = {
    params ["_id"];
    
    {
        if ((_x select 0) == _id) exitWith {_x};
    } forEach life_distributeurs_config;
};

// Fonction pour récupérer tous les IDs des distributeurs
life_fnc_getAllDistributeurIDs = {
    private _ids = [];
    {
        _ids pushBack (_x select 0);
    } forEach life_distributeurs_config;
    _ids
};

// Fonction pour créer les marqueurs sur la carte
life_fnc_createDistributeurMarkers = {
    diag_log "[DISTRIBUTEUR][MARKERS] Création des marqueurs sur la carte...";
    
    {
        _x params [
            "_id",
            "_nom", 
            "_posX",
            "_posY", 
            "_posZ",
            "_dir",
            "_zone"
        ];
        
        // Créer le nom du marqueur
        private _markerName = format ["distributeur_%1", _id];
        
        // Créer le marqueur
        private _marker = createMarker [_markerName, [_posX, _posY]];
        _marker setMarkerType "mil_dot";
        _marker setMarkerText _nom;
        _marker setMarkerColor "ColorOrange";
        _marker setMarkerSize [1.0, 1.0];
        _marker setMarkerBrush "Solid";
        
        diag_log format ["[DISTRIBUTEUR][MARKERS] Marqueur créé: %1 pour %2", _markerName, _nom];
        
    } forEach life_distributeurs_config;
    
    diag_log format ["[DISTRIBUTEUR][MARKERS] %1 marqueurs créés avec succès", count life_distributeurs_config];
};

// Fonction pour supprimer tous les marqueurs de distributeurs
life_fnc_removeDistributeurMarkers = {
    diag_log "[DISTRIBUTEUR][MARKERS] Suppression des marqueurs...";
    
    {
        _x params ["_id", "_nom", "_posX", "_posY", "_posZ", "_dir", "_zone"];
        private _markerName = format ["distributeur_%1", _id];
        deleteMarker _markerName;
        diag_log format ["[DISTRIBUTEUR][MARKERS] Marqueur supprimé: %1", _markerName];
    } forEach life_distributeurs_config;
    
    diag_log "[DISTRIBUTEUR][MARKERS] Tous les marqueurs supprimés";
};

// Créer automatiquement les marqueurs au chargement
[] call life_fnc_createDistributeurMarkers; 