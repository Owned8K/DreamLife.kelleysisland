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
            onButtonClick = "ctrlShow [88803, false]; ctrlShow [88804, false]; ctrlShow [88805, false]; ctrlShow [88806, false]; ctrlShow [88807, true]; ctrlShow [88808, true]; _display = findDisplay 88800; _listBox = _display displayCtrl 88808; lbClear _listBox; _index = _listBox lbAdd 'MESSAGE DE JOHN DOE'; _listBox lbSetTextRight [_index, 'Mission']; _index = _listBox lbAdd 'MESSAGE DE JANE SMITH'; _listBox lbSetTextRight [_index, 'Documents']; _index = _listBox lbAdd 'MESSAGE DE BOB WILSON'; _listBox lbSetTextRight [_index, 'RDV']; _index = _listBox lbAdd 'MESSAGE DU MAIRE'; _listBox lbSetTextRight [_index, 'Réunion']; _index = _listBox lbAdd 'MESSAGE DE LA POLICE'; _listBox lbSetTextRight [_index, 'Fourrière']; _index = _listBox lbAdd 'MESSAGE DU GARAGE'; _listBox lbSetTextRight [_index, 'Réparation']; _index = _listBox lbAdd 'MESSAGE DE L''HOPITAL'; _listBox lbSetTextRight [_index, 'Visite'];";
            tooltip = "Messages";
        };

        // Cadre des messages (initialement caché)
        class MessagesFrame: Life_RscText {
            idc = 88807;
            x = (0.6 + 0.17) * safezoneW + safezoneX;
            y = (0.418 + 0.12) * safezoneH + safezoneY;
            w = 0.16 * safezoneW;
            h = 0.35 * safezoneH;
            colorBackground[] = {0,0,0,0.8};
            show = 0;
        };

        class MessagesList: Life_RscListBox {
            idc = 88808;
            x = (0.6 + 0.175) * safezoneW + safezoneX;
            y = (0.418 + 0.13) * safezoneH + safezoneY;
            w = 0.15 * safezoneW;
            h = 0.33 * safezoneH;
            colorBackground[] = {0,0,0,0};
            colorSelectBackground[] = {0,0,0,0.5};
            colorSelectBackground2[] = {0,0,0,0.5};
            colorText[] = {1,1,1,1};
            colorSelect[] = {1,1,1,1};
            colorSelect2[] = {1,1,1,1};
            colorScrollbar[] = {0.95,0.95,0.95,1};
            style = 16 + 0x200; // ST_MULTI + LB_TEXTURES
            sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
            rowHeight = 0.04;
            show = 0;
        };

        class MainContent: Life_RscControlsGroup {
            idc = 88802;
            x = 1 * safezoneW + safezoneX;
            y = 1 * safezoneH + safezoneY;
            w = 1 * safezoneW;
            h = 1 * safezoneH;
            
            class Controls {
            };
        };
    };
}; 