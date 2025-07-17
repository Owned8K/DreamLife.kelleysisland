#include "..\..\..\script_macros.hpp"
/*
    File: fn_companyMenu.sqf
    Author: Gemini
    Description: Affiche les informations de l'entreprise dans le menu de gestion.
*/

// Fermer le menu joueur
closeDialog 0;

// Récupérer les données de l'entreprise du joueur
[player] remoteExecCall ["TON_fnc_fetchCompanyData", RSERV];

// Attendre un court instant pour recevoir les données
[] spawn {
    sleep 0.5;
    createDialog "company_management";
    
    // Afficher un message de chargement
    private _display = findDisplay 3800;
    if (!isNull _display) then {
        private _companyInfo = _display displayCtrl 3802;
        _companyInfo ctrlSetStructuredText parseText "<t align='center'>Chargement des données...</t>";
    };
}; 