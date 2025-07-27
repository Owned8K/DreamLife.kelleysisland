#include "common.hpp"

class Life_Distributeur {
    idd = 99900;
    name = "Life_Distributeur";
    movingEnable = false;
    enableSimulation = true;
    
    class controlsBackground {
        class Background: life_RscPicture {
            idc = -1;
            text = "textures\distributeur\distributeur.paa";
            x = 0.29375 * safezoneW + safezoneX;
            y = 0.225 * safezoneH + safezoneY;
            w = 0.4125 * safezoneW;
            h = 0.55 * safezoneH;
            colorText[] = {1,1,1,1};
        };
        
        class Title: Life_RscText {
            idc = -1;
            text = "DISTRIBUTEUR AUTOMATIQUE";
            colorBackground[] = {0, 0, 0, 0.8};
            colorText[] = {1, 1, 1, 1};
            font = "PuristaBold";
            sizeEx = 0.04;
            x = 0.29375 * safezoneW + safezoneX;
            y = 0.225 * safezoneH + safezoneY;
            w = 0.4125 * safezoneW;
            h = 0.04 * safezoneH;
            style = ST_CENTER;
        };
    };
    
    class controls {
        // === SLOTS ALIMENTS (4 colonnes x 5 rayons) ===
        // Rayon 1 - RedBull uniquement
        class Slot1_1: life_RscPicture {idc = 1001; text = "icons\ico_redgull.paa"; x = 0.39 * safezoneW + safezoneX; y = 0.36 * safezoneH + safezoneY; w = 0.032 * safezoneW; h = 0.042 * safezoneH; colorText[] = {1,1,1,1};};
        class Slot1_1Btn: Life_RscButtonMenu {idc = 1101; x = 0.39 * safezoneW + safezoneX; y = 0.36 * safezoneH + safezoneY; w = 0.032 * safezoneW; h = 0.042 * safezoneH; colorBackground[] = {0,0,0,0}; colorBackgroundFocused[] = {0,0,0,0}; colorBackground2[] = {0,0,0,0}; colorFocused[] = {0,0,0,0}; colorText[] = {0,0,0,0}; colorDisabled[] = {0,0,0,0}; colorBackgroundDisabled[] = {0,0,0,0}; onButtonClick = "['redgull'] call life_fnc_selectDistributeurItem;"; tooltip = "RedBull";};
        class Slot1_2: life_RscPicture {idc = 1002; text = "icons\ico_redgull.paa"; x = 0.43 * safezoneW + safezoneX; y = 0.36 * safezoneH + safezoneY; w = 0.032 * safezoneW; h = 0.042 * safezoneH; colorText[] = {1,1,1,1};};
        class Slot1_2Btn: Life_RscButtonMenu {idc = 1102; x = 0.43 * safezoneW + safezoneX; y = 0.36 * safezoneH + safezoneY; w = 0.032 * safezoneW; h = 0.042 * safezoneH; colorBackground[] = {0,0,0,0}; colorBackgroundFocused[] = {0,0,0,0}; colorBackground2[] = {0,0,0,0}; colorFocused[] = {0,0,0,0}; colorText[] = {0,0,0,0}; colorDisabled[] = {0,0,0,0}; colorBackgroundDisabled[] = {0,0,0,0}; onButtonClick = "['redgull'] call life_fnc_selectDistributeurItem;"; tooltip = "RedBull";};
        class Slot1_3: life_RscPicture {idc = 1003; text = "icons\ico_redgull.paa"; x = 0.47 * safezoneW + safezoneX; y = 0.36 * safezoneH + safezoneY; w = 0.032 * safezoneW; h = 0.042 * safezoneH; colorText[] = {1,1,1,1};};
        class Slot1_3Btn: Life_RscButtonMenu {idc = 1103; x = 0.47 * safezoneW + safezoneX; y = 0.36 * safezoneH + safezoneY; w = 0.032 * safezoneW; h = 0.042 * safezoneH; colorBackground[] = {0,0,0,0}; colorBackgroundFocused[] = {0,0,0,0}; colorBackground2[] = {0,0,0,0}; colorFocused[] = {0,0,0,0}; colorText[] = {0,0,0,0}; colorDisabled[] = {0,0,0,0}; colorBackgroundDisabled[] = {0,0,0,0}; onButtonClick = "['redgull'] call life_fnc_selectDistributeurItem;"; tooltip = "RedBull";};
        class Slot1_4: life_RscPicture {idc = 1004; text = "icons\ico_redgull.paa"; x = 0.51 * safezoneW + safezoneX; y = 0.36 * safezoneH + safezoneY; w = 0.032 * safezoneW; h = 0.042 * safezoneH; colorText[] = {1,1,1,1};};
        class Slot1_4Btn: Life_RscButtonMenu {idc = 1104; x = 0.51 * safezoneW + safezoneX; y = 0.36 * safezoneH + safezoneY; w = 0.032 * safezoneW; h = 0.042 * safezoneH; colorBackground[] = {0,0,0,0}; colorBackgroundFocused[] = {0,0,0,0}; colorBackground2[] = {0,0,0,0}; colorFocused[] = {0,0,0,0}; colorText[] = {0,0,0,0}; colorDisabled[] = {0,0,0,0}; colorBackgroundDisabled[] = {0,0,0,0}; onButtonClick = "['redgull'] call life_fnc_selectDistributeurItem;"; tooltip = "RedBull";};
        
