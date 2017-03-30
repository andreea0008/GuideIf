import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.XmlListModel 2.0
import QtQuick.Window 2.0
import QtQuick.Window 2.0

Rectangle {
    id: mainBox
    width: parent.width
    height: parent.height

    property bool isLandscape: Screen.primaryOrientation === Qt.LandscapeOrientation
    property int widthADEA: isLandscape ? (mainBox.width -(numberTrainBox.width + routeBox.width + periodBox.width))/3
                                        : (mainBox.width -(numberTrainBox.width + routeBox.width))/3

    property int fontSize: isLandscape ? Screen.height / 30 : Screen.width/45

    Component.onCompleted: {
        console.log(widthADEA, width, height)
    }

    FontLoader{
        id: font
        source: "qrc:/fonts/resource/fonts/GOST_2.30481_type_B_Bold.ttf"
    }

    Row{
        id: rowMain
        anchors.right: parent.right
        anchors.left: parent.left
        width: mainBox.width
        z: 20

        Rectangle{
            id: numberTrainBox;
            color: "#a1a1a1"
            width: parent.width/15;
            height: 35
            border.color: "red"
            border.width: 1
            Text{
                anchors.fill: parent;
                text: "N."
                font.pixelSize: fontSize
                font.family: font.name
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                color: "white"
            }
        }
        Rectangle{
            id: routeBox;
            color: "#a1a1a1"
            width: isLandscape ? (parent.width/3) : ((parent.width/3) + periodBox.width);
            height: 35
            border.color: "red"
            border.width: 1
            Text{
                anchors.fill: parent;
                text: "Маршрут"
                font.pixelSize: fontSize
                font.family: font.name
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                color: "white"
            }
        }
        Rectangle{
            id: periodBox;
            visible: isLandscape ? true : false
            enabled: isLandscape ? true : false
            color: "#a1a1a1"
            width: parent.width/4;
            height: 35
            border.color: "red"
            border.width: 1
            Text{
                anchors.fill: parent;
                text: "Перiодичнiсть"
                font.pixelSize: fontSize
                font.family: font.name
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                clip: true
                color: "white"
            }
        }
        Rectangle{
            id: arrivedBox;
            color: "#a1a1a1"
            width: widthADEA;
            height: 35
            border.color: "red"
            border.width: 1
            Text{
                anchors.fill: parent;
                text: "Прибуття"
                font.pixelSize: fontSize
                font.family: font.name
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                clip: true
                color: "white"
            }
        }
        Rectangle{
            id: departureBox;
            color: "#a1a1a1"
            width: widthADEA;
            height: 35
            border.color: "red"
            border.width: 1
            Text{
                anchors.fill: parent;
                text: "Відправлення"
                font.pixelSize: fontSize
                font.family: font.name
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                clip: true
                color: "white"
            }
        }
        Rectangle{
            id: endArrivedBox;
            color: "#a1a1a1"
            width: widthADEA;
            height: 35
            border.color: "red"
            border.width: 1
            Text{
                anchors.fill: parent;
                text: "Прибуття"
                font.pixelSize: fontSize
                font.family: font.name
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                clip: true
                color: "white"
            }
        }
    }

    XmlListModel{
        id: xmlModel
            source: "qrc:/xml/resource/xml/trainIntersity.xml"
            query: "/rss/channel/item"

            XmlRole { name: "number"; query: "number/string()" }
            XmlRole { name: "route"; query: "route/string()" }
            XmlRole { name: "description"; query: "description/string()" }
            XmlRole { name: "arrived"; query: "arrived/string()" }
            XmlRole { name: "departure"; query: "departure/string()" }
            XmlRole { name: "endArrived"; query: "endArrived/string()" }
    }

    ListView {
        anchors.top: rowMain.bottom
        width: mainBox.width;
        height: mainBox.height - 35
        model: xmlModel

        delegate: DelegateIntersity{
            trainNumber: number
            routeName: route
            routeDescription: description
            trainTimeArrived: arrived
            trainTimeDeparture: departure
            trainTimeEndArrived: endArrived
            widthTrainNumber: numberTrainBox.width
            widthRouteName: routeBox.width
            widthRouteDescription: periodBox.width
            widthTrainTimeArrived: arrivedBox.width
            widthTimeDeparture: arrivedBox.width
            widthTimeEndArrived: arrivedBox.width
        }
    }
}
