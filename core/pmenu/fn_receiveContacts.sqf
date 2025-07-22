/*
    File: fn_receiveContacts.sqf
    Description: Reçoit la liste des contacts et les affiche dans le smartphone.
    Params: [contacts]
*/
params [["_contacts", [], [[]]]];

diag_log format ["[CONTACTS][CLIENT] Contacts reçus (brut): %1", _contacts];

disableSerialization;
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

if (_contacts isEqualTo []) then {
    _listBox lbAdd "Aucun contact";
    systemChat "[CONTACTS] Aucun contact trouvé";
    diag_log "[CONTACTS][CLIENT] Aucun contact à afficher";
} else {
    {
        _x params [
            ["_id", 0, [0]],
            ["_name", "", [""]],
            ["_number", "", [""]]
        ];
        
        diag_log format ["[CONTACTS][CLIENT] Traitement contact: ID=%1, Nom=%2, Numéro=%3", _id, _name, _number];
        
        private _text = format ["%1 - %2", _name, _number];
        private _index = _listBox lbAdd _text;
        _listBox lbSetData [_index, str _id];
        
        diag_log format ["[CONTACTS][CLIENT] Contact ajouté à l'index %1: %2", _index, _text];
    } forEach _contacts;
    
    systemChat format ["[CONTACTS] %1 contacts affichés", count _contacts];
    diag_log format ["[CONTACTS][CLIENT] %1 contacts affichés avec succès", count _contacts];
    
    if (lbSize _listBox > 0) then {
        _listBox lbSetCurSel 0;
    };
}; 