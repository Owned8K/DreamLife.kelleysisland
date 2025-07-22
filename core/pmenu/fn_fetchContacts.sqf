/*
    File: fn_fetchContacts.sqf
    Description: Demande au serveur la liste des contacts du joueur.
*/
[player] remoteExecCall ["life_fnc_server_fetchContacts", 2]; 