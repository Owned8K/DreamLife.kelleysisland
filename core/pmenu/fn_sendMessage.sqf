/*
    File: fn_sendMessage.sqf
    Description: Envoie un message à un autre joueur via le smartphone.
    Params: [receiver_pid, message_content]
*/
params [
    ["_receiver", "", [""]],
    ["_content", "", [""]]
];

if (_receiver isEqualTo "" || _content isEqualTo "") exitWith {
    hint "Veuillez remplir tous les champs.";
};

[player, _receiver, _content] remoteExecCall ["life_fnc_server_receiveMessage", 2];
hint "Message envoyé !"; 