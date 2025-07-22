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

diag_log format ["[SMARTPHONE][CLIENT] Tentative d'appel serveur avec: name=%1, number=%2", _name, _number];
systemChat format ["[SMARTPHONE][CLIENT] Tentative d'appel serveur avec: %1, %2", _name, _number];

[player, _name, _number] remoteExecCall ["life_fnc_server_addContact", 2];

diag_log "[SMARTPHONE][CLIENT] RemoteExecCall effectué";
systemChat "[SMARTPHONE][CLIENT] RemoteExecCall effectué";

hint "Contact en cours d'enregistrement..."; 