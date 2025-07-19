#include "common.hpp"

class Life_company_management {
    idd = 9800;
    name = "life_company_menu";
    movingEnable = 0;
    enableSimulation = 1;

    class controls {
        class RscTitleBackground: Life_RscText {
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            idc = -1;
            x = 0.1;
            y = 0.2;
            w = 0.7;
            h = (1 / 25);
        };

        class MainBackground: Life_RscText {
            colorBackground[] = {0, 0, 0, 0.7};
            idc = -1;
            x = 0.1;
            y = 0.2 + (11 / 250);
            w = 0.7;
            h = 0.7;
        };

        class Title: Life_RscTitle {
            colorBackground[] = {0, 0, 0, 0};
            idc = -1;
            text = "Gestion d'Entreprise";
            x = 0.1;
            y = 0.2;
            w = 0.7;
            h = (1 / 25);
        };

        // Section Info Entreprise
        class CompanyInfoHeader: Life_RscText {
            idc = 9801;
            text = "Informations de l'Entreprise";
            x = 0.11;
            y = 0.25;
            w = 0.68;
            h = 0.04;
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            style = ST_CENTER;
        };

        class CompanyInfo: Life_RscStructuredText {
            idc = 9802;
            text = "";
            x = 0.12;
            y = 0.30;
            w = 0.66;
            h = 0.15;
            colorBackground[] = {0, 0, 0, 0};
            size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
            class Attributes {
                font = "RobotoCondensed";
                color = "#ffffff";
                colorLink = "#D09B43";
                align = "left";
                shadow = 1;
            };
        };

        // Section Employés
        class EmployeeListHeader: Life_RscText {
            idc = 9803;
            text = "Gestion des Employés";
            x = 0.11;
            y = 0.47;
            w = 0.68;
            h = 0.04;
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            style = ST_CENTER;
        };

        // Section Recrutement
        class NearbyPlayersHeader: Life_RscText {
            idc = 9810;
            text = "Recrutement";
            x = 0.51;
            y = 0.52;
            w = 0.27;
            h = 0.04;
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            style = ST_CENTER;
        };

        class NearbyPlayersCombo: Life_RscCombo {
            idc = 9811;
            x = 0.51;
            y = 0.57;
            w = 0.27;
            h = 0.03;
            colorBackground[] = {0, 0, 0, 0.3};
            onLBSelChanged = "";
            onMouseButtonClick = "[] call life_fnc_updateNearbyPlayers;";
        };

        class HireButton: Life_RscButtonMenu {
            idc = 9805;
            text = "Embaucher";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "[] spawn life_fnc_hireEmployee;";
            x = 0.51;
            y = 0.61;
            w = 0.27;
            h = (1 / 25);
        };

        // Section Gestion des Employés
        class EmployeeManagementHeader: Life_RscText {
            idc = 9812;
            text = "Gestion des Employés";
            x = 0.51;
            y = 0.66;
            w = 0.27;
            h = 0.04;
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            style = ST_CENTER;
        };

        class EmployeeCombo: Life_RscCombo {
            idc = 9813;
            x = 0.51;
            y = 0.71;
            w = 0.27;
            h = 0.03;
            colorBackground[] = {0, 0, 0, 0.3};
            onLBSelChanged = "";
            onMouseButtonClick = "[] call life_fnc_updateEmployeeCombo;";
        };

        class SalaryEdit: Life_RscEdit {
            idc = 9807;
            text = "";
            x = 0.51;
            y = 0.75;
            w = 0.27;
            h = (1 / 25);
            colorBackground[] = {0, 0, 0, 0.3};
        };

        class FireButton: Life_RscButtonMenu {
            idc = 9806;
            text = "Licencier";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "[] spawn life_fnc_fireEmployee;";
            x = 0.51;
            y = 0.79;
            w = 0.13;
            h = (1 / 25);
        };

        class SetSalaryButton: Life_RscButtonMenu {
            idc = 9808;
            text = "Définir Salaire";
            tooltip = "Définir le salaire de l'employé";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "[] spawn life_fnc_setEmployeeSalary;";
            x = 0.65;
            y = 0.79;
            w = 0.13;
            h = (1 / 25);
        };

        // Section Historique des Paiements
        class PaymentHistoryHeader: Life_RscText {
            idc = 9814;
            text = "Historique des Paiements";
            x = 0.12;
            y = 0.52;
            w = 0.38;
            h = 0.04;
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            style = ST_CENTER;
        };

        class PaymentHistoryList: Life_RscListBox {
            idc = 9815;
            text = "";
            sizeEx = 0.035;
            x = 0.12;
            y = 0.57;
            w = 0.38;
            h = 0.25;
            colorBackground[] = {0, 0, 0, 0.3};
            rowHeight = 0.04;
            onLBSelChanged = "";
        };

        // Boutons principaux
        class CloseButtonKey: Life_RscButtonMenu {
            idc = -1;
            text = "FERMER";
            onButtonClick = "closeDialog 0;";
            x = 0.11;
            y = 0.87;
            w = 0.15;
            h = (1 / 25);
            colorBackground[] = {0, 0, 0, 0.8};
        };

        class ManageButton: Life_RscButtonMenu {
            idc = 9809;
            text = "GÉRER";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "[] spawn life_fnc_companyManage;";
            x = 0.64;
            y = 0.87;
            w = 0.15;
            h = (1 / 25);
        };
    };
}; 