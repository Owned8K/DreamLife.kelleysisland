/*
    File: fn_openConversation.sqf
    Description: Ouvre la conversation avec le contact sélectionné dans MessagesList.
    Params: _this (event params de onLBSelChanged)
*/
// Correction robuste de la récupération des paramètres
private _control = controlNull;
private _selectedIndex = -1;
if ((count _this > 0) && {typeName (_this select 0) == "ARRAY"}) then {
    // Cas où _this = [[control, index]]
    _control = (_this select 0) select 0;
    _selectedIndex = (_this select 0) select 1;
} else {
    // Cas normal _this = [control, index]
    _control = _this select 0;
    _selectedIndex = _this select 1;
};

// Récupérer le PID du contact sélectionné
private _contactPid = _control lbData _selectedIndex;
systemChat format ["[DEBUG] Ouverture conversation avec: %1", _contactPid];
diag_log format ["[DEBUG] fn_openConversation appelé avec contactPid: %1", _contactPid];

if (_contactPid isEqualTo "") exitWith {
    systemChat "[CONV] Aucun contact sélectionné.";
};

// Affichage UI : masquer MessagesList, afficher ConversationList
private _display = findDisplay 88800;
if (!isNull _display) then {
    private _messagesList = _display displayCtrl 88808;
    private _conversationList = _display displayCtrl 88817;
    
    if (!isNull _messagesList && !isNull _conversationList) then {
        _messagesList ctrlShow false;
        _conversationList ctrlShow true;
        _conversationList ctrlEnable true;
        
        // Appel serveur pour récupérer la conversation
        [player, _contactPid] remoteExecCall ["life_fnc_server_fetchConversation", 2];
        systemChat format ["[CONV] Chargement de la conversation avec %1...", _contactPid];
    } else {
        systemChat "[CONV] ERREUR: Impossible de trouver les contrôles de l'interface";
    };
} else {
    systemChat "[CONV] ERREUR: Interface smartphone non trouvée";
}; 