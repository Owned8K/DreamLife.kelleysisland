#include "..\..\..\dialog\common.hpp"

class company_management {
    idd = 3800;
    name = "company_management";
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {
        class MainBackground: Life_RscText {
            idc = -1;
            colorBackground[] = {0, 0, 0, 0.7};
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
        // Informations de l'entreprise
        class CompanyInfo: Life_RscStructuredText {
            idc = 3802;
            text = "";
            x = 0.304062 * safezoneW + safezoneX;
            y = 0.247 * safezoneH + safezoneY;
            w = 0.391875 * safezoneW;
            h = 0.15 * safezoneH;
            colorBackground[] = {0,0,0,0.5};
        };

        // Liste des employés
        class EmployeeList: Life_RscListBox {
            idc = 3804;
            text = "";
            x = 0.304062 * safezoneW + safezoneX;
            y = 0.407 * safezoneH + safezoneY;
            w = 0.391875 * safezoneW;
            h = 0.2 * safezoneH;
            colorBackground[] = {0,0,0,0.5};
        };

        // Boutons
        class ManageButton: Life_RscButtonMenu {
            idc = 3805;
            text = "$STR_Company_Manage";
            onButtonClick = "[] call life_fnc_companyManage;";
            x = 0.45875 * safezoneW + safezoneX;
            y = 0.731 * safezoneH + safezoneY;
            w = 0.237187 * safezoneW;
            h = 0.033 * safezoneH;
        };

        class CloseButton: Life_RscButtonMenu {
            idc = -1;
            text = "$STR_Global_Close";
            onButtonClick = "closeDialog 0;";
            x = 0.304062 * safezoneW + safezoneX;
            y = 0.731 * safezoneH + safezoneY;
            w = 0.144375 * safezoneW;
            h = 0.033 * safezoneH;
        };
    };
}; 