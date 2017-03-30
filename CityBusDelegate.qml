import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Window 2.0


Rectangle {
    id: root
    width: Screen.width
    height: Screen.height / 4
    border.width: 1
    border.color: "lightgray"

    property alias numberText: txtNumber.text
    property alias widthNumberText: number.width
    property alias widthBoxInfo: boxMainInfo.width
    property alias routeNameTxt: nameRouteTxt.text
    property alias routeNameToTxt: nameRouteToTxt.text
    property alias routeNameFromTxt: nameRouteFromTxt.text
    property alias widthTimeWork: timeWorkBox.width
    property alias timeWorkTxt: timeWork.text
    property alias widthInterval: intervalBox.width
    property alias intervalTxt: interval.text

    property alias fontSizeNumberTimeInterval: txtNumber.font.pixelSize

    property bool isLandscape: Screen.primaryOrientation === Qt.LandscapeOrientation
    property string colorText: mouse.pressed ? "black" : "#363636"

    Component.onCompleted: {
    }

    FontLoader{
        id: forTextFont
        source: "qrc:/fonts/resource/fonts/GOST_2.30481_type_B_Bold.ttf"
    }

    Rectangle{
        anchors.fill: parent
        color: "lightgray"
        opacity: 0.2
        visible: mouse.pressed
        z: 20
    }

    MouseArea {
        id: mouse
        anchors.fill: parent
    }
    Row{
        id: rowMain
        anchors.fill: parent
        Rectangle{
            id: number
            border.width: 1
            height: root.height
            Text{
                id: txtNumber
                anchors.fill: parent
                font.pixelSize: 25
                font.family: forTextFont.name
                text: "23"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                color: colorText
            }
        }
        Rectangle{
            id: boxMainInfo
            border.width: 1
            height: root.height

            Text{
                id: nameRouteTxt
                text: "cdcdcd";
                anchors{
                    left: parent.left
                    right: parent.right
                    top: parent.top
                }

                height: boxMainInfo.height * 0.2

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize:isLandscape ? height * 0.75 : height * 0.6
                font.family: forTextFont.name
                color: colorText
            }

            Text{
                id: nameRouteToTxt
                text: "cdcdcd";
                anchors{
                    left: parent.left
                    right: parent.right
                    top: nameRouteTxt.bottom
                    margins: 5
                }

                height: boxMainInfo.height * 0.4
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignJustify
                font.pixelSize:height * 0.2
                font.family: forTextFont.name
                wrapMode: Text.WordWrap
                color: colorText
            }

            Text{
                id: nameRouteFromTxt
                text: "cdcdcd";
                anchors{
                    left: parent.left
                    right: parent.right
                    top: nameRouteToTxt.bottom
                    margins: 5
                }

                height: boxMainInfo.height * 0.4
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignJustify
                font.pixelSize:height * 0.2
                font.family: forTextFont.name
                wrapMode: Text.WordWrap
                color: colorText
            }
        }

        Rectangle{
            id: timeWorkBox
            border.width: 1
            height: root.height
            visible: isLandscape ? true : false
            Text{
                id: timeWork
                anchors.fill: parent
                font.pixelSize: 0
                font.family: forTextFont.name
                text: "23"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                color: colorText
            }
        }

        Rectangle{
            id: intervalBox
            border.width: 1
            height: root.height
            Text{
                id: interval
                anchors.fill: parent
                font.pixelSize: fontSizeNumberTimeInterval
                font.family: forTextFont.name
                text: "23"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                color: colorText
            }
        }
    }
}
