/*
    File: fn_selectDistributeurItem.sqf
    Description: Gère la sélection d'un item dans le distributeur et met à jour l'écran de sélection
    Author: DreamLife
*/

params ["_itemName"];

diag_log format ["[DISTRIBUTEUR][CLIENT] Sélection de l'item: %1", _itemName];

// Récupérer le distributeur actuel
private _distributeur = life_distributeur_actuel;
if (isNull _distributeur) exitWith {
    hint "Erreur: Aucun distributeur sélectionné";
    diag_log "[DISTRIBUTEUR][CLIENT] ERREUR: Distributeur actuel est null";
};

// Récupérer les données du distributeur
private _stockJson = _distributeur getVariable ["distributeur_stock", "{}"];
private _prixJson = _distributeur getVariable ["distributeur_prix", "{}"];
diag_log format ["[DISTRIBUTEUR][CLIENT] Stock JSON brut: %1", _stockJson];
diag_log format ["[DISTRIBUTEUR][CLIENT] Prix JSON brut: %1", _prixJson];

private _stock = [_distributeur, _itemName] call life_fnc_getDistributeurStock;
private _price = [_distributeur, _itemName] call life_fnc_getDistributeurPrice;

diag_log format ["[DISTRIBUTEUR][CLIENT] Stock: %1, Prix: %2", _stock, _price];
diag_log format ["[DISTRIBUTEUR][CLIENT] Type stock: %1, Type prix: %2", typeName _stock, typeName _price];

// Vérifier si l'item est disponible
if (_stock <= 0) exitWith {
    hint "Cet item n'est plus disponible";
    diag_log format ["[DISTRIBUTEUR][CLIENT] Item %1 non disponible (stock: %2)", _itemName, _stock];
};

// Stocker l'item sélectionné
life_distributeur_selectedItem = _itemName;

// Mettre à jour l'interface
private _display = findDisplay 99900;
if (isNull _display) exitWith {
    diag_log "[DISTRIBUTEUR][CLIENT] ERREUR: Display non trouvé";
};

// Icône de l'item
private _iconCtrl = _display displayCtrl 2001;
private _iconPath = "";
switch (_itemName) do {
    case "redgull": { _iconPath = "icons\ico_redgull.paa"; };
    case "waterBottle": { _iconPath = "icons\ico_waterBottle.paa"; };
    case "donuts": { _iconPath = "icons\ico_donuts.paa"; };
    case "apple": { _iconPath = "icons\ico_apple.paa"; };
    case "peach": { _iconPath = "icons\ico_peach.paa"; };
    default { _iconPath = "icons\ico_redgull.paa"; };
};
_iconCtrl ctrlSetText _iconPath;

// Nom de l'item
private _nameCtrl = _display displayCtrl 2002;
private _itemDisplayName = "";
switch (_itemName) do {
    case "redgull": { _itemDisplayName = "RedBull"; };
    case "waterBottle": { _itemDisplayName = "Bouteille d'eau"; };
    case "donuts": { _itemDisplayName = "Donut"; };
    case "apple": { _itemDisplayName = "Pomme"; };
    case "peach": { _itemDisplayName = "Pêche"; };
    default { _itemDisplayName = "Item inconnu"; };
};
_nameCtrl ctrlSetText _itemDisplayName;

// Stock disponible
private _stockCtrl = _display displayCtrl 2003;
_stockCtrl ctrlSetText str _stock;

// Prix unitaire
private _priceCtrl = _display displayCtrl 2004;
_priceCtrl ctrlSetText format ["%1€", _price];

// Réinitialiser la quantité à 1
private _quantityCtrl = _display displayCtrl 2005;
_quantityCtrl ctrlSetText "1";

// Calculer le total initial
private _totalCtrl = _display displayCtrl 2006;
_totalCtrl ctrlSetText format ["%1€", _price];

// Ajouter un event handler pour mettre à jour le total quand la quantité change
_quantityCtrl ctrlAddEventHandler ["KeyUp", {
    params ["_ctrl"];
    private _quantity = parseNumber (ctrlText _ctrl);
    private _price = parseNumber (ctrlText ((findDisplay 99900) displayCtrl 2004));
    private _total = _quantity * _price;
    ((findDisplay 99900) displayCtrl 2006) ctrlSetText format ["%1€", _total];
}];

diag_log format ["[DISTRIBUTEUR][CLIENT] Item %1 sélectionné avec succès", _itemName]; 