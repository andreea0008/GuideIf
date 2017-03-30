import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Window 2.0
import QtQuick.Controls.Styles 1.1
import "../"
Item{
    width: parent.width
    height: parent.height
    ListModel{
        id: modelPage
        ListElement{
            title: "Комп'ютер"
            page: "qrc:/repair/Computer.qml"
        }
        ListElement{
            title: "Мобільні телефони"
            page: "qrc:/repair/RepairMobile.qml"
        }
        ListElement{
            title: "Оргтехніка"
            page: "qrc:/repair/Orgtechnick.qml"
        }
        ListElement{
            title: "Побутова техніка"
            page: "qrc:/repair/Technicks.qml"
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
