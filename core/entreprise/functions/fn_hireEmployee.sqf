#include "..\..\..\script_macros.hpp"
/*
    Author: Owned8K
    Description: Ouvre une boîte de dialogue pour embaucher un nouvel employé
*/

if !(call life_isCompanyOwner) exitWith {
    hint localize "STR_Company_NotOwner";
};

// Créer la boîte de dialogue de sélection de joueur
private _players = playableUnits select {_x != player};
if (_players isEqualTo []) exitWith {
    hint localize "STR_Company_NoPlayersToHire";
};

private _display = findDisplay 9800;
private _list = [
    "Sélectionner un joueur",
    "Embaucher un employé",
    {
        params ["_selectedPlayer"];
        if (isNull _selectedPlayer) exitWith {};
        
        private _uid = getPlayerUID _selectedPlayer;
        private _name = name _selectedPlayer;
        
        // Envoyer la demande au serveur
        [player, _uid, _name] remoteExec ["TON_fnc_hireEmployee", RSERV];
    }
] call BIS_fnc_listBox;

if (isNull _list) then {
    hint localize "STR_Company_HireError";
}; 