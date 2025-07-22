/*
    File: fn_receiveMessages.sqf
    Description: Reçoit et affiche les messages dans le smartphone.
    Params: [messages]
*/
params [["_messages", [], [[]]]];

diag_log format ["[MESSAGES][CLIENT] Messages reçus: %1", _messages];

disableSerialization;
private _display = findDisplay 88800;
if (isNull _display) exitWith {
    diag_log "[MESSAGES][CLIENT] ERREUR: Display smartphone non trouvé";
    systemChat "[MESSAGES] ERREUR: Interface smartphone non trouvée";
};

private _listBox = _display displayCtrl 88808;
if (isNull _listBox) exitWith {
    diag_log "[MESSAGES][CLIENT] ERREUR: ListBox messages non trouvée";
    systemChat "[MESSAGES] ERREUR: Liste des messages non trouvée";
};

lbClear _listBox;
diag_log "[MESSAGES][CLIENT] Liste nettoyée, début du remplissage";

if (_messages isEqualTo []) then {
    _listBox lbAdd "Aucun message";
    systemChat "[MESSAGES] Aucun message trouvé";
    diag_log "[MESSAGES][CLIENT] Aucun message à afficher";
} else {
    {
        _x params [
            ["_id", 0, [0]],
            ["_senderPid", "", [""]],
            ["_senderName", "", [""]],
            ["_receiverPid", "", [""]],
            ["_receiverName", "", [""]],
            ["_content", "", [""]],
            ["_sentAt", "", [""]],
            ["_isRead", 0, [0]]
        ];
        
        private _playerPid = getPlayerUID player;
        private _isReceived = (_receiverPid isEqualTo _playerPid);
        
        // Format de la date pour l'affichage
        private _dateArr = _sentAt splitString " ";
        private _date = _dateArr select 0;
        private _time = _dateArr select 1;
        
        // Création du texte à afficher
        private _direction = if (_isReceived) then {"De"} else {"À"};
        private _otherName = if (_isReceived) then {_senderName} else {_receiverName};
        private _text = format ["%1 %2 - %3 %4 - %5", _direction, _otherName, _date, _time, _content];
        
        diag_log format ["[MESSAGES][CLIENT] Traitement message: ID=%1, %2 %3, Date=%4, Lu=%5", _id, _direction, _otherName, _sentAt, _isRead];
        
        private _index = _listBox lbAdd _text;
        _listBox lbSetData [_index, str [_id, _isRead]];
        
        // Couleur en fonction de l'état de lecture
        if (_isReceived && !_isRead) then {
            _listBox lbSetColor [_index, [0.9, 0.9, 0, 1]]; // Jaune pour non lu
        } else {
            _listBox lbSetColor [_index, [1, 1, 1, 1]]; // Blanc pour lu
        };
        
        diag_log format ["[MESSAGES][CLIENT] Message ajouté à l'index %1: %2", _index, _text];
    } forEach _messages;
    
    systemChat format ["[MESSAGES] %1 messages affichés", count _messages];
    diag_log format ["[MESSAGES][CLIENT] %1 messages affichés avec succès", count _messages];
    
    if (lbSize _listBox > 0) then {
        _listBox lbSetCurSel 0;
    };
}; 