        // Rayon 2 - Bouteilles d'eau
        class Slot2_1: life_RscPicture {idc = 1005; text = "icons\ico_waterBottle.paa"; x = 0.39 * safezoneW + safezoneX; y = 0.405 * safezoneH + safezoneY; w = 0.035 * safezoneW; h = 0.045 * safezoneH; colorText[] = {1,1,1,1};};
        class Slot2_1Btn: Life_RscButtonMenu {idc = 1105; x = 0.39 * safezoneW + safezoneX; y = 0.405 * safezoneH + safezoneY; w = 0.035 * safezoneW; h = 0.045 * safezoneH; colorBackground[] = {0,0,0,0}; colorBackgroundFocused[] = {0,0,0,0}; colorBackground2[] = {0,0,0,0}; colorFocused[] = {0,0,0,0}; colorText[] = {0,0,0,0}; colorDisabled[] = {0,0,0,0}; colorBackgroundDisabled[] = {0,0,0,0}; onButtonClick = "['waterBottle'] call life_fnc_selectDistributeurItem;"; tooltip = "Bouteille d'eau";};
        class Slot2_2: life_RscPicture {idc = 1006; text = "icons\ico_waterBottle.paa"; x = 0.435 * safezoneW + safezoneX; y = 0.405 * safezoneH + safezoneY; w = 0.035 * safezoneW; h = 0.045 * safezoneH; colorText[] = {1,1,1,1};};
        class Slot2_2Btn: Life_RscButtonMenu {idc = 1106; x = 0.435 * safezoneW + safezoneX; y = 0.405 * safezoneH + safezoneY; w = 0.035 * safezoneW; h = 0.045 * safezoneH; colorBackground[] = {0,0,0,0}; colorBackgroundFocused[] = {0,0,0,0}; colorBackground2[] = {0,0,0,0}; colorFocused[] = {0,0,0,0}; colorText[] = {0,0,0,0}; colorDisabled[] = {0,0,0,0}; colorBackgroundDisabled[] = {0,0,0,0}; onButtonClick = "['waterBottle'] call life_fnc_selectDistributeurItem;"; tooltip = "Bouteille d'eau";};
        class Slot2_3: life_RscPicture {idc = 1007; text = "icons\ico_waterBottle.paa"; x = 0.48 * safezoneW + safezoneX; y = 0.405 * safezoneH + safezoneY; w = 0.035 * safezoneW; h = 0.045 * safezoneH; colorText[] = {1,1,1,1};};
        class Slot2_3Btn: Life_RscButtonMenu {idc = 1107; x = 0.48 * safezoneW + safezoneX; y = 0.405 * safezoneH + safezoneY; w = 0.035 * safezoneW; h = 0.045 * safezoneH; colorBackground[] = {0,0,0,0}; colorBackgroundFocused[] = {0,0,0,0}; colorBackground2[] = {0,0,0,0}; colorFocused[] = {0,0,0,0}; colorText[] = {0,0,0,0}; colorDisabled[] = {0,0,0,0}; colorBackgroundDisabled[] = {0,0,0,0}; onButtonClick = "['waterBottle'] call life_fnc_selectDistributeurItem;"; tooltip = "Bouteille d'eau";};
        class Slot2_4: life_RscPicture {idc = 1008; text = "icons\ico_waterBottle.paa"; x = 0.525 * safezoneW + safezoneX; y = 0.405 * safezoneH + safezoneY; w = 0.035 * safezoneW; h = 0.045 * safezoneH; colorText[] = {1,1,1,1};};
        class Slot2_4Btn: Life_RscButtonMenu {idc = 1108; x = 0.525 * safezoneW + safezoneX; y = 0.405 * safezoneH + safezoneY; w = 0.035 * safezoneW; h = 0.045 * safezoneH; colorBackground[] = {0,0,0,0}; colorBackgroundFocused[] = {0,0,0,0}; colorBackground2[] = {0,0,0,0}; colorFocused[] = {0,0,0,0}; colorText[] = {0,0,0,0}; colorDisabled[] = {0,0,0,0}; colorBackgroundDisabled[] = {0,0,0,0}; onButtonClick = "['waterBottle'] call life_fnc_selectDistributeurItem;"; tooltip = "Bouteille d'eau";};
        
