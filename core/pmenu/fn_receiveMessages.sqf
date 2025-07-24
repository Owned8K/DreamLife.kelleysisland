/*
    File: fn_receiveMessages.sqf
    Description: Affiche la liste des conversations dans le smartphone.
    Params: [messages]
*/
params [["_messages", [], [[]]]];

// Correction des doubles guillemets si nécessaire
if (typeName _messages == "STRING") then {
    _messages = call compile _messages;
};

// Nettoyage des données
private _cleanMessages = [];
{
    private _msg = _x;
    if (typeName _msg == "ARRAY") then {
        _msg = _msg apply {
            if (typeName _x == "STRING") then {
                // Enlever les doubles guillemets
                private _cleaned = _x;
                _cleaned = [_cleaned, """", ""] call CBA_fnc_replace;
                _cleaned
            } else {
                _x
            };
        };
        _cleanMessages pushBack _msg;
    };
} forEach _messages;

_messages = _cleanMessages;

// Stockage global pour accès conversation
life_allMessages = _messages;

diag_log format ["[MESSAGES][CLIENT] Messages reçus après nettoyage: %1", _messages];

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

// S'assurer que MessagesList est visible et ConversationList est cachée
(_display displayCtrl 88808) ctrlShow true;  // MessagesList
(_display displayCtrl 88817) ctrlShow false; // ConversationList

lbClear _listBox;
diag_log "[MESSAGES][CLIENT] Liste nettoyée, début du remplissage";

if (_messages isEqualTo []) then {
    _listBox lbAdd "Aucune conversation";
    systemChat "[MESSAGES] Aucun message trouvé";
    diag_log "[MESSAGES][CLIENT] Aucun message à afficher";
} else {
    // Fonction locale pour convertir une date string en nombre
    private _dateToNumber = {
        params ["_dateStr"];
        if (_dateStr isEqualTo "" || isNil "_dateStr") exitWith {0};
        if ((count _dateStr) < 19) exitWith {0}; // Format attendu: "YYYY-MM-DD HH:MM:SS"
        private _clean = (_dateStr select [0,4]) + (_dateStr select [5,2]) + (_dateStr select [8,2]) + (_dateStr select [11,2]) + (_dateStr select [14,2]) + (_dateStr select [17,2]);
        parseNumber _clean
    };
    
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
            private _oldMsg = _conversations select _existing;
            private _oldDate = _oldMsg select 2;
            private _sentAtNum = [_sentAt] call _dateToNumber;
            private _oldDateNum = [_oldDate] call _dateToNumber;
            if (_sentAtNum > _oldDateNum) then {
                _conversations set [_existing, [_contactPid, _content, _sentAt, _isRead, _senderName, _receiverName]];
            };
        } else {
            _conversations pushBack [_contactPid, _content, _sentAt, _isRead, _senderName, _receiverName];
        };
    } forEach _messages;
    
    // Affichage des conversations
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
                    diag_log format ["[DEBUG] Contact trouvé: %1 pour PID: %2", _name, _contactPid];
                };
            } forEach life_contacts;
        };
        
        private _displayName = if (_isContact) then {_contactName} else {format ["%1", _contactPid]};
        private _text = format ["%1 - %2", _displayName, _content];
        private _index = _listBox lbAdd _text;
        _listBox lbSetData [_index, _contactPid];
        
        diag_log format ["[DEBUG] Ajout conversation: %1 avec PID: %2", _text, _contactPid];
        
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
}; 