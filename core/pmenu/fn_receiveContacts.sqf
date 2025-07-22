/*
    File: fn_receiveContacts.sqf
    Description: Reçoit la liste des contacts et les affiche dans le smartphone.
    Params: [contacts]
*/
params [["_contacts", [], [[]]]];

diag_log format ["[CONTACTS][CLIENT] Contacts reçus: %1", _contacts];
systemChat format ["Contacts reçus: %1", count _contacts];

private _display = findDisplay 88800;
if (isNull _display) exitWith {
    diag_log "[CONTACTS][CLIENT] ERREUR: Display smartphone non trouvé";
    systemChat "ERREUR: Interface smartphone non trouvée";
};

private _listBox = _display displayCtrl 88821;
lbClear _listBox;

{
    private _name = _x select 1;
    private _number = _x select 2;
    private _index = _listBox lbAdd format ["%1 - %2", _name, _number];
    _listBox lbSetData [_index, str (_x select 0)];
    diag_log format ["[CONTACTS][CLIENT] Ajout contact: %1 - %2", _name, _number];
} forEach _contacts;

if (count _contacts == 0) then {
    _listBox lbAdd "Aucun contact";
    systemChat "Aucun contact trouvé";
}; 