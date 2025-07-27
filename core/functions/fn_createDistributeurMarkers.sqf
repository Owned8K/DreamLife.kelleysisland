/*
    File: fn_createDistributeurMarkers.sqf
    Description: Crée les marqueurs des distributeurs sur la carte pour le client.
    Author: DreamLife
*/

diag_log "[DISTRIBUTEUR][CLIENT] Création des marqueurs sur la carte...";

// Attendre que les objets soient synchronisés
sleep 3;

// Trouver tous les objets distributeurs sur la carte
private _distributeurs = allMissionObjects "Land_Icebox_F";
private _distributeurCount = 0;

{
    private _distributeur = _x;
    private _id = _distributeur getVariable ["distributeur_id", -1];
    
    if (_id != -1) then {
        private _nom = _distributeur getVariable ["distributeur_nom", "Distributeur"];
        private _pos = getPosATL _distributeur;
        
        // Créer le nom du marqueur
        private _markerName = format ["distributeur_%1", _id];
        
        // Créer le marqueur
        private _marker = createMarker [_markerName, _pos];
        _marker setMarkerType "mil_dot";
        _marker setMarkerText _nom;
        _marker setMarkerColor "ColorOrange";
        _marker setMarkerSize [1.0, 1.0];
        _marker setMarkerBrush "Solid";
        
        diag_log format ["[DISTRIBUTEUR][CLIENT] Marqueur créé: %1 pour %2", _markerName, _nom];
        _distributeurCount = _distributeurCount + 1;
    };
} forEach _distributeurs;

diag_log format ["[DISTRIBUTEUR][CLIENT] %1 marqueurs créés avec succès", _distributeurCount];
hint format ["%1 distributeurs trouvés sur la carte", _distributeurCount]; 