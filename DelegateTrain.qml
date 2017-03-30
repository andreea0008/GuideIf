import QtQuick 2.0
import QtQuick.Window 2.0
Rectangle {
    id: box
    radius: 0
    height: Screen.height / 15
    border.color: "lightgray"
    border.width: 1
    property alias trainNumber: numberTrain.text;
    property alias trainTime: timeTrain.text;
    property alias routeName: nameRoute.text;
    property int   fontPixelSize: box.height/2

    property string colorText: "#3A3938"

    property bool isLandscape: Screen.primaryOrientation === Qt.LandscapeOrientation
    width: parent.width

    FontLoader{
        id: font
        source: "qrc:/fonts/resource/fonts/GOST_2.30481_type_B_Bold.ttf"
    }

    Rectangle{
        anchors.fill: parent
        color: "lightgray"
        opacity: 0.7
        visible: mouse.pressed
    }

    MouseArea {
        id: mouse
        anchors.fill: parent
    }

    Row{
        spacing: 25
        anchors.fill: parent
        anchors.leftMargin: 25

        Text{
            id: timeTrain
            text: trainTime
            color: colorText
            font.family: font.name
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: fontPixelSize
            anchors. verticalCenter: parent.verticalCenter
            width: fontPixelSize*3
        }
        Text{
            id: nameRoute
            text: routeName
            color: colorText
            font.family: font.name
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: fontPixelSize
        }
        Text{
            id: numberTrain
            text: trainNumber
            color: colorText
            font.family: font.name
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: fontPixelSize
            visible: isLandscape ? true : false
        }
    }
}
