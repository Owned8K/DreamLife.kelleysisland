/*
    File: fn_receiveContacts.sqf
    Description: Reçoit la liste des contacts et les affiche dans le smartphone.
    Params: [contacts]
*/
params [["_contacts", [], [[]]]];

diag_log format ["[CONTACTS][CLIENT] Contacts reçus (brut): %1", _contacts];
systemChat format ["[CONTACTS] %1 contacts reçus", count _contacts];

private _display = findDisplay 88800;
if (isNull _display) exitWith {
    diag_log "[CONTACTS][CLIENT] ERREUR: Display smartphone non trouvé";
    systemChat "[CONTACTS] ERREUR: Interface smartphone non trouvée";
};

private _listBox = _display displayCtrl 88821;
if (isNull _listBox) exitWith {
    diag_log "[CONTACTS][CLIENT] ERREUR: ListBox contacts non trouvée";
    systemChat "[CONTACTS] ERREUR: Liste des contacts non trouvée";
};

lbClear _listBox;
diag_log "[CONTACTS][CLIENT] Liste nettoyée, début du remplissage";

{
    private _name = _x select 1;
    private _number = _x select 2;
    private _index = _listBox lbAdd format ["%1 - %2", _name, _number];
    _listBox lbSetData [_index, str (_x select 0)];
    diag_log format ["[CONTACTS][CLIENT] Contact ajouté: %1 - %2 (index: %3)", _name, _number, _index];
} forEach _contacts;

if (count _contacts == 0) then {
    _listBox lbAdd "Aucun contact";
    systemChat "[CONTACTS] Aucun contact trouvé";
    diag_log "[CONTACTS][CLIENT] Aucun contact à afficher";
} else {
    systemChat format ["[CONTACTS] %1 contacts affichés", count _contacts];
    diag_log format ["[CONTACTS][CLIENT] %1 contacts affichés avec succès", count _contacts];
}; 