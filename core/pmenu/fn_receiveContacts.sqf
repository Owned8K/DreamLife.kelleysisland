/*
    File: fn_receiveContacts.sqf
    Description: Reçoit la liste des contacts et les affiche dans le smartphone.
    Params: [contacts]
*/
params [['_contacts', [], [[]]]];

// Exemple de remplissage de la liste (à adapter selon l'IDC de la liste dans smartphone.hpp)
private _display = findDisplay 88800;
if (isNull _display) exitWith {};
private _listBox = _display displayCtrl 88821;
lbClear _listBox;
{
    private _index = _listBox lbAdd (format ["%1 (%2)", _x select 1, _x select 2]); // contact_name (numéro)
    _listBox lbSetData [_index, str (_x select 0)]; // id du contact
} forEach _contacts; 