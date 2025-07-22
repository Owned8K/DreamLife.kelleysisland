/*
    File: fn_fetchMessages.sqf
    Description: Demande les messages au serveur
*/

diag_log "[MESSAGES][CLIENT] fn_fetchMessages appelé";
systemChat "[MESSAGES] Demande des messages au serveur...";

[player] remoteExecCall ["life_fnc_server_fetchMessages", 2];
diag_log "[MESSAGES][CLIENT] RemoteExecCall effectué vers le serveur"; 