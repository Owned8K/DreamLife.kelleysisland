#include "..\..\..\script_macros.hpp"
/*
    File: fn_companyMenu.sqf
    Author: Gemini
    Description: Ouvre le menu de gestion d'entreprise
*/

// Fermer le menu joueur
closeDialog 0;

// Ouvrir le menu de gestion d'entreprise
createDialog "company_management"; 