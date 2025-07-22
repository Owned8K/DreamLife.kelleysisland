/*
    File: fn_openSmartphone.sqf
    Author: Bryan "Tonic" Boardwine
    Modified by: Your Name
    Description:
    Opens the smartphone interface
*/

diag_log "[SMARTPHONE][CLIENT] Tentative d'ouverture du smartphone";

if (!dialog) then {
    createDialog "Life_Smartphone";
    diag_log "[SMARTPHONE][CLIENT] Interface créée";
    
    // Récupération des messages et contacts à l'ouverture
    diag_log "[SMARTPHONE][CLIENT] Demande des messages...";
    [] call life_fnc_fetchMessages;
    
    diag_log "[SMARTPHONE][CLIENT] Demande des contacts...";
    [] call life_fnc_fetchContacts;
    
    diag_log "[SMARTPHONE][CLIENT] Initialisation terminée";
}; 