        // Rayon 3 - Donuts
        class Slot3_1: life_RscPicture {idc = 1009; text = "icons\ico_donuts.paa"; x = 0.39 * safezoneW + safezoneX; y = 0.46 * safezoneH + safezoneY; w = 0.035 * safezoneW; h = 0.045 * safezoneH; colorText[] = {1,1,1,1};};
        class Slot3_1Btn: Life_RscButtonMenu {idc = 1109; x = 0.39 * safezoneW + safezoneX; y = 0.46 * safezoneH + safezoneY; w = 0.035 * safezoneW; h = 0.045 * safezoneH; colorBackground[] = {0,0,0,0}; colorBackgroundFocused[] = {0,0,0,0}; colorBackground2[] = {0,0,0,0}; colorFocused[] = {0,0,0,0}; colorText[] = {0,0,0,0}; colorDisabled[] = {0,0,0,0}; colorBackgroundDisabled[] = {0,0,0,0}; onButtonClick = "['donuts'] call life_fnc_selectDistributeurItem;"; tooltip = "Donut";};
        class Slot3_2: life_RscPicture {idc = 1010; text = "icons\ico_donuts.paa"; x = 0.435 * safezoneW + safezoneX; y = 0.46 * safezoneH + safezoneY; w = 0.035 * safezoneW; h = 0.045 * safezoneH; colorText[] = {1,1,1,1};};
        class Slot3_2Btn: Life_RscButtonMenu {idc = 1110; x = 0.435 * safezoneW + safezoneX; y = 0.46 * safezoneH + safezoneY; w = 0.035 * safezoneW; h = 0.045 * safezoneH; colorBackground[] = {0,0,0,0}; colorBackgroundFocused[] = {0,0,0,0}; colorBackground2[] = {0,0,0,0}; colorFocused[] = {0,0,0,0}; colorText[] = {0,0,0,0}; colorDisabled[] = {0,0,0,0}; colorBackgroundDisabled[] = {0,0,0,0}; onButtonClick = "['donuts'] call life_fnc_selectDistributeurItem;"; tooltip = "Donut";};
        class Slot3_3: life_RscPicture {idc = 1011; text = "icons\ico_donuts.paa"; x = 0.48 * safezoneW + safezoneX; y = 0.46 * safezoneH + safezoneY; w = 0.035 * safezoneW; h = 0.045 * safezoneH; colorText[] = {1,1,1,1};};
        class Slot3_3Btn: Life_RscButtonMenu {idc = 1111; x = 0.48 * safezoneW + safezoneX; y = 0.46 * safezoneH + safezoneY; w = 0.035 * safezoneW; h = 0.045 * safezoneH; colorBackground[] = {0,0,0,0}; colorBackgroundFocused[] = {0,0,0,0}; colorBackground2[] = {0,0,0,0}; colorFocused[] = {0,0,0,0}; colorText[] = {0,0,0,0}; colorDisabled[] = {0,0,0,0}; colorBackgroundDisabled[] = {0,0,0,0}; onButtonClick = "['donuts'] call life_fnc_selectDistributeurItem;"; tooltip = "Donut";};
        class Slot3_4: life_RscPicture {idc = 1012; text = "icons\ico_donuts.paa"; x = 0.525 * safezoneW + safezoneX; y = 0.46 * safezoneH + safezoneY; w = 0.035 * safezoneW; h = 0.045 * safezoneH; colorText[] = {1,1,1,1};};
        class Slot3_4Btn: Life_RscButtonMenu {idc = 1112; x = 0.525 * safezoneW + safezoneX; y = 0.46 * safezoneH + safezoneY; w = 0.035 * safezoneW; h = 0.045 * safezoneH; colorBackground[] = {0,0,0,0}; colorBackgroundFocused[] = {0,0,0,0}; colorBackground2[] = {0,0,0,0}; colorFocused[] = {0,0,0,0}; colorText[] = {0,0,0,0}; colorDisabled[] = {0,0,0,0}; colorBackgroundDisabled[] = {0,0,0,0}; onButtonClick = "['donuts'] call life_fnc_selectDistributeurItem;"; tooltip = "Donut";};
        
