import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Window 2.0


Rectangle {
    id: root
    width: parent.width
    height: 50
    border.width: 1
    border.color: "lightgray"


    property alias timeText: time.text
    property alias routeText: route.text
    property alias heightValue: root.height
    property alias fontPixelSize: time.font.pixelSize
    property bool isLandscape: Screen.primaryOrientation === Qt.LandscapeOrientation

    FontLoader{
        id: forTextFont
        source: "qrc:/fonts/resource/fonts/GOST_2.30481_type_B_Bold.ttf"

    }

    Row{
        spacing: 20
        anchors.fill: parent
        anchors.verticalCenter: parent.verticalCenter
        anchors.leftMargin: 20


        Text {
            id: time
            color: "gray"
            font.pixelSize: 20
            font.family: forTextFont.name
            horizontalAlignment: Text.AlignRight
            text: timeText
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: 20
        }

        Text {
            id: route
            color: "gray"
            font.pixelSize: fontPixelSize
            font.family: forTextFont.name
            text: isLandscape ? time.font.pixelSize : time.font.pixelSize * 0.7
            anchors.verticalCenter: parent.verticalCenter
        }
    }
}
