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
            title: "Автобус"
            page: "qrc:/SheduleBus.qml"
        }
        ListElement{
            title: "Залізниця"
            page: "qrc:/SheduleTrains.qml"
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
