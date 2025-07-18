#include "..\..\..\script_macros.hpp"
/*
    Author: Owned8K
    Description: Initialise le menu de gestion d'entreprise (appelé par onLoad)
*/
params [
    ["_display", displayNull, [displayNull]]
];

// Vérifier si nous sommes déjà en train de charger les données
if (!isNil "life_company_loading") exitWith {};
life_company_loading = true;

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

// Demander les données au serveur
[player] remoteExec ["TON_fnc_fetchCompanyData", RSERV]; 