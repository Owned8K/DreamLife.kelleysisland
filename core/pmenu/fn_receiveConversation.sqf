/*
    File: fn_receiveConversation.sqf
    Description: Affiche la conversation reçue dans la ConversationList.
    Params: [messages]
*/
params ["_messages"];

// Stockage temporaire pour navigation
life_conversationMessages = _messages;

diag_log format ["[CONV][CLIENT] Conversation reçue: %1 messages", count _messages];

disableSerialization;
private _display = findDisplay 88800;
if (isNull _display) exitWith {
    diag_log "[CONV][CLIENT] ERREUR: Display smartphone non trouvé";
    systemChat "[CONV] ERREUR: Interface smartphone non trouvée";
};

private _listBox = _display displayCtrl 88817;
if (isNull _listBox) exitWith {
    diag_log "[CONV][CLIENT] ERREUR: ConversationList non trouvée";
    systemChat "[CONV] ERREUR: Liste de conversation non trouvée";
};

lbClear _listBox;

if (_messages isEqualTo []) then {
    _listBox lbAdd "Aucun message dans cette conversation";
    diag_log "[CONV][CLIENT] Aucun message à afficher";
} else {
    {
        _x params ["_id", "_senderPid", "_senderName", "_receiverPid", "_receiverName", "_content", "_sentAt", "_isRead"];
        private _playerPid = getPlayerUID player;
        private _isMine = (_senderPid isEqualTo _playerPid);
        private _direction = if (_isMine) then {"Moi"} else {_senderName};
        private _text = format ["%1: %2 (%3)", _direction, _content, _sentAt];
        private _index = _listBox lbAdd _text;
        // Couleur différente pour mes messages
        if (_isMine) then {
            _listBox lbSetColor [_index, [0.7, 0.9, 1, 1]];
        } else {
            _listBox lbSetColor [_index, [1, 1, 1, 1]];
        };
    } forEach _messages;
    diag_log format ["[CONV][CLIENT] %1 messages affichés dans la conversation", count _messages];
    if (lbSize _listBox > 0) then {
        _listBox lbSetCurSel (lbSize _listBox - 1);
    };
}; 