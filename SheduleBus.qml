import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Window 2.0
import QtQuick.Controls.Styles 1.1

Item{
    width: parent.width
    height: parent.height
    ListModel{
        id: modelPage
        ListElement{
            title: "АC-1"
            page: "qrc:/station/AS-1.qml"
        }
        ListElement{
            title: "АC-2"
            page: "qrc:/station/AS-2.qml"
        }
        ListElement{
            title: "АC-3"
            page: "qrc:/station/AS-3.qml"
        }
        ListElement{
            title: "АC-4"
            page: "qrc:/station/AS-4.qml"
        }
        ListElement{
            title: "Міські маршрути"
            page: "qrc:/schedule/CityBusSchedule.qml"
        }
        ListElement{
            title: "Тролейбуси"
            page: "qrc:/schedule/CityTrolleybusSchedule.qml"
        }
    }

    ScrollView {
        anchors.fill: parent

        flickableItem.interactive: true

        ListView {
            model: modelPage
            delegate: Delegate {
                text: title
                heightValue: Screen.height / 15
                fontPixelSize: heightValue * 0.6
                onClicked: stack.push(Qt.resolvedUrl(page))
            }
        }

        style: ScrollViewStyle {
            transientScrollBars: true
            handle: Item {
                implicitWidth: 14
                implicitHeight: 26
                Rectangle {
                    color: "#424246"
                    anchors.fill: parent
                    anchors.topMargin: 6
                    anchors.leftMargin: 4
                    anchors.rightMargin: 4
                    anchors.bottomMargin: 6
                }
            }
            scrollBarBackground: Item {
                implicitWidth: 14
                implicitHeight: 26
            }
        }
    }
}
