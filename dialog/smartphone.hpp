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
            y = 0.418 * safezoneH + safezoneY;
            w = 0.5 * safezoneW;
            h = 0.582 * safezoneH;
            colorText[] = {1,1,1,1};
        };

        class MainContent: Life_RscControlsGroup {
            idc = 88802;
            x = 0.62 * safezoneW + safezoneX;
            y = 0.464 * safezoneH + safezoneY;
            w = 0.46 * safezoneW;
            h = 0.45 * safezoneH;
            
            class Controls {
                class PhoneAppButton: Life_RscButtonInvisible {
                    idc = 88803;
                    x = 0.01 * safezoneW;
                    y = 0.01 * safezoneH;
                    w = 0.08 * safezoneW;
                    h = 0.08 * safezoneH;
                    onButtonClick = "hint 'Application Téléphone'";
                    tooltip = "Téléphone";
                    class Controls {
                        class PhoneIcon: life_RscPicture {
                            idc = -1;
                            text = "textures\phone\telephone.paa";
                            x = 0;
                            y = 0;
                            w = 0.08 * safezoneW;
                            h = 0.08 * safezoneH;
                            colorText[] = {1,1,1,1};
                        };
                    };
                };

                class MessagesAppButton: Life_RscButtonInvisible {
                    idc = 88804;
                    x = 0.11 * safezoneW;
                    y = 0.01 * safezoneH;
                    w = 0.08 * safezoneW;
                    h = 0.08 * safezoneH;
                    onButtonClick = "hint 'Application Messages'";
                    tooltip = "Messages";
                    class Controls {
                        class MessageIcon: life_RscPicture {
                            idc = -1;
                            text = "textures\phone\messages.paa";
                            x = 0;
                            y = 0;
                            w = 0.08 * safezoneW;
                            h = 0.08 * safezoneH;
                            colorText[] = {1,1,1,1};
                        };
                    };
                };
            };
        };
    };
}; 