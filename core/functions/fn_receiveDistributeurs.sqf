/*
    File: fn_receiveDistributeurs.sqf
    Description: Reçoit les données dynamiques des distributeurs depuis le serveur et les combine avec la configuration statique.
    Params: [_distributeursData]
*/
params [["_distributeursData", [], [[]]]];

diag_log format ["[DISTRIBUTEUR][CLIENT] fn_receiveDistributeurs appelé avec %1 entrées de données", count _distributeursData];

// Attendre un peu pour s'assurer que tout est chargé
sleep 1;

// Charger la configuration statique des distributeurs
if (isNil "life_distributeurs_config") then {
    diag_log "[DISTRIBUTEUR][CLIENT] Chargement de la configuration statique...";
    [] call compile preprocessFileLineNumbers "core\functions\fn_distributeursConfig.sqf";
};

if (_distributeursData isEqualTo []) then {
    diag_log "[DISTRIBUTEUR][CLIENT] Aucune donnée dynamique reçue du serveur";
    hint "Aucune donnée de distributeur disponible";
} else {
    diag_log format ["[DISTRIBUTEUR][CLIENT] Traitement de %1 entrées de données", count _distributeursData];
    
    // Créer un tableau associatif des données dynamiques par ID
    private _dataByID = [];
    {
        _x params ["_id", "_stock", "_stockMax", "_prix"];
        _dataByID set [_id, [_stock, _stockMax, _prix]];
        diag_log format ["[DISTRIBUTEUR][CLIENT] Données stockées pour ID %1", _id];
    } forEach _distributeursData;
    
    // Créer les objets distributeurs en combinant config statique et données dynamiques
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
        
        diag_log format ["[DISTRIBUTEUR][CLIENT] Création distributeur: %1 (ID: %2) à la position [%3, %4, %5]", _nom, _id, _posX, _posY, _posZ];
        
        // Récupérer les données dynamiques pour cet ID
        private _dynamicData = _dataByID select _id;
        private _stockJson = "{}";
        private _stockMaxJson = "{}";
        private _prixJson = "{}";
        
        if (!isNil "_dynamicData") then {
            _dynamicData params ["_stock", "_stockMax", "_prix"];
            _stockJson = _stock;
            _stockMaxJson = _stockMax;
            _prixJson = _prix;
            diag_log format ["[DISTRIBUTEUR][CLIENT] Données dynamiques trouvées pour ID %1", _id];
        } else {
            diag_log format ["[DISTRIBUTEUR][CLIENT] Aucune donnée dynamique pour ID %1, utilisation de valeurs par défaut", _id];
        };
        
        // Créer l'objet distributeur
        private _distributeur = "Land_Icebox_F" createVehicle [0,0,0];
        diag_log format ["[DISTRIBUTEUR][CLIENT] Objet créé: %1", _distributeur];
        
        _distributeur setPosATL [_posX, _posY, _posZ];
        diag_log format ["[DISTRIBUTEUR][CLIENT] Position définie: [%1, %2, %3]", _posX, _posY, _posZ];
        
        _distributeur setDir _dir;
        diag_log format ["[DISTRIBUTEUR][CLIENT] Direction définie: %1", _dir];
        
        _distributeur enableSimulation false;
        diag_log "[DISTRIBUTEUR][CLIENT] Simulation désactivée";
        
        // Stocker les données du distributeur
        _distributeur setVariable ["distributeur_id", _id, true];
        _distributeur setVariable ["distributeur_nom", _nom, true];
        _distributeur setVariable ["distributeur_stock", _stockJson, true];
        _distributeur setVariable ["distributeur_stock_max", _stockMaxJson, true];
        _distributeur setVariable ["distributeur_prix", _prixJson, true];
        _distributeur setVariable ["distributeur_zone", _zone, true];
        diag_log "[DISTRIBUTEUR][CLIENT] Variables définies";
        
        // Ajouter l'action pour ouvrir le distributeur
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
            "!dialog"
        ];
        diag_log "[DISTRIBUTEUR][CLIENT] Action ajoutée";
        
        diag_log format ["[DISTRIBUTEUR][CLIENT] Distributeur %1 créé avec succès", _nom];
        
    } forEach life_distributeurs_config;
    
    diag_log format ["[DISTRIBUTEUR][CLIENT] %1 distributeurs créés avec succès", count life_distributeurs_config];
    hint format ["%1 distributeurs chargés", count life_distributeurs_config];
    
    // Marquer que les distributeurs ont été créés
    life_distributeurs_created = true;
}; 