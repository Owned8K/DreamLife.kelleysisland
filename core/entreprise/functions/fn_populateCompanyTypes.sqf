#include "..\..\..\script_macros.hpp"
/*
    File: fn_populateCompanyTypes.sqf
    Author: Gemini
    Description: Remplit le menu de création d'entreprise avec les types disponibles.
*/
disableSerialization;

diag_log "FN_populateCompanyTypes called";

private _companyList = (findDisplay 3700) displayCtrl 3701;
lbClear _companyList;

diag_log "FN_populateCompanyTypes: Clearing the ListBox";

private _cfgCompanies = missionConfigFile >> "CfgCompanies";

diag_log ("life_fnc_populateCompanyTypes: _cfgCompanies = " + str(_cfgCompanies));
   

for "_i" from 0 to (count _cfgCompanies - 1) do {
    private _companyCfg = _cfgCompanies select _i;
    if (isClass _companyCfg) then {
        private _companyClass = configName _companyCfg;
        private _displayName = M_CONFIG(getText, "CfgCompanies", _companyClass, "displayName");

       diag_log ("life_fnc_populateCompanyTypes: Found company " + _companyClass + " with display name " + _displayName);
    
       _listIngame = _companyList lbAdd "mescouilles";

       diag_log(_listIngame);

       _testDial =  lbSetData [_companyList, _listIngame, "Tes mes couilles"];

       diag_log("List Index : " + _companyList);
        
        //_companyList lbSetData [0, _companyClass];
    }
    else {diag_log ("life_fnc_populateCompanyTypes: NOT Found company " + str(_companyClass) + " with display name " + str(_displayName));
    };
};

diag_log ("FN_populateCompanyTypes: Added items to ListBox");
   

// Sélectionne le premier élément par défaut pour afficher ses détails
_companyList lbSetCurSel 0;
[_companyList, 0] call life_fnc_updateCompanyDetails;

diag_log "life_fnc_populateCompanyTypes finished";