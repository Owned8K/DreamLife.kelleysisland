#include "..\..\..\script_macros.hpp"
/*
    Author: Owned8K
    Description: Fonction appelée par le serveur après création réussie d'une entreprise.
                 Met à jour l'argent du joueur et affiche le message de succès.
*/
params [
    ["_successMessage","",[""]],
    ["_newBankAmount",0,[0]]
];

// Mise à jour de l'argent côté client
life_atmbank = _newBankAmount;

// Synchronisation avec la base de données
[1] call SOCK_fnc_updatePartial;

// Affichage du message de succès
hint _successMessage;

// Optionnel : Mise à jour de l'interface si elle est ouverte
if (!isNull (findDisplay 3700)) then {
    closeDialog 0;
}; 