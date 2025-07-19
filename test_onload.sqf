/*
    Test pour vérifier que l'onLoad du dialogue fonctionne
    À exécuter côté client
*/

diag_log "=== TEST ONLOAD DIALOGUE ===";

// Vérifier les données d'entreprise
if (count life_company_data < 6) exitWith {
    diag_log "ERREUR: Données d'entreprise insuffisantes";
    hint "Données d'entreprise insuffisantes";
};

diag_log format ["Données d'entreprise: %1", life_company_data];

// Ouvrir le menu d'entreprise
diag_log "--- Ouverture du menu d'entreprise ---";
[] call life_fnc_openCompanyMenu;

// Attendre un peu et vérifier
[] spawn {
    sleep 1;
    
    diag_log "--- Vérification après 1 seconde ---";
    
    private _display = findDisplay 9800;
    if (isNull _display) then {
        diag_log "ERREUR: Dialogue 9800 non trouvé";
    } else {
        diag_log "SUCCÈS: Dialogue 9800 trouvé";
        
        // Vérifier la combobox des employés
        private _combo = _display displayCtrl 9813;
        if (isNull _combo) then {
            diag_log "ERREUR: Combobox 9813 non trouvée";
        } else {
            diag_log format ["Combobox employés - Taille: %1", lbSize _combo];
            for "_i" from 0 to (lbSize _combo - 1) do {
                diag_log format ["  [%1] %2", _i, _combo lbText _i];
            };
        };
        
        // Vérifier la listbox des paiements
        private _listbox = _display displayCtrl 9815;
        if (isNull _listbox) then {
            diag_log "ERREUR: Listbox 9815 non trouvée";
        } else {
            diag_log format ["Listbox paiements - Taille: %1", lbSize _listbox];
            for "_i" from 0 to (lbSize _listbox - 1) do {
                diag_log format ["  [%1] %2", _i, _listbox lbText _i];
            };
        };
    };
    
    sleep 2;
    
    diag_log "--- Vérification après 3 secondes ---";
    
    if (!isNull _display) then {
        private _combo = _display displayCtrl 9813;
        private _listbox = _display displayCtrl 9815;
        
        if (!isNull _combo) then {
            diag_log format ["Combobox employés finale - Taille: %1", lbSize _combo];
            for "_i" from 0 to (lbSize _combo - 1) do {
                diag_log format ["  [%1] %2", _i, _combo lbText _i];
            };
        };
        
        if (!isNull _listbox) then {
            diag_log format ["Listbox paiements finale - Taille: %1", lbSize _listbox];
            for "_i" from 0 to (lbSize _listbox - 1) do {
                diag_log format ["  [%1] %2", _i, _listbox lbText _i];
            };
        };
    };
};

diag_log "=== TEST ONLOAD TERMINÉ ==="; 