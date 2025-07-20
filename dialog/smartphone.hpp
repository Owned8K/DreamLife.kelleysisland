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
            x = 0.3 * safezoneW + safezoneX;
            y = 0.159 * safezoneH + safezoneY;
            w = 0.4 * safezoneW;
            h = 0.682 * safezoneH;
            colorText[] = {1,1,1,1};
        };

        class MainContent: Life_RscControlsGroup {
            idc = 88802;
            x = 0.32 * safezoneW + safezoneX;
            y = 0.225 * safezoneH + safezoneY;
            w = 0.36 * safezoneW;
            h = 0.55 * safezoneH;
            
            class Controls {
                // Ici nous ajouterons les contrôles pour les différentes applications
            };
        };
    };
}; 