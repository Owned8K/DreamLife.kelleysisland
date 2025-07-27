/*
    File: fn_fetchDistributeurs.sqf
    Description: Demande au serveur la liste des distributeurs disponibles.
*/
diag_log "[DISTRIBUTEUR][CLIENT] fn_fetchDistributeurs appelé";
systemChat "[DISTRIBUTEUR] Demande des distributeurs au serveur...";

// Vérifier si les données sont déjà disponibles côté serveur
if (isNil "life_distributeurs_data") then {
    diag_log "[DISTRIBUTEUR][CLIENT] Données non disponibles, demande au serveur...";
    [] remoteExecCall ["TON_fnc_server_fetchDistributeurs", 2];
} else {
    diag_log "[DISTRIBUTEUR][CLIENT] Données disponibles, envoi direct...";
    [life_distributeurs_data] call life_fnc_receiveDistributeurs;
}; 