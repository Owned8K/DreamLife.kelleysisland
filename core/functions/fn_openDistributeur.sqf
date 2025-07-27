/*
    File: fn_openDistributeur.sqf
    Author: DreamLife
    Description: Ouvre l'interface du distributeur automatique
*/

params [
    ["_distributeur", objNull, [objNull]]
];

diag_log format ["[DISTRIBUTEUR][CLIENT] fn_openDistributeur appelé avec: %1", _distributeur];

if (isNull _distributeur) exitWith {
    hint "Erreur: Distributeur invalide";
    diag_log "[DISTRIBUTEUR][CLIENT] ERREUR: Distributeur est null";
};

if (dialog) exitWith {
    hint "Une interface est déjà ouverte";
    diag_log "[DISTRIBUTEUR][CLIENT] ERREUR: Dialog déjà ouvert";
};

// Stocker le distributeur actuel
life_distributeur_actuel = _distributeur;

// Récupérer les données du distributeur
private _distributeurId = _distributeur getVariable ["distributeur_id", 0];
private _distributeurNom = _distributeur getVariable ["distributeur_nom", "Distributeur"];
private _stockActuel = _distributeur getVariable ["distributeur_stock", "{}"];
private _prix = _distributeur getVariable ["distributeur_prix", "{}"];

diag_log format ["[DISTRIBUTEUR][CLIENT] Ouverture distributeur: %1 (ID: %2)", _distributeurNom, _distributeurId];

// Ouvrir l'interface
diag_log "[DISTRIBUTEUR][CLIENT] Tentative d'ouverture du dialog...";
private _dialogResult = createDialog "Life_Distributeur";
diag_log format ["[DISTRIBUTEUR][CLIENT] Résultat createDialog: %1", _dialogResult];

            if (_dialogResult) then {
                diag_log "[DISTRIBUTEUR][CLIENT] Interface ouverte avec succès";
            } else {
    diag_log "[DISTRIBUTEUR][CLIENT] ERREUR: Impossible d'ouvrir l'interface";
    hint "Erreur: Impossible d'ouvrir l'interface du distributeur";
}; 