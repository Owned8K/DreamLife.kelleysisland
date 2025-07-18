#include "..\..\..\script_macros.hpp"
/*
    Author: Owned8K
    Description: Initialise le menu de gestion d'entreprise
*/

// Fermer tous les dialogues existants
if (dialog) then {closeDialog 0};
sleep 0.01;

// Créer le dialogue
if (createDialog "Life_company_management") then {
    disableSerialization;
    
    // Attendre que le dialogue soit créé
    waitUntil {!isNull (findDisplay 9800)};
    private _display = findDisplay 9800;
    
    if (isNull _display) exitWith {
        hint "Erreur: Impossible de créer le dialogue";
    };
    
    // Message de chargement pour les infos de l'entreprise
    private _companyInfo = _display displayCtrl 9802;
    if (!isNull _companyInfo) then {
        _companyInfo ctrlSetStructuredText parseText "<t align='center' size='1.2'>Chargement des informations...</t>";
        _companyInfo ctrlCommit 0;
    } else {
        hint "Erreur: Control 9802 non trouvé";
    };
    
    // Message de chargement pour la liste des employés
    private _employeeList = _display displayCtrl 9804;
    if (!isNull _employeeList) then {
        lbClear _employeeList;
        _employeeList lbAdd "Chargement des employés...";
        _employeeList ctrlCommit 0;
    } else {
        hint "Erreur: Control 9804 non trouvé";
    };
    
    // Désactiver les boutons pendant le chargement
    {
        private _ctrl = _display displayCtrl _x;
        if (!isNull _ctrl) then {
            _ctrl ctrlEnable false;
            _ctrl ctrlCommit 0;
        };
    } forEach [9805, 9806, 9807, 9808]; // HireButton, FireButton, SalaryEdit, SetSalaryButton
    
    // Demander les données au serveur
    [player] remoteExec ["TON_fnc_fetchCompanyData", RSERV];
} else {
    hint "Erreur lors de l'ouverture du menu de gestion d'entreprise";
}; 