#include "..\..\..\script_macros.hpp"
/*
    File: fn_companyMenu.sqf
    Author: Gemini
    Description: Affiche les informations de l'entreprise dans le menu joueur.
*/

// Récupérer les données de l'entreprise du joueur
[player] remoteExecCall ["TON_fnc_fetchCompanyData", RSERV]; 