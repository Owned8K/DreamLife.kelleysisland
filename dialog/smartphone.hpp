#include "common.hpp"

class Life_Smartphone {
    idd = 88800;
    name = "Life_Smartphone";
    movingEnable = false;
    enableSimulation = true;
    
    class controlsBackground {
        class Life_RscTitleBackground: Life_RscText {
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            idc = -1;
            x = 0.318499 * safezoneW + safezoneX;
            y = 0.159 * safezoneH + safezoneY;
            w = 0.362969 * safezoneW;
            h = (1 / 25);
        };

        class MainBackground: Life_RscText {
            colorBackground[] = {0, 0, 0, 0.7};
            idc = -1;
            x = 0.318499 * safezoneW + safezoneX;
            y = 0.159 * safezoneH + safezoneY + (11 / 250);
            w = 0.362969 * safezoneW;
            h = 0.682 * safezoneH - (22 / 250);
        };
    };
    
    class controls {
        class Title: Life_RscTitle {
            colorBackground[] = {0, 0, 0, 0};
            idc = 88801;
            text = "Smartphone";
            x = 0.318499 * safezoneW + safezoneX;
            y = 0.159 * safezoneH + safezoneY;
            w = 0.362969 * safezoneW;
            h = (1 / 25);
        };
        
        class CloseButtonKey: Life_RscButtonMenu {
            idc = -1;
            text = "$STR_Global_Close";
            onButtonClick = "closeDialog 0;";
            x = 0.318499 * safezoneW + safezoneX + (0.362969 * safezoneW) - (6.25 / 40);
            y = 0.159 * safezoneH + safezoneY + (1 / 25);
            w = (6.25 / 40);
            h = (1 / 25);
        };
    };
}; 