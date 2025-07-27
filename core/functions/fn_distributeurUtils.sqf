/*
    File: fn_distributeurUtils.sqf
    Description: Fonctions utilitaires pour gérer les distributeurs automatiques
    Author: DreamLife
*/

// Fonction pour récupérer le stock actuel d'un item dans un distributeur
life_fnc_getDistributeurStock = {
    params ["_distributeur", "_itemName"];
    
    private _stockJson = _distributeur getVariable ["distributeur_stock", "{}"];
    private _stock = createHashMap;
    
    try {
        _stock = call compile _stockJson;
    } catch {
        diag_log format ["[DISTRIBUTEUR][UTILS] ERREUR parsing stock JSON: %1", _exception];
        _stock = createHashMap;
    };
    
    private _itemStock = _stock getOrDefault [_itemName, 0];
    _itemStock
};

// Fonction pour récupérer le stock maximum d'un item dans un distributeur
life_fnc_getDistributeurStockMax = {
    params ["_distributeur", "_itemName"];
    
    private _stockMaxJson = _distributeur getVariable ["distributeur_stock_max", "{}"];
    private _stockMax = createHashMap;
    
    try {
        _stockMax = call compile _stockMaxJson;
    } catch {
        diag_log format ["[DISTRIBUTEUR][UTILS] ERREUR parsing stock_max JSON: %1", _exception];
        _stockMax = createHashMap;
    };
    
    private _itemStockMax = _stockMax getOrDefault [_itemName, 0];
    _itemStockMax
};

// Fonction pour vérifier si un item est disponible dans un distributeur
life_fnc_isItemAvailable = {
    params ["_distributeur", "_itemName"];
    
    private _stock = [_distributeur, _itemName] call life_fnc_getDistributeurStock;
    _stock > 0
};

// Fonction pour calculer le pourcentage de stock d'un item
life_fnc_getStockPercentage = {
    params ["_distributeur", "_itemName"];
    
    private _stock = [_distributeur, _itemName] call life_fnc_getDistributeurStock;
    private _stockMax = [_distributeur, _itemName] call life_fnc_getDistributeurStockMax;
    
    if (_stockMax == 0) then {
        0
    } else {
        (_stock / _stockMax) * 100
    }
};

// Fonction pour récupérer le prix d'un item dans un distributeur
life_fnc_getDistributeurPrice = {
    params ["_distributeur", "_itemName"];
    
    private _prixJson = _distributeur getVariable ["distributeur_prix", "{}"];
    private _prix = createHashMap;
    
    try {
        _prix = call compile _prixJson;
    } catch {
        diag_log format ["[DISTRIBUTEUR][UTILS] ERREUR parsing prix JSON: %1", _exception];
        _prix = createHashMap;
    };
    
    private _itemPrice = _prix getOrDefault [_itemName, 0];
    _itemPrice
};

// Fonction pour obtenir tous les items disponibles dans un distributeur
life_fnc_getAvailableItems = {
    params ["_distributeur"];
    
    private _stockJson = _distributeur getVariable ["distributeur_stock", "{}"];
    private _stock = createHashMap;
    
    try {
        _stock = call compile _stockJson;
    } catch {
        diag_log format ["[DISTRIBUTEUR][UTILS] ERREUR parsing stock JSON: %1", _exception];
        _stock = createHashMap;
    };
    
    private _availableItems = [];
    {
        _x params ["_itemName", "_itemStock"];
        if (_itemStock > 0) then {
            _availableItems pushBack _itemName;
        };
    } forEach _stock;
    
    _availableItems
}; 