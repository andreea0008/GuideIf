import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.1
import QtQuick.Window 2.0
import "../"

Item {
    width: parent.width
    height: parent.height

    property bool isLandscape: Screen.primaryOrientation === Qt.LandscapeOrientation

    FontLoader{
        id: forTextFont
        source: "qrc:/fonts/resource/fonts/GOST_2.30481_type_B_Bold.ttf"
    }

    ListModel {
         id: modelPage
         ListElement{
             title: "Міжміський напрямок"
             page: "qrc:/station/AS-2BetweenCityRoute.qml"
         }
         ListElement{
             title: "Приміський напрямок"
             page: "qrc:/station/AS-2_SuburbanBus.qml"
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
