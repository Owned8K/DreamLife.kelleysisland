#include "..\..\..\script_macros.hpp"
/*
    File: fn_hireEmployee.sqf
    Author: Your Name
    
    Description:
    Embauche un joueur dans l'entreprise
*/

private ["_display", "_listbox", "_selectedIndex", "_selectedPlayer", "_companyData"];

// Vérifier si le joueur est propriétaire d'une entreprise
if (count life_company_data == 0) exitWith {
    hint "Vous n'êtes pas propriétaire d'une entreprise.";
};

// Récupérer l'interface et la listbox
_display = findDisplay 9800;
_listbox = _display displayCtrl 9811;
_selectedIndex = lbCurSel _listbox;

// Vérifier si un joueur est sélectionné
if (_selectedIndex == -1) exitWith {
    hint "Veuillez sélectionner un joueur à embaucher.";
};

// Récupérer les données du joueur sélectionné
_selectedPlayer = _listbox lbData _selectedIndex;
_selectedPlayer = call compile _selectedPlayer;

if (isNull _selectedPlayer) exitWith {
    hint "Erreur: Joueur invalide.";
};

// Récupérer les données de l'entreprise
_companyData = life_company_data;
private _companyId = _companyData select 0;
private _playerUID = getPlayerUID _selectedPlayer;
private _playerName = name _selectedPlayer;

// Envoyer la requête au serveur
[_companyId, _playerUID, _playerName, player] remoteExec ["TON_fnc_hireEmployee", RSERV];

hint format ["Demande d'embauche envoyée pour %1...", _playerName]; 