        // Rayon 4 - Pommes
        class Slot4_1: life_RscPicture {idc = 1013; text = "icons\ico_apple.paa"; x = 0.39 * safezoneW + safezoneX; y = 0.505 * safezoneH + safezoneY; w = 0.035 * safezoneW; h = 0.045 * safezoneH; colorText[] = {1,1,1,1};};
        class Slot4_1Btn: Life_RscButtonMenu {idc = 1113; x = 0.39 * safezoneW + safezoneX; y = 0.505 * safezoneH + safezoneY; w = 0.035 * safezoneW; h = 0.045 * safezoneH; colorBackground[] = {0,0,0,0}; colorBackgroundFocused[] = {0,0,0,0}; colorBackground2[] = {0,0,0,0}; colorFocused[] = {0,0,0,0}; colorText[] = {0,0,0,0}; colorDisabled[] = {0,0,0,0}; colorBackgroundDisabled[] = {0,0,0,0}; onButtonClick = "['apple'] call life_fnc_selectDistributeurItem;"; tooltip = "Pomme";};
        class Slot4_2: life_RscPicture {idc = 1014; text = "icons\ico_apple.paa"; x = 0.435 * safezoneW + safezoneX; y = 0.505 * safezoneH + safezoneY; w = 0.035 * safezoneW; h = 0.045 * safezoneH; colorText[] = {1,1,1,1};};
        class Slot4_2Btn: Life_RscButtonMenu {idc = 1114; x = 0.435 * safezoneW + safezoneX; y = 0.505 * safezoneH + safezoneY; w = 0.035 * safezoneW; h = 0.045 * safezoneH; colorBackground[] = {0,0,0,0}; colorBackgroundFocused[] = {0,0,0,0}; colorBackground2[] = {0,0,0,0}; colorFocused[] = {0,0,0,0}; colorText[] = {0,0,0,0}; colorDisabled[] = {0,0,0,0}; colorBackgroundDisabled[] = {0,0,0,0}; onButtonClick = "['apple'] call life_fnc_selectDistributeurItem;"; tooltip = "Pomme";};
        class Slot4_3: life_RscPicture {idc = 1015; text = "icons\ico_apple.paa"; x = 0.48 * safezoneW + safezoneX; y = 0.505 * safezoneH + safezoneY; w = 0.035 * safezoneW; h = 0.045 * safezoneH; colorText[] = {1,1,1,1};};
        class Slot4_3Btn: Life_RscButtonMenu {idc = 1115; x = 0.48 * safezoneW + safezoneX; y = 0.505 * safezoneH + safezoneY; w = 0.035 * safezoneW; h = 0.045 * safezoneH; colorBackground[] = {0,0,0,0}; colorBackgroundFocused[] = {0,0,0,0}; colorBackground2[] = {0,0,0,0}; colorFocused[] = {0,0,0,0}; colorText[] = {0,0,0,0}; colorDisabled[] = {0,0,0,0}; colorBackgroundDisabled[] = {0,0,0,0}; onButtonClick = "['apple'] call life_fnc_selectDistributeurItem;"; tooltip = "Pomme";};
        class Slot4_4: life_RscPicture {idc = 1016; text = "icons\ico_apple.paa"; x = 0.525 * safezoneW + safezoneX; y = 0.505 * safezoneH + safezoneY; w = 0.035 * safezoneW; h = 0.045 * safezoneH; colorText[] = {1,1,1,1};};
        class Slot4_4Btn: Life_RscButtonMenu {idc = 1116; x = 0.525 * safezoneW + safezoneX; y = 0.505 * safezoneH + safezoneY; w = 0.035 * safezoneW; h = 0.045 * safezoneH; colorBackground[] = {0,0,0,0}; colorBackgroundFocused[] = {0,0,0,0}; colorBackground2[] = {0,0,0,0}; colorFocused[] = {0,0,0,0}; colorText[] = {0,0,0,0}; colorDisabled[] = {0,0,0,0}; colorBackgroundDisabled[] = {0,0,0,0}; onButtonClick = "['apple'] call life_fnc_selectDistributeurItem;"; tooltip = "Pomme";};
        
