/*
    File: fn_openSmartphone.sqf
    Author: Bryan "Tonic" Boardwine
    Modified by: Your Name
    Description:
    Opens the smartphone interface
*/

if (!dialog) then {
    createDialog "Life_Smartphone";
    // Récupération des messages et contacts à l'ouverture
    [] call life_fnc_fetchMessages;
    [] call life_fnc_fetchContacts;
}; 