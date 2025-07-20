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
            x = (0.6 + 0.18) * safezoneW + safezoneX;
            y = (0.418 + 0.42) * safezoneH + safezoneY;
            w = 0.035 * safezoneW;
            h = 0.035 * safezoneH;
            colorText[] = {1,1,1,1};
        };

        class PhoneButton: Life_RscButtonMenu {
            idc = 88804;
            x = (0.6 + 0.18) * safezoneW + safezoneX;
            y = (0.418 + 0.42) * safezoneH + safezoneY;
            w = 0.035 * safezoneW;
            h = 0.035 * safezoneH;
            colorBackground[] = {0,0,0,0};
            colorBackgroundFocused[] = {0,0,0,0};
            colorBackground2[] = {0,0,0,0};
            colorFocused[] = {0,0,0,0};
            colorText[] = {0,0,0,0};
            colorDisabled[] = {0,0,0,0};
            colorBackgroundDisabled[] = {0,0,0,0};
            onButtonClick = "hint 'Application Téléphone'";
            tooltip = "Téléphone";
        };

        class MessageIcon: life_RscPicture {
            idc = 88805;
            text = "textures\phone\messages.paa";
            x = (0.6 + 0.24) * safezoneW + safezoneX;
            y = (0.418 + 0.42) * safezoneH + safezoneY;
            w = 0.035 * safezoneW;
            h = 0.035 * safezoneH;
            colorText[] = {1,1,1,1};
        };

        class MessageButton: Life_RscButtonMenu {
            idc = 88806;
            type = 16;
            style = "0x02 + 0xC0";
            x = (0.6 + 0.24) * safezoneW + safezoneX;
            y = (0.418 + 0.42) * safezoneH + safezoneY;
            w = 0.035 * safezoneW;
            h = 0.035 * safezoneH;
            colorBackground[] = {0,0,0,0};
            colorBackgroundFocused[] = {0,0,0,0};
            colorBackground2[] = {0,0,0,0};
            colorFocused[] = {0,0,0,0};
            colorText[] = {0,0,0,0};
            colorDisabled[] = {0,0,0,0};
            colorBackgroundDisabled[] = {0,0,0,0};
            onMouseEnter = "diag_log 'Message Button: Mouse Enter'";
            onMouseExit = "diag_log 'Message Button: Mouse Exit'";
            onButtonClick = "diag_log 'Message Button: Clicked'; hint 'Application Messages'";
            tooltip = "Messages";
            default = 0;
            text = "";
            shadow = 0;
            font = "RobotoCondensed";
            sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
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