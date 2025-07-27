/*
    File: fn_buyDistributeurItem.sqf
    Description: Gère l'achat d'un item dans le distributeur
    Author: DreamLife
*/

diag_log "[DISTRIBUTEUR][CLIENT] Début de l'achat...";

// Vérifier qu'un item est sélectionné
if (isNil "life_distributeur_selectedItem") exitWith {
    hint "Veuillez sélectionner un item";
    diag_log "[DISTRIBUTEUR][CLIENT] ERREUR: Aucun item sélectionné";
};

// Récupérer le distributeur actuel
private _distributeur = life_distributeur_actuel;
if (isNull _distributeur) exitWith {
    hint "Erreur: Aucun distributeur sélectionné";
    diag_log "[DISTRIBUTEUR][CLIENT] ERREUR: Distributeur actuel est null";
};

// Récupérer les données de l'interface
private _display = findDisplay 99900;
if (isNull _display) exitWith {
    diag_log "[DISTRIBUTEUR][CLIENT] ERREUR: Display non trouvé";
};

private _itemName = life_distributeur_selectedItem;
private _quantity = parseNumber (ctrlText (_display displayCtrl 2005));
private _pricePerUnit = parseNumber (ctrlText (_display displayCtrl 2004));
private _totalPrice = _quantity * _pricePerUnit;

diag_log format ["[DISTRIBUTEUR][CLIENT] Achat: %1x %2 pour %3€", _quantity, _itemName, _totalPrice];

// Vérifications
if (_quantity <= 0) exitWith {
    hint "Quantité invalide";
    diag_log "[DISTRIBUTEUR][CLIENT] ERREUR: Quantité invalide";
};

// Vérifier le stock disponible
private _availableStock = [_distributeur, _itemName] call life_fnc_getDistributeurStock;
if (_quantity > _availableStock) exitWith {
    hint format ["Stock insuffisant. Disponible: %1", _availableStock];
    diag_log format ["[DISTRIBUTEUR][CLIENT] ERREUR: Stock insuffisant (%1 demandé, %2 disponible)", _quantity, _availableStock];
};

// Vérifier l'argent du joueur
if (life_cash < _totalPrice) exitWith {
    hint format ["Fonds insuffisants. Coût: %1€, Disponible: %2€", _totalPrice, life_cash];
    diag_log format ["[DISTRIBUTEUR][CLIENT] ERREUR: Fonds insuffisants (%1€ requis, %2€ disponible)", _totalPrice, life_cash];
};

// Vérifier l'espace dans l'inventaire
private _itemWeight = [_itemName] call life_fnc_itemWeight;
private _totalWeight = _itemWeight * _quantity;
if ((life_carryWeight + _totalWeight) > life_maxWeight) exitWith {
    hint "Inventaire trop lourd";
    diag_log format ["[DISTRIBUTEUR][CLIENT] ERREUR: Inventaire trop lourd (%1 + %2 > %3)", life_carryWeight, _totalWeight, life_maxWeight];
};

// Effectuer l'achat côté serveur
diag_log "[DISTRIBUTEUR][CLIENT] Envoi de la demande d'achat au serveur...";
[_distributeur, _itemName, _quantity, _totalPrice, player] remoteExecCall ["TON_fnc_server_buyDistributeurItem", 2];

// Fermer l'interface
closeDialog 0;

diag_log "[DISTRIBUTEUR][CLIENT] Demande d'achat envoyée au serveur"; 