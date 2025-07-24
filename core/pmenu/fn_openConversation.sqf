/*
    File: fn_openConversation.sqf
    Description: Ouvre la conversation avec le contact sélectionné dans MessagesList.
    Params: _this (event params de onLBSelChanged)
*/
params ["_control", "_selectedIndex"];

// Récupérer le PID du contact sélectionné
private _contactPid = _control lbData _selectedIndex;
systemChat format ["[DEBUG] Ouverture conversation avec: %1", _contactPid];
diag_log format ["[DEBUG] fn_openConversation appelé avec contactPid: %1", _contactPid];
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