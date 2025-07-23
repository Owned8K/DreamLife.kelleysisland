/*
    File: fn_openConversation.sqf
    Description: Ouvre la conversation avec le destinataire sélectionné dans MessagesList.
    Params: _this (event params de onLBSelChanged)
*/
params ["_control", "_selectedIndex"];

// Récupérer les données du message sélectionné
private _data = _control lbData _selectedIndex;
if (_data isEqualTo "") exitWith {
    systemChat "[CONV] Aucun message sélectionné.";
};

// On récupère la variable globale _messages utilisée dans fn_receiveMessages.sqf
if (isNil "_messages") exitWith {
    systemChat "[CONV] Liste des messages non chargée.";
};

// On retrouve le message sélectionné
private _msg = _messages select _selectedIndex;
if (isNil "_msg") exitWith {
    systemChat "[CONV] Message non trouvé.";
};

// On détermine le numéro cible (autre participant)
_msg params ["_id", "_senderPid", "_senderName", "_receiverPid", "_receiverName", "_content", "_sentAt", "_isRead"];
private _playerPid = getPlayerUID player;
private _targetNumber = if (_receiverPid isEqualTo _playerPid) then {_senderPid} else {_receiverPid};

// Appel serveur pour récupérer la conversation
[player, _targetNumber] remoteExecCall ["life_fnc_server_fetchConversation", 2];

// Affichage UI : masquer MessagesList, afficher ConversationList
private _display = findDisplay 88800;
if (!isNull _display) then {
    (_display displayCtrl 88808) ctrlShow false; // MessagesList
    (_display displayCtrl 88817) ctrlShow true;  // ConversationList
}; 