        // Rayon 5 - Pêches
        class Slot5_1: life_RscPicture {idc = 1017; text = "icons\ico_peach.paa"; x = 0.39 * safezoneW + safezoneX; y = 0.56 * safezoneH + safezoneY; w = 0.035 * safezoneW; h = 0.045 * safezoneH; colorText[] = {1,1,1,1};};
        class Slot5_1Btn: Life_RscButtonMenu {idc = 1117; x = 0.39 * safezoneW + safezoneX; y = 0.56 * safezoneH + safezoneY; w = 0.035 * safezoneW; h = 0.045 * safezoneH; colorBackground[] = {0,0,0,0}; colorBackgroundFocused[] = {0,0,0,0}; colorBackground2[] = {0,0,0,0}; colorFocused[] = {0,0,0,0}; colorText[] = {0,0,0,0}; colorDisabled[] = {0,0,0,0}; colorBackgroundDisabled[] = {0,0,0,0}; onButtonClick = "['peach'] call life_fnc_selectDistributeurItem;"; tooltip = "Pêche";};
        class Slot5_2: life_RscPicture {idc = 1018; text = "icons\ico_peach.paa"; x = 0.435 * safezoneW + safezoneX; y = 0.56 * safezoneH + safezoneY; w = 0.035 * safezoneW; h = 0.045 * safezoneH; colorText[] = {1,1,1,1};};
        class Slot5_2Btn: Life_RscButtonMenu {idc = 1118; x = 0.435 * safezoneW + safezoneX; y = 0.56 * safezoneH + safezoneY; w = 0.035 * safezoneW; h = 0.045 * safezoneH; colorBackground[] = {0,0,0,0}; colorBackgroundFocused[] = {0,0,0,0}; colorBackground2[] = {0,0,0,0}; colorFocused[] = {0,0,0,0}; colorText[] = {0,0,0,0}; colorDisabled[] = {0,0,0,0}; colorBackgroundDisabled[] = {0,0,0,0}; onButtonClick = "['peach'] call life_fnc_selectDistributeurItem;"; tooltip = "Pêche";};
        class Slot5_3: life_RscPicture {idc = 1019; text = "icons\ico_peach.paa"; x = 0.48 * safezoneW + safezoneX; y = 0.56 * safezoneH + safezoneY; w = 0.035 * safezoneW; h = 0.045 * safezoneH; colorText[] = {1,1,1,1};};
        class Slot5_3Btn: Life_RscButtonMenu {idc = 1119; x = 0.48 * safezoneW + safezoneX; y = 0.56 * safezoneH + safezoneY; w = 0.035 * safezoneW; h = 0.045 * safezoneH; colorBackground[] = {0,0,0,0}; colorBackgroundFocused[] = {0,0,0,0}; colorBackground2[] = {0,0,0,0}; colorFocused[] = {0,0,0,0}; colorText[] = {0,0,0,0}; colorDisabled[] = {0,0,0,0}; colorBackgroundDisabled[] = {0,0,0,0}; onButtonClick = "['peach'] call life_fnc_selectDistributeurItem;"; tooltip = "Pêche";};
        class Slot5_4: life_RscPicture {idc = 1020; text = "icons\ico_peach.paa"; x = 0.525 * safezoneW + safezoneX; y = 0.56 * safezoneH + safezoneY; w = 0.035 * safezoneW; h = 0.045 * safezoneH; colorText[] = {1,1,1,1};};
        class Slot5_4Btn: Life_RscButtonMenu {idc = 1120; x = 0.525 * safezoneW + safezoneX; y = 0.56 * safezoneH + safezoneY; w = 0.035 * safezoneW; h = 0.045 * safezoneH; colorBackground[] = {0,0,0,0}; colorBackgroundFocused[] = {0,0,0,0}; colorBackground2[] = {0,0,0,0}; colorFocused[] = {0,0,0,0}; colorText[] = {0,0,0,0}; colorDisabled[] = {0,0,0,0}; colorBackgroundDisabled[] = {0,0,0,0}; onButtonClick = "['peach'] call life_fnc_selectDistributeurItem;"; tooltip = "Pêche";};
        
