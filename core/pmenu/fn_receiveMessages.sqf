/*
    File: fn_receiveMessages.sqf
    Description: Affiche la liste des conversations dans le smartphone.
    Params: [messages]
*/
params [["_messages", [], [[]]]];

// Stockage global pour accès conversation
life_allMessages = _messages;

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
    _listBox lbAdd "Aucune conversation";
    systemChat "[MESSAGES] Aucun message trouvé";
    diag_log "[MESSAGES][CLIENT] Aucun message à afficher";
} else {
    // Grouper par conversation (PID contact)
    private _playerPid = getPlayerUID player;
    private _conversations = [];
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
        private _contactPid = if (_senderPid isEqualTo _playerPid) then {_receiverPid} else {_senderPid};
        private _existing = _conversations findIf {(_x select 0) isEqualTo _contactPid};
        if (_existing > -1) then {
            // Remplacer si ce message est plus récent
            private _oldMsg = _conversations select _existing;
            private _oldDate = _oldMsg select 2;
            if (!isNil "_oldDate" && {_oldDate != ""} && {_sentAt != ""}) then {
                if (_sentAt > _oldDate) then {
                    _conversations set [_existing, [_contactPid, _content, _sentAt, _isRead, _senderName, _receiverName]];
                };
            };
        } else {
            _conversations pushBack [_contactPid, _content, _sentAt, _isRead, _senderName, _receiverName];
        };
    } forEach _messages;
    // Affichage
    {
        _x params ["_contactPid", "_content", "_sentAt", "_isRead", "_senderName", "_receiverName"];
        private _contactName = _contactPid;
        private _isContact = false;
        if (!isNil "life_contacts") then {
            {
                _x params ["_id", "_name", "_number"];
                if (_number isEqualTo _contactPid) exitWith {
                    _contactName = _name;
                    _isContact = true;
                };
            } forEach life_contacts;
        };
        private _displayName = if (_isContact) then {_contactName} else {format ["%1", _contactPid]};
        private _text = format ["%1 - %2", _displayName, _content];
        private _index = _listBox lbAdd _text;
        _listBox lbSetData [_index, _contactPid];
        // Couleur si non lu
        if (_isRead isEqualTo 0) then {
            _listBox lbSetColor [_index, [0.9, 0.9, 0, 1]];
        } else {
            _listBox lbSetColor [_index, [1, 1, 1, 1]];
        };
    } forEach _conversations;
    systemChat format ["[MESSAGES] %1 conversations affichées", count _conversations];
    diag_log format ["[MESSAGES][CLIENT] %1 conversations affichées avec succès", count _conversations];
    if (lbSize _listBox > 0) then {
        _listBox lbSetCurSel 0;
    };
} 