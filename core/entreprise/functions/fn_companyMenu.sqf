#include "..\..\..\script_macros.hpp"
/*
    Author: Owned8K
    Description: Initialise le menu de gestion d'entreprise
*/

[] spawn {
    // Vérifier si nous sommes déjà en train de charger les données
    if (!isNil "life_company_loading") exitWith {};
    life_company_loading = true;

    // Fermer tous les dialogues existants
    if (dialog) then {closeDialog 0};
    sleep 0.1;

    // Créer le dialogue
    createDialog "Life_company_management";

    // Attendre que le dialogue soit créé
    waitUntil {!isNull (findDisplay 9800)};
    private _display = findDisplay 9800;

    if (isNull _display) exitWith {
        life_company_loading = nil;
        hint "Erreur: Impossible de créer le dialogue";
    };

    // Message de chargement pour les infos de l'entreprise
    private _companyInfo = _display displayCtrl 9802;
    if (!isNull _companyInfo) then {
        _companyInfo ctrlSetStructuredText parseText "<t align='center' size='1.2'>Chargement des informations...</t>";
        _companyInfo ctrlCommit 0;
    };

    // Message de chargement pour la liste des employés
    private _employeeList = _display displayCtrl 9804;
    if (!isNull _employeeList) then {
        lbClear _employeeList;
        _employeeList lbAdd "Chargement des employés...";
        _employeeList ctrlCommit 0;
    };

    // Désactiver les boutons pendant le chargement
    {
        private _ctrl = _display displayCtrl _x;
        if (!isNull _ctrl) then {
            _ctrl ctrlEnable false;
            _ctrl ctrlCommit 0;
        };
    } forEach [9805, 9806, 9807, 9808];

    sleep 0.5; // Attendre que l'interface soit complètement initialisée

    // Demander les données au serveur de manière synchrone
    [player] remoteExecCall ["TON_fnc_fetchCompanyData", RSERV];
}; 