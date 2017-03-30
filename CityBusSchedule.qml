import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Window 2.0
import QtQuick.XmlListModel 2.0


Rectangle {
    id: root

    property bool isLandscape: Screen.primaryOrientation === Qt.LandscapeOrientation
    property int psFont: numberBox.height * 0.7

    FontLoader{
        id: forTextFont
        source: "qrc:/fonts/resource/fonts/GOST_2.30481_type_B_Bold.ttf"
    }

    Row{
        id: rowMain
        anchors.right: parent.right
        anchors.left: parent.left
        width: root.width
        height: parent.height /15
        z: 20
        Rectangle{
            id: numberBox
            width: parent.width / 10
            height: parent.height
            border.color: "red"
            border.width: 1
            color: "#a1a1a1"
            Text {
                id: numberText
                anchors.fill: parent
                text: qsTr("N")
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: psFont
                color: "white"
            }
        }
        Rectangle{
            id: routeBox
            width: isLandscape ? parent.width * 0.6 : parent.width * 0.9
            height: parent.height
            border.color: "red"
            border.width: 1
            color: "#a1a1a1"
            Text {
                id: routeText
                anchors.fill: parent
                text: qsTr("Маршрут")
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: psFont
                color: "white"
            }
        }
        Rectangle{
            id: timeWorkBox
            width: parent.width * 0.15
            height: parent.height
            border.color: "red"
            border.width: 1
            color: "#a1a1a1"
            visible: isLandscape ? true : false
            Text {
                id: timeWorkText
                anchors.fill: parent
                text: qsTr("Час роботи")
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: psFont
                wrapMode: Text.WordWrap
                color: "white"

            }
        }

        Rectangle{
            id: intervalBox
            width: parent.width * 0.15
            height: parent.height
            border.color: "red"
            border.width: 1
            color: "#a1a1a1"
            visible: isLandscape ? true : false
            Text {
                id: intervalText
                anchors.fill: parent
                text: qsTr("Інтервал")
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: psFont
                wrapMode: Text.WordWrap
                color: "white"
            }
        }
    }

    XmlListModel{
        id: xmlModel
            source: "qrc:/xml/resource/xml/routeCityBusAndTrolleybus.xml"
            query: "/rss/bus/item"

            XmlRole { name: "number"; query: "number/string()" }
            XmlRole { name: "routeName"; query: "routeName/string()" }
            XmlRole { name: "route"; query: "route/string()" }
            XmlRole { name: "fromRoute"; query: "fromRoute/string()" }
            XmlRole { name: "timeWork"; query: "timeWork/string()" }
            XmlRole { name: "interval"; query: "interval/string()" }
    }

    ListView {
        anchors.top: rowMain.bottom
        width: root.width;
        height: root.height - rowMain.height

        model: xmlModel
        focus: true
        delegate: CityBusDelegate{
            numberText: number;
            widthNumberText: numberBox.width
            widthBoxInfo: routeBox.width
            routeNameTxt: routeName
            routeNameToTxt: route
            routeNameFromTxt: fromRoute
            widthTimeWork: timeWorkBox.width
            timeWorkTxt: timeWork
            widthInterval: intervalBox.width
            intervalTxt: interval
            fontSizeNumberTimeInterval: psFont
        }
    }
}
