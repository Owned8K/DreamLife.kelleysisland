#include "..\..\..\script_macros.hpp"
/*
    File: fn_populateCompanyTypes.sqf
    Author: Gemini
    Description: Remplit le menu de création d'entreprise avec les types disponibles.
*/
createDialog "CompanyCreation";

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
    
        private _index = _companyList lbAdd (localize _displayName);
        if (_index >= 0) then {
			_companyList lbSetData [_index, _companyClass];
			diag_log ("life_fnc_populateCompanyTypes: Added company " + str(_companyClass) + " to ListBox at index " + str(_index));
		} else {
			diag_log ("life_fnc_populateCompanyTypes: FAILED to add company " + str(_companyClass) + " to ListBox. lbAdd returned " + str(_index));
		};

        diag_log ("life_fnc_populateCompanyTypes: Added company " + str(_companyClass) + " to ListBox at index " + str(_index));
    }
    else
    {
        diag_log ("life_fnc_populateCompanyTypes: NOT Found company " + str(_companyClass) + " with display name " + str(_displayName));
    };
};

diag_log ("FN_populateCompanyTypes: Added items to ListBox");
   

// Sélectionne le premier élément par défaut pour afficher ses détails
_companyList lbSetCurSel 0;
[_companyList, 0] call life_fnc_updateCompanyDetails;

diag_log "life_fnc_populateCompanyTypes finished";