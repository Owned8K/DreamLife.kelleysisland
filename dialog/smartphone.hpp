#include "common.hpp"

class Life_Smartphone {
    idd = 88800;
    name = "Life_Smartphone";
    movingEnable = false;
    enableSimulation = true;
    
    class controlsBackground {};
    
    class controls {
        class PhoneBackground: life_RscPicture {
            idc = -1;
            text = "textures\phone\phone.paa";
            x = 0.6 * safezoneW + safezoneX;
            y = 0.318 * safezoneH + safezoneY;
            w = 0.45 * safezoneW;
            h = 0.682 * safezoneH;
            colorText[] = {1,1,1,1};
        };

        class MainContent: Life_RscControlsGroup {
            idc = 88802;
            x = 0.62 * safezoneW + safezoneX;
            y = 0.384 * safezoneH + safezoneY;
            w = 0.41 * safezoneW;
            h = 0.55 * safezoneH;
            
            class Controls {
                // Ici nous ajouterons les contrôles pour les différentes applications
            };
        };
    };
}; 