/*
    File: fn_fetchContacts.sqf
    Description: Demande au serveur la liste des contacts du joueur.
*/
diag_log "[CONTACTS][CLIENT] fn_fetchContacts appelé";
systemChat "[CONTACTS] Demande des contacts au serveur...";

[player] remoteExecCall ["life_fnc_server_fetchContacts", 2]; 