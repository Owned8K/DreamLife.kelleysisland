/*
    File: fn_distributeurBuyResult.sqf
    Description: Reçoit le résultat de l'achat d'un item dans le distributeur
    Author: DreamLife
*/

params ["_success", "_message"];

diag_log format ["[DISTRIBUTEUR][CLIENT] Résultat d'achat: %1 - %2", _success, _message];

if (_success) then {
    // Achat réussi
    hint parseText format ["<t color='#00FF00'>✓ %1</t>", _message];
    
    // Mettre à jour l'argent affiché si l'interface est encore ouverte
    if (!isNull (findDisplay 99900)) then {
        // L'interface est encore ouverte, on pourrait la mettre à jour ici
        // Mais comme on ferme l'interface après l'achat, ce n'est pas nécessaire
    };
    
} else {
    // Échec de l'achat
    hint parseText format ["<t color='#FF0000'>✗ %1</t>", _message];
};

// Nettoyer la variable de sélection
life_distributeur_selectedItem = nil;

diag_log "[DISTRIBUTEUR][CLIENT] Résultat d'achat traité"; 