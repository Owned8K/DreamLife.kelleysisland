/*
    File: fn_receiveMessages.sqf
    Description: Reçoit la liste des messages et les affiche dans le smartphone.
    Params: [messages]
*/
params [['_messages', [], [[]]]];

// Exemple de remplissage de la liste (à adapter selon l'IDC de la liste dans smartphone.hpp)
private _display = findDisplay 88800;
if (isNull _display) exitWith {};
private _listBox = _display displayCtrl 88808;
lbClear _listBox;
{
    private _index = _listBox lbAdd (format ["%1 (%2)", _x select 2, _x select 3]); // sender_pid (heure)
    _listBox lbSetData [_index, str (_x select 0)]; // id du message
} forEach _messages; 