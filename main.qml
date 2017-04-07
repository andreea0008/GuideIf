import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Window 2.0

ApplicationWindow {
    id: mainBox
    visible: true
    width:  Screen.width
    height: isLandscape ? Screen.height-(Screen.height / 15): Screen.height-(Screen.height / 30)

    property bool isLandscape: Screen.primaryOrientation === Qt.LandscapeOrientation
    property int hToolBar: Screen.height * 0.1



    Component.onCompleted: {
//        console.log(Screen.primaryOrientation === Qt.PortraitOrientation)
    }

    toolBar:
        BorderImage {
        id: borderImage
        source: "qrc:/img/resource/img/toolbarRed.png"
        width: parent.width
        height: hToolBar
        border.left: 5
        border.top: 5
        border.right: 5
        border.bottom: 20

        Rectangle {
            id: backButton
            width: borderImage.height * 0.75
            height: borderImage.height * 0.75
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 20
            opacity: 1
            antialiasing: true
            radius: 5
            color:{
               if(previousImg.visible){
                  mouseBack.pressed ? "#333" : "transparent";
               }else{
                   "transparent"
               }
            }

            Image {
                id: previousImg
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.fill: parent
                source: "qrc:/img/resource/img/navigation_previous_item.png"
                visible: stack.depth > 1 ? true : false
            }
            MouseArea{
                id: mouseBack
                anchors.fill: previousImg
                onClicked: {
                    stack.pop();
                }
            }
        }

        Image {
            id: budgetLogo
            width: borderImage.height * 0.75
            height: borderImage.height * 0.75
            source:"qrc:/img/23.png"
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: backButton.right
            anchors.leftMargin: 10
            opacity: 1
            antialiasing: true
        }

        FontLoader { id: salFont; source: "qrc:/fonts/resource/fonts/SalamanderScript.otf" }

        Text {
            id: textInBorderImage
            anchors.left: budgetLogo.right
            anchors.leftMargin: 20
            anchors.horizontalCenter: borderImage.horizontalCenter
            anchors.verticalCenter: borderImage.verticalCenter
            anchors.margins: 20
            color: "#f0f7bc"
            text: qsTr("Guide IF")
            font.family: salFont.name
            font.pointSize: borderImage.height / 4
            style: Text.Outline
        }
    }

   ListModel {
        id: modelPage

        ListElement{
            title: "Автомийки"
            page: "qrc:/Autoclean.qml"
        }
        ListElement{
            title: "Аптеки"
            page: "qrc:/Pharmacy.qml"
        }

        ListElement{
            title: "Більярд"
            page: "qrc:/Billiard.qml"
        }

        ListElement{
            title: "Бюро перекладів"
            page: "qrc:/Translator.qml"
        }

        ListElement{
            title: "Готелі"
            page: "qrc:/Hotel.qml"
        }

        ListElement{
            title: "Дитячі розваги"
            page: "qrc:/KidsRoom.qml"
        }

        ListElement{
            title: "Кав'ярні"
            page: "qrc:/Coffee.qml"
        }

        ListElement{
            title: "Евакуатор"
            page: "qrc:/Evacuator.qml"
        }
        ListElement{
            title: "Кафе/Бари"
            page: "qrc:/Bar.qml"
        }

        ListElement{
            title: "Кіно"
            page: "qrc:/Movie.qml"
        }

        ListElement{
            title: "Клініко-діагностичні центри"
            page: "qrc:/CliniqueCenter.qml"
        }

        ListElement{
            title: "Нічні клуби"
            page: "qrc:/NightClub.qml"
        }

        ListElement{
            title: "Паби"
            page: "qrc:/Pub.qml"
        }

        ListElement{
            title: "Піцерії"
            page: "qrc:/Pizza.qml"
        }
        ListElement{
            title: "Ресторани"
            page: "qrc:/Restorants.qml"
        }
        ListElement{
            title: "Ремонт техніки"
            page: "qrc:/repair/Repair.qml"
        }
        ListElement{
            title: "Розваги"
            page: "qrc:/Entertaintment.qml"
        }

        ListElement{
            title: "Розклад руху"
            page: "qrc:/Shedule.qml"
        }

        ListElement{
            title: "Салони краси"
            page: "qrc:/Beauty.qml"
        }

        ListElement{
            title: "Сауни"
            page: "qrc:/Sauna.qml"
        }

        ListElement{
            title: "Стоматології"
            page: "qrc:/Dental.qml"
        }

        ListElement{
            title: "Таксі"
            page: "qrc:/Taxi.qml"
        }

        ListElement{
            title: "Театри"
            page: "qrc:/Theatre.qml"
        }

        ListElement{
            title: "Тринажерні зали"
            page: "qrc:/Gym.qml"
        }

        ListElement{
            title: "Туристичні агенції"
            page: "qrc:/Travel.qml"
        }

        ListElement{
            title: "Шиномонтаж"
            page: "qrc:/Tire.qml"
        }
/*
        ListElement{
            title: "Про программу"
            page: "qrc:/AboutUs.qml"
        }*/
    }

    StackView {
        id: stack
        anchors.fill: parent
        focus: true
        implicitWidth: 26
        implicitHeight: 26
        Keys.onReleased: {
            if (event.key === Qt.Key_Back && stack.depth > 0) {
                stack.pop();
                event.accepted = true;
            }

            if (event.key === Qt.Key_Back && stack.depth == 1){
                Qt.quit();
            }
        }
        initialItem: Item{
            width: parent.width
            height: parent.height
            ListView {
                id: list
                model:  modelPage
                anchors.fill: parent
                height: parent.height - hToolBar
                delegate: Delegate {
                    id: delegate
                    text: title
                    heightValue: Screen.height / 15
                    fontPixelSize: heightValue * 0.6
                    onClicked: stack.push(Qt.resolvedUrl(page))
                }
                focus: true
            }
        }
    }
}
