/*
    File: fn_addContact.sqf
    Description: Ajoute un contact à la base de données via le smartphone.
    Params: [contact_name, contact_number]
*/
params [
    ["_name", "", [""]],
    ["_number", "", [""]]
];

if (_name isEqualTo "" || _number isEqualTo "") exitWith {
    hint "Veuillez remplir tous les champs.";
};

hint format ["[SMARTPHONE][CLIENT] addContact appelé avec: %1, %2", _name, _number];
diag_log format ["[SMARTPHONE][CLIENT] addContact appelé avec: %1, %2", _name, _number];

[player, _name, _number] remoteExecCall ["life_fnc_server_addContact", 2];
hint "Contact enregistré !"; 