class company_management {
    idd = 3800;
    name = "company_management";
    movingEnable = false;
    enableSimulation = true;

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
    };

    class controls {
        class CompanyInfoHeader: Life_RscStructuredText {
            idc = 3801;
            text = "$STR_Company_Info_Header";
            x = 0.21;
            y = 0.26;
            w = 0.58;
            h = 0.04;
            colorBackground[] = {0.1, 0.1, 0.1, 1};
        };

        class CompanyInfo: Life_RscStructuredText {
            idc = 3802;
            text = "";  // Sera rempli dynamiquement
            x = 0.21;
            y = 0.31;
            w = 0.58;
            h = 0.15;
            colorBackground[] = {0, 0, 0, 0.3};
        };

        class EmployeeListHeader: Life_RscStructuredText {
            idc = 3803;
            text = "$STR_Company_Employees_Header";
            x = 0.21;
            y = 0.47;
            w = 0.58;
            h = 0.04;
            colorBackground[] = {0.1, 0.1, 0.1, 1};
        };

        class EmployeeList: Life_RscListBox {
            idc = 3804;
            text = "";
            x = 0.21;
            y = 0.52;
            w = 0.58;
            h = 0.2;
            colorBackground[] = {0, 0, 0, 0.3};
            rowHeight = 0.04;
            sizeEx = 0.04;
        };

        class CloseButton: Life_RscButtonMenu {
            idc = -1;
            text = "$STR_Global_Close";
            onButtonClick = "closeDialog 0;";
            x = 0.21;
            y = 0.74;
            w = 0.1;
            h = 0.04;
        };

        class ManageButton: Life_RscButtonMenu {
            idc = 3805;
            text = "$STR_Company_Manage_Btn";
            onButtonClick = "[] call life_fnc_companyManage;";
            x = 0.69;
            y = 0.74;
            w = 0.1;
            h = 0.04;
        };
    };
}; 