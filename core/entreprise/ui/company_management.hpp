#include "..\..\..\dialog\common.hpp"

class company_management {
    idd = 9800; // Changement de l'IDD pour éviter les conflits
    name = "company_management";
    movingEnable = 0;
    enableSimulation = 1;
    onLoad = "diag_log 'company_management dialog onLoad called'; [] spawn life_fnc_initCompanyMenu;";

    class controlsBackground {
        class MainBackground: Life_RscText {
            colorBackground[] = {0, 0, 0, 0.7};
            idc = -1;
            x = 0.29375 * safezoneW + safezoneX;
            y = 0.225 * safezoneH + safezoneY;
            w = 0.4125 * safezoneW;
            h = 0.55 * safezoneH;
        };

        class Title: Life_RscTitle {
            idc = -1;
            text = "$STR_Company_Management_Title";
            x = 0.29375 * safezoneW + safezoneX;
            y = 0.181 * safezoneH + safezoneY;
            w = 0.4125 * safezoneW;
            h = 0.044 * safezoneH;
        };
    };

    class controls {
        class CompanyInfo: Life_RscStructuredText {
            idc = 9802; // Changement de l'IDC pour correspondre à l'IDD
            text = "";
            x = 0.304062 * safezoneW + safezoneX;
            y = 0.247 * safezoneH + safezoneY;
            w = 0.391875 * safezoneW;
            h = 0.363 * safezoneH;
            colorBackground[] = {0,0,0,0.5};
        };

        class CloseButton: Life_RscButtonMenu {
            idc = -1;
            text = "$STR_Global_Close";
            onButtonClick = "closeDialog 0;";
            x = 0.304062 * safezoneW + safezoneX;
            y = 0.731 * safezoneH + safezoneY;
            w = 0.391875 * safezoneW;
            h = 0.033 * safezoneH;
        };
    };
}; 