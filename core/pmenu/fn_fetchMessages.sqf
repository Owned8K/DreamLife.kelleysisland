/*
    File: fn_fetchMessages.sqf
    Description: Demande au serveur la liste des messages du joueur.
*/
[player] remoteExecCall ["life_fnc_server_fetchMessages", 2]; 