#include "common.hpp"

class Life_Smartphone {
    idd = 88800;
    name = "Life_Smartphone";
    movingEnable = false;
    enableSimulation = true;
    
    class controlsBackground {
        class MainBackground: Life_RscText {
            colorBackground[] = {0, 0, 0, 0.7};
            idc = -1;
            x = 0.318499 * safezoneW + safezoneX;
            y = 0.159 * safezoneH + safezoneY;
            w = 0.362969 * safezoneW;
            h = 0.682 * safezoneH;
        };
    };
    
    class controls {
        class PhoneBackground: life_RscPicture {
            idc = -1;
            text = "textures\phone\phone.paa";
            x = 0.318499 * safezoneW + safezoneX;
            y = 0.159 * safezoneH + safezoneY;
            w = 0.362969 * safezoneW;
            h = 0.682 * safezoneH;
            colorText[] = {1,1,1,1};
        };

        class HeaderBackground: Life_RscText {
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            idc = -1;
            x = 0.318499 * safezoneW + safezoneX + (0.362969 * safezoneW * 0.1);
            y = 0.159 * safezoneH + safezoneY + (0.682 * safezoneH * 0.05);
            w = 0.362969 * safezoneW * 0.8;
            h = (1 / 25);
        };

        class Title: Life_RscTitle {
            colorBackground[] = {0, 0, 0, 0};
            idc = 88801;
            text = "Smartphone";
            x = 0.318499 * safezoneW + safezoneX + (0.362969 * safezoneW * 0.1);
            y = 0.159 * safezoneH + safezoneY + (0.682 * safezoneH * 0.05);
            w = 0.362969 * safezoneW * 0.8;
            h = (1 / 25);
        };
        
        class CloseButtonKey: Life_RscButtonMenu {
            idc = -1;
            text = "X";
            onButtonClick = "closeDialog 0;";
            x = 0.318499 * safezoneW + safezoneX + (0.362969 * safezoneW * 0.8);
            y = 0.159 * safezoneH + safezoneY + (0.682 * safezoneH * 0.05);
            w = (6.25 / 40);
            h = (1 / 25);
        };

        class MainContent: Life_RscControlsGroup {
            idc = 88802;
            x = 0.318499 * safezoneW + safezoneX + (0.362969 * safezoneW * 0.1);
            y = 0.159 * safezoneH + safezoneY + (0.682 * safezoneH * 0.15);
            w = 0.362969 * safezoneW * 0.8;
            h = 0.682 * safezoneH * 0.7;
            
            class Controls {
                // Ici nous ajouterons les contrôles pour les différentes applications
            };
        };
    };
}; 