#include "..\..\..\script_macros.hpp"
/*
    File: fn_populateCompanyTypes.sqf
    Author: Gemini
    Description: Remplit le menu de création d'entreprise avec les types disponibles.
*/
disableSerialization;

private _display = findDisplay 3700;
private _companyList = _display displayCtrl 3701;
lbClear _companyList;

private _cfgCompanies = missionConfigFile >> "CfgCompanies";

diag_log ("life_fnc_populateCompanyTypes: _cfgCompanies = " + str(_cfgCompanies));
   

for "_i" from 0 to (count _cfgCompanies - 1) do {
    private _companyCfg = _cfgCompanies select _i;
    if (isClass _companyCfg) then {
        private _companyClass = configName _companyCfg;
        private _displayName = M_CONFIG(getText, "CfgCompanies", _companyClass, "displayName");

       diag_log ("life_fnc_populateCompanyTypes: Found company " + _companyClass + " with display name " + _displayName);
    
        _companyList lbAdd (localize _displayName);
        _companyList lbSetData [(lbSize _companyList) - 1, _companyClass];
    };
};

// Sélectionne le premier élément par défaut pour afficher ses détails
_companyList lbSetCurSel 0;
[_companyList, 0] call life_fnc_updateCompanyDetails;

diag_log "life_fnc_populateCompanyTypes finished";