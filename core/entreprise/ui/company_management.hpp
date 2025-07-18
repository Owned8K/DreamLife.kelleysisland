#include "..\..\..\dialog\common.hpp"

class company_management {
    idd = 9800;
    name = "company_management";
    movingEnable = false;
    enableSimulation = true;
    onLoad = "[] spawn life_fnc_companyMenu;";

    class controlsBackground {
        class Life_RscTitleBackground: Life_RscText {
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

        class InfoBackground: Life_RscText {
            colorBackground[] = {0, 0, 0, 0.5};
            idc = -1;
            x = 0.11;
            y = 0.25;
            w = 0.68;
            h = 0.2;
        };

        class EmployeeBackground: Life_RscText {
            colorBackground[] = {0, 0, 0, 0.5};
            idc = -1;
            x = 0.11;
            y = 0.47;
            w = 0.68;
            h = 0.36;
        };
    };

    class controls {
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
        class CompanyInfoHeader: Life_RscStructuredText {
            idc = 9801;
            text = "Informations de l'Entreprise";
            x = 0.11;
            y = 0.25;
            w = 0.68;
            h = 0.04;
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
        };

        class CompanyInfo: Life_RscStructuredText {
            idc = 9802;
            text = "";
            x = 0.12;
            y = 0.30;
            w = 0.66;
            h = 0.14;
            colorBackground[] = {0, 0, 0, 0};
            size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
        };

        // Section Employés
        class EmployeeListHeader: Life_RscStructuredText {
            idc = 9803;
            text = "Gestion des Employés";
            x = 0.11;
            y = 0.47;
            w = 0.68;
            h = 0.04;
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
        };

        class EmployeeList: Life_RscListBox {
            idc = 9804;
            text = "";
            sizeEx = 0.035;
            x = 0.12;
            y = 0.52;
            w = 0.38;
            h = 0.30;
            colorBackground[] = {0, 0, 0, 0.3};
            rowHeight = 0.04;
            onLBSelChanged = "_this spawn life_fnc_employeeSelected;";
        };

        // Boutons de gestion des employés
        class HireButton: Life_RscButtonMenu {
            idc = 9805;
            text = "Embaucher";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "[] spawn life_fnc_hireEmployee;";
            x = 0.51;
            y = 0.52;
            w = 0.27;
            h = (1 / 25);
        };

        class FireButton: Life_RscButtonMenu {
            idc = 9806;
            text = "Licencier";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "[] spawn life_fnc_fireEmployee;";
            x = 0.51;
            y = 0.58;
            w = 0.27;
            h = (1 / 25);
        };

        class SalaryEdit: Life_RscEdit {
            idc = 9807;
            text = "";
            x = 0.51;
            y = 0.64;
            w = 0.20;
            h = (1 / 25);
            colorBackground[] = {0, 0, 0, 0.3};
        };

        class SetSalaryButton: Life_RscButtonMenu {
            idc = 9808;
            text = "Définir Salaire";
            tooltip = "Définir le salaire de l'employé";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "[] spawn life_fnc_setEmployeeSalary;";
            x = 0.72;
            y = 0.64;
            w = 0.06;
            h = (1 / 25);
        };

        // Boutons principaux
        class CloseButton: Life_RscButtonMenu {
            idc = -1;
            text = "Fermer";
            onButtonClick = "closeDialog 0;";
            x = 0.1;
            y = 0.92;
            w = (6.25 / 40);
            h = (1 / 25);
        };

        class ManageButton: Life_RscButtonMenu {
            idc = 9809;
            text = "Gérer";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "[] spawn life_fnc_companyManage;";
            x = 0.7;
            y = 0.92;
            w = (6.25 / 40);
            h = (1 / 25);
        };
    };
}; 