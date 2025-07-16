#include "..\..\..\dialog\common.hpp"

class CompanyCreation {
    idd = 3700; // IDD unique pour cette interface
    name = "CompanyCreation";
    movingEnable = 0;
    enableSimulation = 1;

    // Charge les données à l'ouverture de l'interface
    onLoad = "[] call life_fnc_populateCompanyTypes;";

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
            text = localize "STR_CompanyCreate_Title";
            x = 0.29375 * safezoneW + safezoneX;
            y = 0.181 * safezoneH + safezoneY;
            w = 0.4125 * safezoneW;
            h = 0.044 * safezoneH;
        };
    };

    class controls {
        // Liste déroulante pour les types d'entreprises
        class CompanyTypeList: Life_RscCombo {
            idc = 3701;
            x = 0.304062 * safezoneW + safezoneX;
            y = 0.247 * safezoneH + safezoneY;
            w = 0.391875 * safezoneW;
            h = 0.033 * safezoneH;
            colorText[] = {1,1,1,1};
            onLBSelChanged = "_this call life_fnc_updateCompanyDetails;";
        };

        // Zone de texte pour les détails de l'entreprise
        class CompanyDetails: Life_RscStructuredText {
            idc = 3702;
            x = 0.304062 * safezoneW + safezoneX;
            y = 0.291 * safezoneH + safezoneY;
            w = 0.391875 * safezoneW;
            h = 0.319 * safezoneH;
            colorBackground[] = {0,0,0,0.5};
        };

        // Champ pour entrer le nom de l'entreprise
        class CompanyNameLabel : Life_RscText {
            idc = -1;
            text = localize "STR_CompanyCreate_NameLabel";
            x = 0.304062 * safezoneW + safezoneX;
            y = 0.621 * safezoneH + safezoneY;
            w = 0.1 * safezoneW;
            h = 0.033 * safezoneH;
        };
        class CompanyNameInput: Life_RscEdit {
            idc = 3703;
            text = "";
            x = 0.412344 * safezoneW + safezoneX;
            y = 0.621 * safezoneH + safezoneY;
            w = 0.283594 * safezoneW;
            h = 0.033 * safezoneH;
        };

        // Boutons
        class BuyButton: Life_RscButtonMenu {
            idc = 3704;
            text = localize "STR_CompanyCreate_Buy";
            onButtonClick = "[] call life_fnc_buyCompany;";
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