        // === ÉCRAN DE SÉLECTION (Côté droit) ===
        class SelectionBackground: Life_RscText {
            idc = -1;
            text = "";
            colorBackground[] = {0, 0, 0, 0.8};
            x = 0.62 * safezoneW + safezoneX;
            y = 0.36 * safezoneH + safezoneY;
            w = 0.15 * safezoneW;
            h = 0.25 * safezoneH;
        };
        
        class SelectedItemIcon: life_RscPicture {
            idc = 2001;
            text = "";
            x = 0.625 * safezoneW + safezoneX;
            y = 0.37 * safezoneH + safezoneY;
            w = 0.04 * safezoneW;
            h = 0.05 * safezoneH;
            colorText[] = {1,1,1,1};
        };
        
        class SelectedItemName: Life_RscText {
            idc = 2002;
            text = "Sélectionnez un item";
            colorText[] = {1, 1, 1, 1};
            font = "PuristaBold";
            sizeEx = 0.035;
            x = 0.67 * safezoneW + safezoneX;
            y = 0.37 * safezoneH + safezoneY;
            w = 0.09 * safezoneW;
            h = 0.05 * safezoneH;
        };
        
        class StockLabel: Life_RscText {
            idc = -1;
            text = "Stock:";
            colorText[] = {1, 1, 1, 1};
            font = "PuristaMedium";
            sizeEx = 0.03;
            x = 0.625 * safezoneW + safezoneX;
            y = 0.44 * safezoneH + safezoneY;
            w = 0.04 * safezoneW;
            h = 0.03 * safezoneH;
        };
        
        class StockValue: Life_RscText {
            idc = 2003;
            text = "0";
            colorText[] = {0, 1, 0, 1};
            font = "PuristaBold";
            sizeEx = 0.03;
            x = 0.67 * safezoneW + safezoneX;
            y = 0.44 * safezoneH + safezoneY;
            w = 0.09 * safezoneW;
            h = 0.03 * safezoneH;
        };
        
