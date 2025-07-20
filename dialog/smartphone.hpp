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
            x = 0.386562 * safezoneW + safezoneX;
            y = 0.159 * safezoneH + safezoneY;
            w = 0.226875 * safezoneW;
            h = 0.682 * safezoneH;
            colorText[] = {1,1,1,1};
        };

        class MainContent: Life_RscControlsGroup {
            idc = 88802;
            x = 0.396562 * safezoneW + safezoneX;
            y = 0.225 * safezoneH + safezoneY;
            w = 0.206875 * safezoneW;
            h = 0.55 * safezoneH;
            
            class Controls {
                // Ici nous ajouterons les contrôles pour les différentes applications
            };
        };
    };
}; 