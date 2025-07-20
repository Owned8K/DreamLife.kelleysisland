#include "common.hpp"

class Life_Smartphone {
    idd = 88800;
    name = "Life_Smartphone";
    movingEnable = false;
    enableSimulation = true;
    
    class controlsBackground {
        class PhoneBackground: RscPicture {
            idc = -1;
            text = "textures\phone\phone.paa";
            x = 0.318499 * safezoneW + safezoneX;
            y = 0.159 * safezoneH + safezoneY;
            w = 0.362969 * safezoneW;
            h = 0.682 * safezoneH;
        };
    };
    
    class controls {
        class MainContent: RscControlsGroup {
            idc = 88801;
            x = 0.3425 * safezoneW + safezoneX;
            y = 0.225 * safezoneH + safezoneY;
            w = 0.315 * safezoneW;
            h = 0.55 * safezoneH;
            
            class Controls {
                // Ici nous ajouterons les contrôles pour les différentes applications
            };
        };
        
        class CloseButton: RscButtonSilent {
            idc = -1;
            text = "";
            onButtonClick = "closeDialog 0;";
            x = 0.615 * safezoneW + safezoneX;
            y = 0.72 * safezoneH + safezoneY;
            w = 0.0257812 * safezoneW;
            h = 0.044 * safezoneH;
            tooltip = "Fermer";
            colorBackground[] = {0,0,0,0};
            colorBackgroundActive[] = {0,0,0,0};
            colorBackgroundDisabled[] = {0,0,0,0};
            colorFocused[] = {0,0,0,0};
        };
    };
}; 