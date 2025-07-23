#include "common.hpp"

class Life_Smartphone {
    idd = 88800;
    name = "Life_Smartphone";
    movingEnable = false;
    enableSimulation = true;
    onLoad = "[] spawn {systemChat '[CONTACTS] Initialisation...'; [] call life_fnc_fetchContacts; [] call life_fnc_fetchMessages;};";
    
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
            x = (0.6 + 0.22) * safezoneW + safezoneX;
            y = (0.418 + 0.42) * safezoneH + safezoneY;
            w = 0.035 * safezoneW;
            h = 0.035 * safezoneH;
            colorText[] = {1,1,1,1};
        };

        class MessageButton: Life_RscButtonMenu {
            idc = 88806;
            x = (0.6 + 0.22) * safezoneW + safezoneX;
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
            onButtonClick = "ctrlShow [88803, false]; ctrlShow [88804, false]; ctrlShow [88805, false]; ctrlShow [88806, false]; ctrlShow [88807, true]; ctrlShow [88808, true]; ctrlShow [88809, true]; ctrlShow [88810, true]; ctrlShow [88814, true]; ctrlShow [88815, true]; ctrlShow [88819, false]; ctrlShow [88817, true];ctrlShow [88818, false]; ctrlShow [88821, false]; ctrlShow [88822, false]; ctrlShow [88823, false]; ctrlShow [88824, false]; ctrlShow [88832, false]; _display = findDisplay 88800; _listBox = _display displayCtrl 88808; lbClear _listBox; [] call life_fnc_fetchMessages;";
            tooltip = "Messages";
        };

        class ContactIcon: life_RscPicture {
            idc = 88818;
            text = "textures\phone\contact.paa";
            x = (0.6 + 0.26) * safezoneW + safezoneX;
            y = (0.418 + 0.42) * safezoneH + safezoneY;
            w = 0.035 * safezoneW;
            h = 0.035 * safezoneH;
            colorText[] = {1,1,1,1};
        };

        class ContactButton: Life_RscButtonMenu {
            idc = 88819;
            x = (0.6 + 0.26) * safezoneW + safezoneX;
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
            onButtonClick = "systemChat '[CONTACTS] Chargement des contacts...'; ctrlShow [88803, false]; ctrlShow [88804, false]; ctrlShow [88805, false]; ctrlShow [88806, false]; ctrlShow [88818, false]; ctrlShow [88819, false]; ctrlShow [88820, true]; ctrlShow [88821, true]; ctrlShow [88822, true]; ctrlShow [88823, true]; ctrlShow [88824, true]; ctrlShow [88832, true]; [] call life_fnc_fetchContacts;";
            tooltip = "Contact";
        };

        class MessagesFrame: Life_RscText {
            idc = 88807;
            x = (0.6 + 0.17) * safezoneW + safezoneX;
            y = (0.418 + 0.12) * safezoneH + safezoneY;
            w = 0.16 * safezoneW;
            h = 0.35 * safezoneH;
            colorBackground[] = {0,0,0,0.8};
            show = 0;
        };

        class MessagesTitle: Life_RscText {
            idc = 88814;
            text = "Messages";
            x = (0.6 + 0.195) * safezoneW + safezoneX;
            y = (0.418 + 0.13) * safezoneH + safezoneY;
            w = 0.12 * safezoneW;
            h = 0.025 * safezoneH;
            colorText[] = {1,1,1,1};
            colorBackground[] = {0,0,0,0};
            font = "RobotoCondensedBold";
            sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
            show = 0;
        };

        class BackButton: Life_RscButtonMenu {
            idc = 88815;
            x = (0.6 + 0.175) * safezoneW + safezoneX;
            y = (0.418 + 0.1275) * safezoneH + safezoneY;
            w = 0.02 * safezoneW;
            h = 0.03 * safezoneH;
            style = 2;
            colorBackground[] = {0,0,0,0};
            colorBackgroundFocused[] = {0,0,0,0};
            colorBackground2[] = {0,0,0,0};
            colorFocused[] = {0,0,0,0};
            colorText[] = {1,1,1,1};
            color[] = {1,1,1,1};
            colorActive[] = {1,1,1,1};
            colorDisabled[] = {1,1,1,1};
            colorBackgroundDisabled[] = {0,0,0,0};
            text = "←";
            sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.5)";
            font = "PuristaBold";
            onButtonClick = "ctrlShow [88807, false]; ctrlShow [88808, false]; ctrlShow [88809, false]; ctrlShow [88810, false]; ctrlShow [88811, false]; ctrlShow [88812, false]; ctrlShow [88813, false]; ctrlShow [88814, false]; ctrlShow [88815, false]; ctrlShow [88816, false]; ctrlShow [88803, true]; ctrlShow [88804, true]; ctrlShow [88805, true]; ctrlShow [88806, true]; ctrlShow [88817, false]; ctrlShow [88818, true]; ctrlShow [88819, true];";
            show = 0;
        };

        class MessagesList: Life_RscListBox {
            idc = 88808;
            x = (0.6 + 0.175) * safezoneW + safezoneX;
            y = (0.418 + 0.16) * safezoneH + safezoneY;
            w = 0.15 * safezoneW;
            h = 0.30 * safezoneH;
            colorBackground[] = {0,0,0,0};
            colorSelectBackground[] = {0,0,0,0.5};
            colorSelectBackground2[] = {0,0,0,0.5};
            colorText[] = {1,1,1,1};
            colorSelect[] = {1,1,1,1};
            colorSelect2[] = {1,1,1,1};
            colorScrollbar[] = {0.95,0.95,0.95,1};
            sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.7)";
            rowHeight = 0.04;
            style = 16;
            onLBSelChanged = "_display = findDisplay 88800; _listBox = _display displayCtrl 88808; _index = lbCurSel _listBox; if (_index != -1) then { _name = _listBox lbText _index; ctrlShow [88808, false]; ctrlShow [88809, false]; ctrlShow [88810, false]; ctrlShow [88817, true]; ctrlShow [88812, true]; ctrlShow [88813, true]; ctrlShow [88814, true]; ctrlShow [88815, true]; ctrlShow [88816, true]; _title = _display displayCtrl 88814; _title ctrlSetText _name; _convList = _display displayCtrl 88817; lbClear _convList; _convList lbAdd '   Salut, comment vas-tu ?'; _convList lbSetTextRight [0, '']; _convList lbAdd ''; _convList lbSetTextRight [1, 'Très bien et toi ?   ']; _convList lbAdd '   Super ! Tu es dispo pour une mission ?'; _convList lbSetTextRight [2, '']; _convList lbAdd ''; _convList lbSetTextRight [3, 'Oui bien sûr, dis-moi   ']; _convList lbAdd '   RDV au garage dans 10min'; _convList lbSetTextRight [4, '']; _convList lbAdd ''; _convList lbSetTextRight [5, 'J''arrive !   ']; };";
            show = 0;
        };

        class ConversationList: Life_RscListBox {
            idc = 88817;
            x = (0.6 + 0.175) * safezoneW + safezoneX;
            y = (0.418 + 0.16) * safezoneH + safezoneY;
            w = 0.15 * safezoneW;
            h = 0.25 * safezoneH;
            colorBackground[] = {0,0,0,0};
            colorSelectBackground[] = {0,0,0,0};
            colorSelectBackground2[] = {0,0,0,0};
            colorText[] = {1,1,1,1};
            colorSelect[] = {1,1,1,1};
            colorSelect2[] = {1,1,1,1};
            colorScrollbar[] = {0.95,0.95,0.95,1};
            sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.7)";
            rowHeight = 0.04;
            style = 16;
            enable = 0;
            show = 0;
        };

        class PlusIcon: life_RscPicture {
            idc = 88809;
            text = "textures\phone\plus.paa";
            x = (0.6 + 0.28) * safezoneW + safezoneX;
            y = (0.418 + 0.41) * safezoneH + safezoneY;
            w = 0.035 * safezoneW;
            h = 0.035 * safezoneH;
            colorText[] = {1,1,1,1};
            show = 0;
        };

        class PlusButton: Life_RscButtonMenu {
            idc = 88810;
            x = (0.6 + 0.28) * safezoneW + safezoneX;
            y = (0.418 + 0.41) * safezoneH + safezoneY;
            w = 0.035 * safezoneW;
            h = 0.035 * safezoneH;
            colorBackground[] = {0,0,0,0};
            colorBackgroundFocused[] = {0,0,0,0};
            colorBackground2[] = {0,0,0,0};
            colorFocused[] = {0,0,0,0};
            colorText[] = {0,0,0,0};
            colorDisabled[] = {0,0,0,0};
            colorBackgroundDisabled[] = {0,0,0,0};
            onButtonClick = "ctrlShow [88808, false]; ctrlShow [88809, false]; ctrlShow [88810, false]; ctrlShow [88811, true]; ctrlShow [88812, true]; ctrlShow [88813, true]; ctrlShow [88814, true]; ctrlShow [88815, true]; ctrlShow [88816, true]; _display = findDisplay 88800; _listBox = _display displayCtrl 88811; lbClear _listBox; _title = _display displayCtrl 88814; _title ctrlSetText 'Nouveau message';";
            tooltip = "Nouveau message";
            show = 0;
        };

        class NewMessageList: Life_RscListBox {
            idc = 88811;
            x = (0.6 + 0.175) * safezoneW + safezoneX;
            y = (0.418 + 0.13) * safezoneH + safezoneY;
            w = 0.15 * safezoneW;
            h = 0.25 * safezoneH;
            colorBackground[] = {0,0,0,0};
            colorSelectBackground[] = {0,0,0,0};
            colorSelectBackground2[] = {0,0,0,0};
            colorText[] = {1,1,1,1};
            colorSelect[] = {1,1,1,1};
            colorSelect2[] = {1,1,1,1};
            colorScrollbar[] = {0.95,0.95,0.95,1};
            sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.7)";
            rowHeight = 0.04;
            style = 16;
            canDrag = 0;
            enable = 0;
            show = 0;
        };

        class MessageInput: Life_RscEdit {
            idc = 88812;
            x = (0.6 + 0.175) * safezoneW + safezoneX;
            y = (0.418 + 0.42) * safezoneH + safezoneY;
            w = 0.13 * safezoneW;
            h = 0.03 * safezoneH;
            colorBackground[] = {0,0,0,0.5};
            colorText[] = {1,1,1,1};
            text = "";
            sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.7)";
            show = 0;
        };

        class SendIcon: life_RscPicture {
            idc = 88816;
            text = "textures\phone\send.paa";
            x = (0.6 + 0.31) * safezoneW + safezoneX;
            y = (0.418 + 0.42) * safezoneH + safezoneY;
            w = 0.02 * safezoneW;
            h = 0.03 * safezoneH;
            colorText[] = {1,1,1,1};
            show = 0;
        };

        class SendButton: Life_RscButtonMenu {
            idc = 88813;
            x = (0.6 + 0.31) * safezoneW + safezoneX;
            y = (0.418 + 0.42) * safezoneH + safezoneY;
            w = 0.02 * safezoneW;
            h = 0.03 * safezoneH;
            colorBackground[] = {0,0,0,0};
            colorBackgroundFocused[] = {0,0,0,0};
            colorBackground2[] = {0,0,0,0};
            colorFocused[] = {0,0,0,0};
            colorText[] = {0,0,0,0};
            onButtonClick = "_display = findDisplay 88800; _receiver = ctrlText (_display displayCtrl 88811); _content = ctrlText (_display displayCtrl 88812); [_receiver, _content] call life_fnc_sendMessage;";
            show = 0;
        };

        class ContactsFrame: Life_RscText {
            idc = 88820;
            x = (0.6 + 0.17) * safezoneW + safezoneX;
            y = (0.418 + 0.12) * safezoneH + safezoneY;
            w = 0.16 * safezoneW;
            h = 0.35 * safezoneH;
            colorBackground[] = {0,0,0,0.8};
            show = 0;
        };

        class ContactsTitle: Life_RscText {
            idc = 88823;
            text = "Contacts";
            x = (0.6 + 0.195) * safezoneW + safezoneX;
            y = (0.418 + 0.13) * safezoneH + safezoneY;
            w = 0.12 * safezoneW;
            h = 0.025 * safezoneH;
            colorText[] = {1,1,1,1};
            colorBackground[] = {0,0,0,0};
            font = "RobotoCondensedBold";
            sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
            show = 0;
        };

        class ContactsBackButton: Life_RscButtonMenu {
            idc = 88824;
            x = (0.6 + 0.175) * safezoneW + safezoneX;
            y = (0.418 + 0.1275) * safezoneH + safezoneY;
            w = 0.02 * safezoneW;
            h = 0.03 * safezoneH;
            style = 2;
            colorBackground[] = {0,0,0,0};
            colorBackgroundFocused[] = {0,0,0,0};
            colorBackground2[] = {0,0,0,0};
            colorFocused[] = {0,0,0,0};
            colorText[] = {1,1,1,1};
            color[] = {1,1,1,1};
            colorActive[] = {1,1,1,1};
            colorDisabled[] = {1,1,1,1};
            colorBackgroundDisabled[] = {0,0,0,0};
            text = "←";
            sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.5)";
            font = "PuristaBold";
            onButtonClick = "ctrlShow [88820, false]; ctrlShow [88821, false]; ctrlShow [88822, false]; ctrlShow [88823, false]; ctrlShow [88824, false]; ctrlShow [88832, false]; ctrlShow [88818, true]; ctrlShow [88819, true]; ctrlShow [88803, true]; ctrlShow [88804, true]; ctrlShow [88805, true]; ctrlShow [88806, true];";
            show = 0;
        };

        class ContactsList: Life_RscListBox {
            idc = 88821;
            x = (0.6 + 0.175) * safezoneW + safezoneX;
            y = (0.418 + 0.16) * safezoneH + safezoneY;
            w = 0.15 * safezoneW;
            h = 0.30 * safezoneH;
            colorBackground[] = {0,0,0,0};
            colorSelectBackground[] = {0,0,0,0.5};
            colorSelectBackground2[] = {0,0,0,0.5};
            colorText[] = {1,1,1,1};
            colorSelect[] = {1,1,1,1};
            colorSelect2[] = {1,1,1,1};
            colorScrollbar[] = {0.95,0.95,0.95,1};
            sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.7)";
            rowHeight = 0.04;
            style = 16;
            show = 0;
        };

        class AddContactFrame: Life_RscText {
            idc = 88825;
            x = (0.6 + 0.17) * safezoneW + safezoneX;
            y = (0.418 + 0.12) * safezoneH + safezoneY;
            w = 0.16 * safezoneW;
            h = 0.35 * safezoneH;
            colorBackground[] = {0,0,0,0.8};
            show = 0;
        };

        class AddContactTitle: Life_RscText {
            idc = 88826;
            text = "Ajouter un contact";
            x = (0.6 + 0.195) * safezoneW + safezoneX;
            y = (0.418 + 0.13) * safezoneH + safezoneY;
            w = 0.12 * safezoneW;
            h = 0.025 * safezoneH;
            colorText[] = {1,1,1,1};
            colorBackground[] = {0,0,0,0};
            font = "RobotoCondensedBold";
            sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
            show = 0;
        };

        class AddContactBackButton: Life_RscButtonMenu {
            idc = 88827;
            x = (0.6 + 0.175) * safezoneW + safezoneX;
            y = (0.418 + 0.1275) * safezoneH + safezoneY;
            w = 0.02 * safezoneW;
            h = 0.03 * safezoneH;
            style = 2;
            colorBackground[] = {0,0,0,0};
            colorBackgroundFocused[] = {0,0,0,0};
            colorBackground2[] = {0,0,0,0};
            colorFocused[] = {0,0,0,0};
            colorText[] = {1,1,1,1};
            color[] = {1,1,1,1};
            colorActive[] = {1,1,1,1};
            colorDisabled[] = {1,1,1,1};
            colorBackgroundDisabled[] = {0,0,0,0};
            text = "←";
            sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.5)";
            font = "PuristaBold";
            onButtonClick = "ctrlShow [88825, false]; ctrlShow [88826, false]; ctrlShow [88827, false]; ctrlShow [88829, false]; ctrlShow [88830, false]; ctrlShow [88831, false]; ctrlShow [88833, false]; ctrlShow [88834, false]; ctrlShow [88820, true]; ctrlShow [88821, true]; ctrlShow [88822, true]; ctrlShow [88823, true]; ctrlShow [88824, true]; ctrlShow [88832, true];";
            show = 0;
        };

        class AddContactPlusIcon: life_RscPicture {
            idc = 88832;
            text = "textures\phone\plus.paa";
            x = (0.6 + 0.29) * safezoneW + safezoneX;
            y = (0.418 + 0.41) * safezoneH + safezoneY;
            w = 0.04 * safezoneW;
            h = 0.04 * safezoneH;
            colorText[] = {1,1,1,1};
            show = 0;
        };

        class AddContactButton: Life_RscButtonMenu {
            idc = 88822;
            x = (0.6 + 0.29) * safezoneW + safezoneX;
            y = (0.418 + 0.41) * safezoneH + safezoneY;
            w = 0.04 * safezoneW;
            h = 0.04 * safezoneH;
            colorBackground[] = {0,0,0,0};
            colorBackgroundFocused[] = {0,0,0,0};
            colorBackground2[] = {0,0,0,0};
            colorFocused[] = {0,0,0,0};
            colorText[] = {0,0,0,0};
            colorDisabled[] = {0,0,0,0};
            colorBackgroundDisabled[] = {0,0,0,0};
            text = "";
            onButtonClick = "ctrlShow [88820, false]; ctrlShow [88821, false]; ctrlShow [88822, false]; ctrlShow [88823, false]; ctrlShow [88824, false]; ctrlShow [88832, false]; ctrlShow [88825, true]; ctrlShow [88826, true]; ctrlShow [88827, true]; ctrlShow [88829, true]; ctrlShow [88830, true]; ctrlShow [88831, true]; ctrlShow [88833, true]; ctrlShow [88834, true];";
            tooltip = "Ajouter un contact";
            show = 0;
        };

        class AddContactNameLabel: Life_RscText {
            idc = 88833;
            text = "Nom :";
            x = (0.6 + 0.175) * safezoneW + safezoneX;
            y = (0.418 + 0.17) * safezoneH + safezoneY;
            w = 0.13 * safezoneW;
            h = 0.03 * safezoneH;
            colorText[] = {1,1,1,1};
            colorBackground[] = {0,0,0,0};
            sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
            show = 0;
        };

        class AddContactNameInput: Life_RscEdit {
            idc = 88829;
            x = (0.6 + 0.175) * safezoneW + safezoneX;
            y = (0.418 + 0.20) * safezoneH + safezoneY;
            w = 0.13 * safezoneW;
            h = 0.03 * safezoneH;
            colorBackground[] = {0,0,0,0.5};
            colorText[] = {1,1,1,1};
            text = "";
            sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
            show = 0;
        };

        class AddContactPhoneLabel: Life_RscText {
            idc = 88834;
            text = "Numéro :";
            x = (0.6 + 0.175) * safezoneW + safezoneX;
            y = (0.418 + 0.24) * safezoneH + safezoneY;
            w = 0.13 * safezoneW;
            h = 0.03 * safezoneH;
            colorText[] = {1,1,1,1};
            colorBackground[] = {0,0,0,0};
            sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
            show = 0;
        };

        class AddContactPhoneInput: Life_RscEdit {
            idc = 88830;
            x = (0.6 + 0.175) * safezoneW + safezoneX;
            y = (0.418 + 0.27) * safezoneH + safezoneY;
            w = 0.13 * safezoneW;
            h = 0.03 * safezoneH;
            colorBackground[] = {0,0,0,0.5};
            colorText[] = {1,1,1,1};
            text = "";
            sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
            show = 0;
        };

        class SaveContactButton: Life_RscButtonMenu {
            idc = 88831;
            x = (0.6 + 0.175) * safezoneW + safezoneX;
            y = (0.418 + 0.32) * safezoneH + safezoneY;
            w = 0.13 * safezoneW;
            h = 0.03 * safezoneH;
            colorBackground[] = {0,0,0,0.7};
            colorBackgroundFocused[] = {0,0,0,0.8};
            colorBackground2[] = {0,0,0,0.7};
            colorFocused[] = {0,0,0,0.8};
            colorText[] = {1,1,1,1};
            text = "Enregistrer";
            onButtonClick = "systemChat '[SMARTPHONE][UI] Bouton Enregistrer cliqué'; _display = findDisplay 88800; _name = ctrlText (_display displayCtrl 88829); _number = ctrlText (_display displayCtrl 88830); [_name, _number] call life_fnc_addContact;";
            tooltip = "Enregistrer le contact";
            show = 0;
        };
    };
};