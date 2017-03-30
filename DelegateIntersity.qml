import QtQuick 2.0
import QtQuick.Window 2.0

Rectangle {
    id: box
    height: Screen.height / 10
    width: parent.width
    border.width: 1
    border.color: "#a1a1a1"

    property bool isLandscape: Screen.primaryOrientation === Qt.LandscapeOrientation

    property alias trainNumber: numberTrain.text;
    property alias widthTrainNumber: numberTrain.width
    property alias trainTimeArrived: timeTrainArrived.text;
    property alias widthTrainTimeArrived: timeTrainArrived.width;
    property alias trainTimeDeparture: timeTrainDeparture.text;
    property alias widthTimeDeparture: timeTrainDeparture.width;
    property alias trainTimeEndArrived: endArrived.text;
    property alias widthTimeEndArrived: endArrived.width;
    property alias routeName: nameRoute.text;
    property alias widthRouteName:nameRoute.width;
    property alias routeDescription: descriptionRoute.text;
    property alias widthRouteDescription: descriptionRoute.width;
    property int   fontPixelSize: isLandscape ? box.height/2 : box.height/4

    property string colorText: "#3A3938"

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
        spacing: 0
        anchors.fill: parent
        anchors.leftMargin: 10

        Text{
            id: numberTrain
            text: trainNumber
            color: colorText
            font.family: font.name
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: fontPixelSize
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
            width: widthRouteName
            clip: true
        }


        Text{
            id: descriptionRoute
            visible: isLandscape ? true : false
            width: isLandscape ? widthRouteDescription : (widthRouteDescription + widthRouteName)
            text: trainNumber
            color: colorText
            font.family: font.name
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: fontPixelSize
            wrapMode: Text.WrapAnywhere

            states: [
                State {
                    name: "not_small"
                    when: descriptionRoute.text.length > 15 && descriptionRoute.text.length <= 20
                    PropertyChanges {
                        target: descriptionRoute
                        font.pixelSize: fontPixelSize* 0.6
                    }
                },
                State {
                    name: "small"
                    when: descriptionRoute.text.length > 20 && descriptionRoute.text.length <= 45
                    PropertyChanges {
                        target: descriptionRoute
                        font.pixelSize: fontPixelSize/2
                    }
                },
                State {
                    name: "very_small"
                    when: descriptionRoute.text.length > 45
                    PropertyChanges {
                        target: descriptionRoute
                        font.pixelSize: fontPixelSize/3
                    }
                }
            ]
        }

        Text{
            id: timeTrainArrived
            text: trainTimeArrived
            color: colorText
            font.family: font.name
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: fontPixelSize
            anchors. verticalCenter: parent.verticalCenter
            width: fontPixelSize*3
        }

        Text{
            id: timeTrainDeparture
            text: trainTimeDeparture
            color: colorText
            font.family: font.name
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: fontPixelSize
            anchors. verticalCenter: parent.verticalCenter
            width: fontPixelSize*3
        }
        Text{
            id: endArrived
            text: trainTimeEndArrived
            color: colorText
            font.family: font.name
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: fontPixelSize
            anchors. verticalCenter: parent.verticalCenter
            width: fontPixelSize*3
        }
    }
}