        class PriceLabel: Life_RscText {
            idc = -1;
            text = "Prix:";
            colorText[] = {1, 1, 1, 1};
            font = "PuristaMedium";
            sizeEx = 0.03;
            x = 0.625 * safezoneW + safezoneX;
            y = 0.48 * safezoneH + safezoneY;
            w = 0.04 * safezoneW;
            h = 0.03 * safezoneH;
        };
        
        class PriceValue: Life_RscText {
            idc = 2004;
            text = "0€";
            colorText[] = {1, 1, 0, 1};
            font = "PuristaBold";
            sizeEx = 0.03;
            x = 0.67 * safezoneW + safezoneX;
            y = 0.48 * safezoneH + safezoneY;
            w = 0.09 * safezoneW;
            h = 0.03 * safezoneH;
        };
        
        class QuantityLabel: Life_RscText {
            idc = -1;
            text = "Quantité:";
            colorText[] = {1, 1, 1, 1};
            font = "PuristaMedium";
            sizeEx = 0.03;
            x = 0.625 * safezoneW + safezoneX;
            y = 0.52 * safezoneH + safezoneY;
            w = 0.04 * safezoneW;
            h = 0.03 * safezoneH;
        };
        
        class QuantityInput: Life_RscEdit {
            idc = 2005;
            text = "1";
            colorBackground[] = {0.1, 0.1, 0.1, 0.8};
            colorText[] = {1, 1, 1, 1};
            font = "PuristaMedium";
            sizeEx = 0.03;
            x = 0.67 * safezoneW + safezoneX;
            y = 0.52 * safezoneH + safezoneY;
            w = 0.09 * safezoneW;
            h = 0.03 * safezoneH;
        };
        
        class TotalLabel: Life_RscText {
            idc = -1;
            text = "Total:";
            colorText[] = {1, 1, 1, 1};
            font = "PuristaMedium";
            sizeEx = 0.03;
            x = 0.625 * safezoneW + safezoneX;
            y = 0.56 * safezoneH + safezoneY;
            w = 0.04 * safezoneW;
            h = 0.03 * safezoneH;
        };
        
        class TotalValue: Life_RscText {
            idc = 2006;
            text = "0€";
            colorText[] = {1, 0.5, 0, 1};
            font = "PuristaBold";
            sizeEx = 0.03;
            x = 0.67 * safezoneW + safezoneX;
            y = 0.56 * safezoneH + safezoneY;
            w = 0.09 * safezoneW;
            h = 0.03 * safezoneH;
        };
        
        // === BOUTONS DE CONTRÔLE ===
        class BuyButton: Life_RscButtonMenu {
            idc = 99903;
            text = "ACHETER";
            colorBackground[] = {0.2, 0.6, 0.2, 0.8};
            colorBackgroundFocused[] = {0.2, 0.6, 0.2, 1};
            colorBackground2[] = {0.2, 0.6, 0.2, 0.8};
            color[] = {1, 1, 1, 1};
            colorFocused[] = {1, 1, 1, 1};
            color2[] = {1, 1, 1, 1};
            colorDisabled[] = {0.5, 0.5, 0.5, 1};
            x = 0.30625 * safezoneW + safezoneX;
            y = 0.65 * safezoneH + safezoneY;
            w = 0.175 * safezoneW;
            h = 0.04 * safezoneH;
            onButtonClick = "[] call life_fnc_buyDistributeurItem;";
        };
        
        class CloseButton: Life_RscButtonMenu {
            idc = -1;
            text = "FERMER";
            colorBackground[] = {0.6, 0.2, 0.2, 0.8};
            colorBackgroundFocused[] = {0.6, 0.2, 0.2, 1};
            colorBackground2[] = {0.6, 0.2, 0.2, 0.8};
            color[] = {1, 1, 1, 1};
            colorFocused[] = {1, 1, 1, 1};
            color2[] = {1, 1, 1, 1};
            colorDisabled[] = {0.5, 0.5, 0.5, 1};
            x = 0.5 * safezoneW + safezoneX;
            y = 0.65 * safezoneH + safezoneY;
            w = 0.175 * safezoneW;
            h = 0.04 * safezoneH;
            onButtonClick = "closeDialog 0;";
        };
    };
}; 