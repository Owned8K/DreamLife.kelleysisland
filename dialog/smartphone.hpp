#include "common.hpp"

class Life_Smartphone {
    idd = 88800;
    movingEnable = false;
    enableSimulation = true;
    
    class controlsBackground {
        class Background: RscText {
            idc = -1;
            x = 0.318499 * safezoneW + safezoneX;
            y = 0.159 * safezoneH + safezoneY;
            w = 0.362969 * safezoneW;
            h = 0.682 * safezoneH;
            colorBackground[] = {0,0,0,0.8};
        };
    };
    
    class controls {
        class CloseButton: RscButtonMenu {
            idc = -1;
            text = "X";
            onButtonClick = "closeDialog 0;";
            x = 0.615 * safezoneW + safezoneX;
            y = 0.17 * safezoneH + safezoneY;
            w = 0.0257812 * safezoneW;
            h = 0.044 * safezoneH;
            colorBackground[] = {0.5,0,0,0.8};
        };
    };
}; 