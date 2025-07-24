/*
    File: fn_openConversation.sqf
    Description: Ouvre la conversation avec le contact sélectionné dans MessagesList.
    Params: _this (event params de onLBSelChanged)
*/
// Correction de la récupération des paramètres
private _control = _this select 0;
private _selectedIndex = _this select 1;

// Récupérer le PID du contact sélectionné
private _contactPid = _control lbData _selectedIndex;
systemChat format ["[DEBUG] Ouverture conversation avec: %1", _contactPid];
diag_log format ["[DEBUG] fn_openConversation appelé avec contactPid: %1", _contactPid];
// Log pour debug contacts
if (!isNil "life_contacts") then {
    diag_log format ["[DEBUG] Contacts: %1", life_contacts];
} else {
    diag_log "[DEBUG] Aucun contact enregistré dans life_contacts";
};
if (_contactPid isEqualTo "") exitWith {
    systemChat "[CONV] Aucun contact sélectionné.";
};

// Appel serveur pour récupérer la conversation
[player, _contactPid] remoteExecCall ["life_fnc_server_fetchConversation", 2];

// Affichage UI : masquer MessagesList, afficher ConversationList
private _display = findDisplay 88800;
if (!isNull _display) then {
    (_display displayCtrl 88808) ctrlShow false; // MessagesList
    (_display displayCtrl 88817) ctrlShow true;  // ConversationList
}; 