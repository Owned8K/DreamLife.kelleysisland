#include "..\..\..\dialog\common.hpp"

class company_management {
    idd = 9800;
    name = "company_management";
    movingEnable = 0;
    enableSimulation = 1;
    onLoad = "diag_log 'company_management dialog onLoad called'; [] spawn life_fnc_initCompanyMenu;";
    onUnload = "life_company_data_requested = nil; diag_log 'company_management dialog onUnload called';";

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
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
        };
    };

    class controls {
        class CompanyInfo: Life_RscStructuredText {
            idc = 9802;
            text = "Chargement..."; // Texte par défaut
            x = 0.304062 * safezoneW + safezoneX;
            y = 0.247 * safezoneH + safezoneY;
            w = 0.391875 * safezoneW;
            h = 0.363 * safezoneH;
            colorBackground[] = {0,0,0,0.1};
            size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
            sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
            class Attributes {
                font = "RobotoCondensed";
                color = "#ffffff";
                colorLink = "#D09B43";
                align = "left";
                shadow = 1;
            };
        };

        class CloseButton: Life_RscButtonMenu {
            idc = -1;
            text = "$STR_Global_Close";
            onButtonClick = "closeDialog 0;";
            x = 0.304062 * safezoneW + safezoneX;
            y = 0.731 * safezoneH + safezoneY;
            w = 0.391875 * safezoneW;
            h = 0.033 * safezoneH;
            colorBackground[] = {0,0,0,0.8};
        };
    };
}; 