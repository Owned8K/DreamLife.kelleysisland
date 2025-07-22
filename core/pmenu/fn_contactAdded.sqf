/*
    File: fn_contactAdded.sqf
    Description: Appelé quand un contact a été ajouté avec succès
*/
params [["_success", false, [false]]];

if (_success) then {
    hint "Contact ajouté avec succès !";
    // Rafraîchit la liste des contacts
    [] call life_fnc_fetchContacts;
} else {
    hint "Erreur lors de l'ajout du contact.";
}; 