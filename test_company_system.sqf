/*
    Script de test pour le système d'entreprise
    À exécuter côté serveur pour tester les fonctions
*/

// Test 1: Vérifier la récupération des données d'entreprise
diag_log "=== TEST 1: Récupération des données d'entreprise ===";
{
    if (isPlayer _x) then {
        diag_log format ["Test pour le joueur: %1 (UID: %2)", name _x, getPlayerUID _x];
        [_x] call TON_fnc_fetchCompanyData;
        sleep 1;
    };
} forEach playableUnits;

// Test 2: Vérifier la récupération des employés
diag_log "=== TEST 2: Récupération des employés ===";
{
    if (isPlayer _x) then {
        private _uid = getPlayerUID _x;
        private _query = format ["SELECT id FROM companies WHERE owner_uid = '%1'", _uid];
        private _result = [_query, 2] call DB_fnc_asyncCall;
        
        if (count _result > 0) then {
            private _companyId = (_result select 0) select 0;
            diag_log format ["Test des employés pour l'entreprise ID: %1", _companyId];
            [_companyId, _x] call TON_fnc_getCompanyEmployees;
            sleep 1;
        };
    };
} forEach playableUnits;

// Test 3: Vérifier l'historique des paiements
diag_log "=== TEST 3: Historique des paiements ===";
{
    if (isPlayer _x) then {
        private _uid = getPlayerUID _x;
        private _query = format ["SELECT id FROM companies WHERE owner_uid = '%1'", _uid];
        private _result = [_query, 2] call DB_fnc_asyncCall;
        
        if (count _result > 0) then {
            private _companyId = (_result select 0) select 0;
            diag_log format ["Test de l'historique pour l'entreprise ID: %1", _companyId];
            [_companyId, _x] call TON_fnc_getPaymentHistory;
            sleep 1;
        };
    };
} forEach playableUnits;

diag_log "=== TESTS TERMINÉS ==="; 