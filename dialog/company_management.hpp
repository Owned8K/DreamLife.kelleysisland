class company_management {
    idd = 9800;
    name = "company_management";
    movingEnable = false;
    enableSimulation = true;
    onLoad = "[] spawn life_fnc_companyMenu;";

    class controlsBackground {
        class MainBackground: Life_RscText {
            colorBackground[] = {0, 0, 0, 0.7};
            idc = -1;
            x = 0.2;
            y = 0.2;
            w = 0.6;
            h = 0.6;
        };

        class Title: Life_RscTitle {
            colorBackground[] = {0, 0, 0, 0};
            idc = -1;
            text = "$STR_Company_Management_Title";
            x = 0.2;
            y = 0.2;
            w = 0.6;
            h = 0.04;
        };

        // Séparateur entre les deux cadres
        class Separator: Life_RscText {
            colorBackground[] = {1, 1, 1, 0.5};
            idc = -1;
            x = 0.21;
            y = 0.46;
            w = 0.58;
            h = 0.002;
        };
    };

    class controls {
        // Premier Cadre - Informations de l'entreprise
        class InfoFrame: Life_RscText {
            colorBackground[] = {0, 0, 0, 0.5};
            idc = -1;
            x = 0.21;
            y = 0.26;
            w = 0.58;
            h = 0.18;
        };

        class CompanyInfoHeader: Life_RscStructuredText {
            idc = 9801;
            text = "$STR_Company_Info_Header";
            x = 0.21;
            y = 0.26;
            w = 0.58;
            h = 0.04;
            colorBackground[] = {0.1, 0.1, 0.1, 1};
        };

        class CompanyInfo: Life_RscStructuredText {
            idc = 9802;
            text = "";
            x = 0.22;
            y = 0.31;
            w = 0.56;
            h = 0.12;
            colorBackground[] = {0, 0, 0, 0};
            size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
        };

        // Deuxième Cadre - Gestion des employés
        class EmployeeFrame: Life_RscText {
            colorBackground[] = {0, 0, 0, 0.5};
            idc = -1;
            x = 0.21;
            y = 0.47;
            w = 0.58;
            h = 0.25;
        };

        class EmployeeListHeader: Life_RscStructuredText {
            idc = 9803;
            text = "$STR_Company_Employees_Header";
            x = 0.21;
            y = 0.47;
            w = 0.58;
            h = 0.04;
            colorBackground[] = {0.1, 0.1, 0.1, 1};
        };

        class EmployeeList: Life_RscListBox {
            idc = 9804;
            text = "";
            sizeEx = 0.035;
            x = 0.22;
            y = 0.52;
            w = 0.37;
            h = 0.19;
            colorBackground[] = {0, 0, 0, 0.3};
            rowHeight = 0.04;
            onLBSelChanged = "_this spawn life_fnc_employeeSelected;";
        };

        // Boutons de gestion des employés
        class HireButton: Life_RscButtonMenu {
            idc = 9805;
            text = "$STR_Company_Hire_Btn";
            onButtonClick = "[] spawn life_fnc_hireEmployee;";
            x = 0.60;
            y = 0.52;
            w = 0.18;
            h = 0.04;
            colorBackground[] = {0, 0.5, 0, 0.8};
        };

        class FireButton: Life_RscButtonMenu {
            idc = 9806;
            text = "$STR_Company_Fire_Btn";
            onButtonClick = "[] spawn life_fnc_fireEmployee;";
            x = 0.60;
            y = 0.57;
            w = 0.18;
            h = 0.04;
            colorBackground[] = {0.5, 0, 0, 0.8};
        };

        class SalaryEdit: Life_RscEdit {
            idc = 9807;
            text = "";
            x = 0.60;
            y = 0.62;
            w = 0.12;
            h = 0.04;
            colorBackground[] = {0, 0, 0, 0.3};
        };

        class SetSalaryButton: Life_RscButtonMenu {
            idc = 9808;
            text = "$";
            tooltip = "$STR_Company_SetSalary_Tooltip";
            onButtonClick = "[] spawn life_fnc_setEmployeeSalary;";
            x = 0.73;
            y = 0.62;
            w = 0.05;
            h = 0.04;
            colorBackground[] = {0.1, 0.1, 0.1, 0.8};
        };

        // Boutons principaux
        class CloseButton: Life_RscButtonMenu {
            idc = -1;
            text = "$STR_Global_Close";
            onButtonClick = "closeDialog 0;";
            x = 0.21;
            y = 0.74;
            w = 0.1;
            h = 0.04;
            colorBackground[] = {0.5, 0, 0, 0.8};
        };

        class ManageButton: Life_RscButtonMenu {
            idc = 9809;
            text = "$STR_Company_Manage_Btn";
            onButtonClick = "[] spawn life_fnc_companyManage;";
            x = 0.69;
            y = 0.74;
            w = 0.1;
            h = 0.04;
            colorBackground[] = {0, 0.5, 0, 0.8};
        };
    };
}; 