#include "..\..\..\script_macros.hpp"
/*
    Author: Owned8K
    Description: Initialise le menu de gestion d'entreprise
*/

// Fermer tous les dialogues existants
closeDialog 0;

// Créer le dialogue
if (createDialog "Life_company_management") then {
    disableSerialization;
    
    // Ajouter un message de chargement dans les deux cadres
    private _display = findDisplay 9800;
    
    // Message de chargement pour les infos de l'entreprise
    private _companyInfo = _display displayCtrl 9802;
    _companyInfo ctrlSetStructuredText parseText "<t align='center'>Chargement des informations...</t>";
    
    // Message de chargement pour la liste des employés
    private _employeeList = _display displayCtrl 9804;
    lbClear _employeeList;
    _employeeList lbAdd "Chargement des employés...";
    
    // Désactiver les boutons pendant le chargement
    {
        private _ctrl = _display displayCtrl _x;
        _ctrl ctrlEnable false;
    } forEach [9805, 9806, 9807, 9808]; // HireButton, FireButton, SalaryEdit, SetSalaryButton
    
    // Demander les données au serveur
    [player] remoteExec ["TON_fnc_fetchCompanyData", RSERV];
} else {
    hint "Erreur lors de l'ouverture du menu de gestion d'entreprise";
}; 