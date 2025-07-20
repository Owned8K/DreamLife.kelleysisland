#include "common.hpp"

class Life_Smartphone {
    idd = 88800;
    name = "Life_Smartphone";
    movingEnable = false;
    enableSimulation = true;
    
    class controlsBackground {
        class PhoneBackground: life_RscPicture {
            idc = -1;
            text = "textures\phone\phone.paa";
            x = 0.6 * safezoneW + safezoneX;
            y = 0.418 * safezoneH + safezoneY;
            w = 0.5 * safezoneW;
            h = 0.582 * safezoneH;
            colorText[] = {1,1,1,1};
        };
    };
    
    class controls {
        class PhoneIcon: life_RscPicture {
            idc = 88803;
            text = "textures\phone\telephone.paa";
            x = (0.6 + 0.1) * safezoneW + safezoneX;
            y = (0.418 + 0.1) * safezoneH + safezoneY;
            w = 0.06 * safezoneW;
            h = 0.06 * safezoneH;
            colorText[] = {1,1,1,1};
        };

        class PhoneButton: Life_RscButtonMenu {
            idc = 88804;
            x = (0.6 + 0.1) * safezoneW + safezoneX;
            y = (0.418 + 0.1) * safezoneH + safezoneY;
            w = 0.06 * safezoneW;
            h = 0.06 * safezoneH;
            colorBackground[] = {0,0,0,0};
            colorBackgroundFocused[] = {0,0,0,0};
            colorBackground2[] = {0,0,0,0};
            colorFocused[] = {0,0,0,0};
            colorText[] = {0,0,0,0};
            onButtonClick = "hint 'Application Téléphone'";
            tooltip = "Téléphone";
        };

        class MessageIcon: life_RscPicture {
            idc = 88805;
            text = "textures\phone\messages.paa";
            x = (0.6 + 0.2) * safezoneW + safezoneX;
            y = (0.418 + 0.1) * safezoneH + safezoneY;
            w = 0.06 * safezoneW;
            h = 0.06 * safezoneH;
            colorText[] = {1,1,1,1};
        };

        class MessageButton: Life_RscButtonMenu {
            idc = 88806;
            x = (0.6 + 0.2) * safezoneW + safezoneX;
            y = (0.418 + 0.1) * safezoneH + safezoneY;
            w = 0.06 * safezoneW;
            h = 0.06 * safezoneH;
            colorBackground[] = {0,0,0,0};
            colorBackgroundFocused[] = {0,0,0,0};
            colorBackground2[] = {0,0,0,0};
            colorFocused[] = {0,0,0,0};
            colorText[] = {0,0,0,0};
            onButtonClick = "hint 'Application Messages'";
            tooltip = "Messages";
        };

        class MainContent: Life_RscControlsGroup {
            idc = 88802;
            x = 0.62 * safezoneW + safezoneX;
            y = 0.464 * safezoneH + safezoneY;
            w = 0.46 * safezoneW;
            h = 0.45 * safezoneH;
            
            class Controls {
            };
        };
    };
}; 